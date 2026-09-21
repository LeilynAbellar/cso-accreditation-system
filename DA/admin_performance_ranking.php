<?php
include('admin_include/header.php');
include('admin_include/navbar.php');
include('include/db_connect.php');

function executeQuery($conn, $query, $errorMessage) {
    $result = mysqli_query($conn, $query);
    if (!$result) {
        die("$errorMessage: " . mysqli_error($conn));
    }
    return $result;
}

// Fetch Ranking Weights
$query_weights = "SELECT * FROM ranking_weights LIMIT 1";
$result_weights = executeQuery($conn, $query_weights, "Fetching Ranking Weights Failed");
$weights = mysqli_fetch_assoc($result_weights);

// Assign weights
$weightSolvency = floatval($weights['weightSolvency'] ?? 0.10);
$weightLiquidity = floatval($weights['weightLiquidity'] ?? 0.10);
$weightROI = floatval($weights['weightROI'] ?? 0.10);
$weightCompletionRate = floatval($weights['weightCompletionRate'] ?? 0.10);
$weightApprovalRate = floatval($weights['weightApprovalRate'] ?? 0.10);
$weightCompliance = floatval($weights['weightCompliance'] ?? 0.05);
$weightCommunityEngagement = floatval($weights['weightCommunityEngagement'] ?? 0.05);
$weightProjectDelayImpact = floatval($weights['weightProjectDelayImpact'] ?? 0.10);
$weightBudgetDeviationImpact = floatval($weights['weightBudgetDeviationImpact'] ?? 0.10);

// Query Template for both Top CSOs and All CSOs
$cso_query_base = "
    SELECT 
        c.id, 
        c.cso_name, 
        CONCAT(cr.first_name, ' ', cr.last_name) AS chairperson_name,
        cr.profile_image,

        -- Latest financial data
        latest_fr.solvency,
        latest_fr.liquidity,
        latest_fr.roi,

        -- Project metrics
        (CASE WHEN c.total_projects > 0 
            THEN (c.completed_projects / c.total_projects) * 100 ELSE 0 END) AS completion_rate,
        (CASE WHEN p.total_proposals > 0 
            THEN (p.approved_proposals / p.total_proposals) * 100 ELSE 0 END) AS approval_rate,

        -- Negative metrics
        COALESCE(neg.total_days_over, 0) AS days_over,
        COALESCE(neg.total_budget_over, 0) AS budget_over,

        -- Nullable metrics
        COALESCE(e.compliance_score, 0) AS compliance_score,
        COALESCE(e.community_engagement_score, 0) AS community_engagement_score,

        -- Performance Score: Financial + Project-based
        (
            -- Financial category
            (
                latest_fr.solvency * $weightSolvency +
                latest_fr.liquidity * $weightLiquidity +
                latest_fr.roi * $weightROI
            )
            +
            -- Project-based category
            (
                (CASE WHEN c.total_projects > 0 
                    THEN (c.completed_projects / c.total_projects) * 100 ELSE 0 END) * $weightCompletionRate +
                (CASE WHEN p.total_proposals > 0 
                    THEN (p.approved_proposals / p.total_proposals) * 100 ELSE 0 END) * $weightApprovalRate +
                COALESCE(e.compliance_score, 0) * $weightCompliance +
                COALESCE(e.community_engagement_score, 0) * $weightCommunityEngagement
            )
            -
            -- Penalties
            (COALESCE(neg.total_days_over, 0) * $weightProjectDelayImpact) -
            (COALESCE(neg.total_budget_over, 0) * $weightBudgetDeviationImpact)
        ) AS performance_score

    FROM (
        SELECT 
            c.id,
            c.cso_name,
            COUNT(DISTINCT all_pr.id) AS total_projects,
            COUNT(DISTINCT pr.id) AS completed_projects
        FROM cso_chairperson c
        LEFT JOIN project_cso pc ON c.id = pc.cso_id
        LEFT JOIN projects pr ON pc.project_id = pr.id 
            AND pr.status = 'Completed' 
            AND YEAR(pr.created_at) = YEAR(CURDATE())
        LEFT JOIN projects all_pr ON pc.project_id = all_pr.id 
            AND YEAR(all_pr.created_at) = YEAR(CURDATE())
        GROUP BY c.id, c.cso_name
    ) c
    LEFT JOIN cso_representative cr ON c.cso_name = cr.cso_name
    LEFT JOIN (
        SELECT fr1.*
        FROM financial_report fr1
        INNER JOIN (
            SELECT cso_representative_id, MAX(upload_date) AS latest_upload
            FROM financial_report
            WHERE YEAR(upload_date) = YEAR(CURDATE())
            GROUP BY cso_representative_id
        ) fr2 
        ON fr1.cso_representative_id = fr2.cso_representative_id 
        AND fr1.upload_date = fr2.latest_upload
    ) latest_fr ON cr.id = latest_fr.cso_representative_id
    LEFT JOIN cso_evaluations e ON c.id = e.cso_id
    LEFT JOIN (
        SELECT 
            pc.cso_id,
            SUM(pr.days_over) AS total_days_over,
            SUM(pr.budget_over) AS total_budget_over
        FROM project_cso pc
        JOIN projects pr ON pc.project_id = pr.id
        WHERE YEAR(pr.created_at) = YEAR(CURDATE())
        GROUP BY pc.cso_id
    ) neg ON c.id = neg.cso_id
    LEFT JOIN (
        SELECT 
            cr.cso_name, 
            COUNT(p.id) AS total_proposals, 
            SUM(CASE WHEN p.status = 'Approved' THEN 1 ELSE 0 END) AS approved_proposals
        FROM proposal p
        JOIN cso_representative cr ON p.cso_representative_id = cr.id
        WHERE YEAR(p.status_updated_at) = YEAR(CURDATE())
        GROUP BY cr.cso_name
    ) p ON c.cso_name = p.cso_name
";

// Query for Top CSOs
$query_top_csos = $cso_query_base . " ORDER BY performance_score DESC LIMIT 5";
$result_top_csos = executeQuery($conn, $query_top_csos, "Top CSOs Query Failed");
$top_csos = mysqli_fetch_all($result_top_csos, MYSQLI_ASSOC);

// Query for All CSOs (table)
$query_all_csos = $cso_query_base . " ORDER BY performance_score DESC";
$result_all_csos = executeQuery($conn, $query_all_csos, "All CSOs Query Failed");
$all_csos = mysqli_fetch_all($result_all_csos, MYSQLI_ASSOC);

mysqli_close($conn);
?>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- External CSS/JS -->
        <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <style>
            body {
                font-family: 'Nunito', sans-serif;
            }

            .container-fluid { 
            padding: 20px; 
            }

            h2, h3 { 
                color: #0A593A; 
                font-weight: bold; 
            }
            h5, label {
                    font-weight: bold;
                    color: #0A593A;
                }
            th {
                background-color: #0A593A;
                color: white;
            }

            .nav-tabs .nav-link {
                color: #0A593A;
            }

            .table-container {
                overflow-x: hidden;
            }

            .table {
                width: 100%;
                white-space: nowrap;
            }

            .card {
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s ease, box-shadow 0.2s ease;
                background-color: #ffffff !important;
            }

            .card:hover {
                transform: translateY(-1px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            /* Table Card Styling */
            .table-card {
                background-color: #f1f8f3;
                border-left: 5px solid #0A593A;
                overflow: hidden; /* Prevent table overflow from breaking the card */
            }

            .table-card:hover {
                transform: none;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .table-card .card-header {
                background-color: #0A593A;
                color: white;
                font-size: 1.05rem;
            }

            .table-card .table-responsive {
                padding: 15px;
                border-radius: 5px;
                background-color: white;
            }

            /* Table Adjustments */
            .table {
                font-size: 0.9rem;
                margin-bottom: 0;
            }

            .table th {
                background-color: #0A593A;
                color: white;
            }

            .chart-container {
                position: relative;
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .btn-custom {
                background-color: #0A593A; 
                color: white;   
                border: none;
                font-size: 0.9rem;
                transition: color 0.3s ease, text-decoration 0.3s ease;
            }

            .btn-custom:hover {
                background-color: #0A593A;
                color: white; 
                text-decoration: underline;
            }

            .modal-header {
                background-color: #0A593A; 
                color: white; 
            }

            .btn-save-weights{
                background-color: #0A593A; /* Same green as the card header */
                color: white; /* White text */
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px; /* Rounded corners */
                transition: all 0.3s ease; /* Smooth transition */
            }

            .btn-save-weights:hover {
                background-color: #084C2C; /* Darker shade of green for hover */
                color: white;
            }

            /* Cancel Button */
            .btn-cancel {
                background-color: #A52A2A; /* Red background */
                color: white; /* White text */
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                transition: all 0.3s ease;
            }

            .btn-cancel:hover {
                background-color: #7B1E1E; /* Darker red for hover */
                color: white;
            }

            /* Custom styling for the Edit Scores button */
            .edit-scores-btn {
                background-color: transparent;
                color: #0A593A;
                border: 1px solid #0A593A;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .edit-scores-btn:hover {
                background-color: #0A593A;
                color: #ffffff;
            }

            .full-height-container {
            display: flex;
            flex-direction: column;
            }

            #csoDetailsWrapper {
                overflow-x: auto;
            }

            #csoDetails table {
                width: 100%;
                table-layout: fixed;
                word-wrap: break-word;
            }
            .yellow-line {
                background-color: rgb(253, 199, 5);
                height: 7px;
                width: 100%;
                margin: 0;
                padding: 0;
                position: relative;
                z-index: 1;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid full-height-container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Weighted Score CSO Performance Rankings</h2>
                    <div class="yellow-line"></div>
                    <br>
                    <canvas id="rankingsChart" style="height: 20%;"></canvas>
                    <br>
                    <div class="table-responsive" style="overflow-x: auto;">
                        <table id="rankingsTable" class="table table-striped table-bordered m-0">
                            <thead>
                                <tr>
                                    <th>Rank</th>
                                    <th>CSO Name</th>
                                    <th>Chairperson Name</th>
                                    <th>Solvency</th>
                                    <th>Liquidity</th>
                                    <th>ROI</th>
                                    <th>Completion Rate (%)</th>
                                    <th>Approval Rate (%)</th>
                                    <th>Compliance</th>
                                    <th>Community Engagement</th>
                                    <th>Project Delay Impact (Days)</th>
                                    <th>Budget Deviation Impact (PHP)</th>
                                    <th>Performance Score</th>
                                    <th>Actions</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($all_csos as $index => $cso): ?>
                                <tr>
                                    <td><?php echo htmlspecialchars($index + 1); ?></td>
                                    <td><?php echo htmlspecialchars($cso['cso_name']); ?></td>
                                    <td><?php echo htmlspecialchars($cso['chairperson_name']); ?></td>
                                    <td><?php echo htmlspecialchars($cso['solvency']); ?></td>
                                    <td><?php echo htmlspecialchars($cso['liquidity']); ?></td>
                                    <td><?php echo htmlspecialchars($cso['roi']); ?></td>
                                    <td><?php echo htmlspecialchars(number_format($cso['completion_rate'], 2)); ?></td>
                                    <td><?php echo htmlspecialchars(number_format($cso['approval_rate'], 2)); ?></td>
                                    <td><?php echo htmlspecialchars($cso['compliance_score']); ?></td>
                                    <td><?php echo htmlspecialchars($cso['community_engagement_score']); ?></td>
                                    <td><?php echo htmlspecialchars($cso['days_over']); ?></td> <!-- Project Delay Impact -->
                                    <td><?php echo htmlspecialchars(number_format($cso['budget_over'], 2)); ?></td> <!-- Budget Deviation Impact -->
                                    <td><?php echo htmlspecialchars(number_format($cso['performance_score'], 4)); ?></td>
                                    <td>
                                    <!-- Edit Scores Button -->
                                        <button 
                                            class="btn btn-sm edit-scores-btn"
                                            data-cso-id="<?php echo htmlspecialchars($cso['id']); ?>" 
                                            data-cso-name="<?php echo htmlspecialchars($cso['cso_name']); ?>"
                                            data-compliance="<?php echo htmlspecialchars($cso['compliance_score']); ?>"
                                            data-community-engagement="<?php echo htmlspecialchars($cso['community_engagement_score']); ?>"
                                        >
                                        Edit Scores
                                        </button>
                                    </td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>    
                        </table>
                        <br>
                        <button class="btn btn-custom float-end" data-bs-toggle="modal" data-bs-target="#weightUpdateModal">
                        Customize Weights
                        </button>
                    </div>
                </div>
            </div>
        </div>

            <!-- Ranking Weights Modal -->
            <div class="modal fade" id="weightUpdateModal" tabindex="-1" aria-labelledby="weightUpdateModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="weightUpdateModalLabel" style="color:white; font-weight:bold;">Customize Ranking Weights</h5>
                        </div>
                        <div class="modal-body">
                            <!-- Success and Error Alerts -->
                            <div id="successAlert" class="alert alert-success d-none" role="alert">
                                Ranking weights updated successfully!
                            </div>
                            <div id="errorAlert" class="alert alert-danger d-none" role="alert">
                                Failed to update ranking weights.
                            </div>
                            <form id="rankingWeightsForm">
                                <div id="weightsError" class="text-danger mb-3"></div>
                                <div class="row">
                                    <!-- Existing weight inputs -->
                                    <div class="col-md-4 mb-3">
                                        <label for="weightSolvency" class="form-label">Solvency:</label>
                                        <input type="number" id="weightSolvency" name="weightSolvency" class="form-control" value="<?php echo htmlspecialchars($weightSolvency); ?>" step="0.01" min="0" max="1" required>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="weightLiquidity" class="form-label">Liquidity:</label>
                                        <input type="number" id="weightLiquidity" name="weightLiquidity" class="form-control" value="<?php echo htmlspecialchars($weightLiquidity); ?>" step="0.01" min="0" max="1" required>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="weightROI" class="form-label">ROI:</label>
                                        <input type="number" id="weightROI" name="weightROI" class="form-control" value="<?php echo htmlspecialchars($weightROI); ?>" step="0.01" min="0" max="1" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- Grouped Criteria weight inputs -->
                                    <div class="col-md-6 mb-3">
                                        <label for="weightCompletionRate" class="form-label">Completion Rate:</label>
                                        <input type="number" id="weightCompletionRate" name="weightCompletionRate" class="form-control" value="<?php echo htmlspecialchars($weightCompletionRate); ?>" step="0.01" min="0" max="1" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="weightApprovalRate" class="form-label">Approval Rate:</label>
                                        <input type="number" id="weightApprovalRate" name="weightApprovalRate" class="form-control" value="<?php echo htmlspecialchars($weightApprovalRate); ?>" step="0.01" min="0" max="1" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- Non-Numerical Criteria weight inputs (Point System) -->
                                    <div class="col-md-4 mb-3">
                                        <label for="weightCompliance" class="form-label">Compliance:</label>
                                        <input type="number" id="weightCompliance" name="weightCompliance" class="form-control" value="<?php echo htmlspecialchars($weightCompliance); ?>" step="0.01" min="0" max="1" required>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="weightCommunityEngagement" class="form-label">Community Engagement:</label>
                                        <input type="number" id="weightCommunityEngagement" name="weightCommunityEngagement" class="form-control" value="<?php echo htmlspecialchars($weightCommunityEngagement); ?>" step="0.01" min="0" max="1" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- Negative Criteria weight inputs -->
                                    <div class="col-md-6 mb-3">
                                        <label for="weightProjectDelayImpact" class="form-label">Project Delay Impact:</label>
                                        <input type="number" id="weightProjectDelayImpact" name="weightProjectDelayImpact" class="form-control" value="<?php echo htmlspecialchars($weightProjectDelayImpact); ?>" step="0.01" min="0" max="1" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="weightBudgetDeviationImpact" class="form-label">Budget Deviation Impact:</label>
                                        <input type="number" id="weightBudgetDeviationImpact" name="weightBudgetDeviationImpact" class="form-control" value="<?php echo htmlspecialchars($weightBudgetDeviationImpact); ?>" step="0.01" min="0" max="1" required>
                                    </div>
                                </div>
                                <br>
                                <button type="submit" class="btn btn-save-weights">Save Weights</button>
                                <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Edit Scores Modal -->
            <div class="modal fade" id="editScoresModal" tabindex="-1" aria-labelledby="editScoresModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="editScoresForm">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editScoresModalLabel" style="color:white; font-weight:bold;">Edit Non-Numerical Scores</h5>
                            </div>
                            <!-- Modal Body (unchanged) -->
                            <div class="modal-body">
                                <!-- Success and Error Alerts -->
                                <div id="editSuccessAlert" class="alert alert-success d-none" role="alert">
                                    Scores updated successfully!
                                </div>
                                <div id="editErrorAlert" class="alert alert-danger d-none" role="alert">
                                    Failed to update scores.
                                </div>
                                <div class="mb-3">
                                    <label for="complianceScore" class="form-label">Compliance (1-5):</label>
                                    <input type="number" id="complianceScore" name="complianceScore" class="form-control" min="1" max="5" required>
                                </div>
                                <div class="mb-3">
                                    <label for="communityEngagementScore" class="form-label">Community Engagement (1-5):</label>
                                    <input type="number" id="communityEngagementScore" name="communityEngagementScore" class="form-control" min="1" max="5" required>
                                </div>
                                <input type="hidden" id="csoId" name="csoId">
                                <br>
                            </div>
                            <div class="modal-footer">
                                <!-- Use custom classes to match the Customize Weights modal -->
                                <button type="submit" class="btn btn-save-weights">Save Scores</button>
                                <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Include jQuery, Bootstrap JS, DataTables JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap5.min.css">

        <!-- Custom JavaScript -->
        <script>
            $(document).ready(function () {
                // Toggle Sidebar
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                    $('#content').toggleClass('active');
                });

                // Initialize DataTable
                $('#rankingsTable').DataTable({
                    responsive: false,
                    autoWidth: false,
                    scrollX: true,
                    scrollY: true,
                    pageLength: 20,
                    lengthMenu: [10,20, 30, 50],
                    stripeClasses: [],
                    language: {
                        emptyTable: "No CSOs found.",
                        zeroRecords: "No matching records found."
                    }
                });

                // Handle Ranking Weights Form Submission
                $('#rankingWeightsForm').on('submit', function (event) {
                event.preventDefault(); // Prevent form submission

                // Collect form data
                const formData = {
                    weightSolvency: parseFloat($('#weightSolvency').val()),
                    weightLiquidity: parseFloat($('#weightLiquidity').val()),
                    weightROI: parseFloat($('#weightROI').val()),
                    weightCompletionRate: parseFloat($('#weightCompletionRate').val()),
                    weightApprovalRate: parseFloat($('#weightApprovalRate').val()),
                    weightCompliance: parseFloat($('#weightCompliance').val()),
                    weightCommunityEngagement: parseFloat($('#weightCommunityEngagement').val()),
                    weightProjectDelayImpact: parseFloat($('#weightProjectDelayImpact').val()),
                    weightBudgetDeviationImpact: parseFloat($('#weightBudgetDeviationImpact').val())
                };

                // Validate that the total weight equals 1
                const totalWeight = formData.weightSolvency + formData.weightLiquidity + formData.weightROI + formData.weightCompletionRate + formData.weightApprovalRate + formData.weightCompliance + formData.weightCommunityEngagement + formData.weightProjectDelayImpact + formData.weightBudgetDeviationImpact;
                if (Math.abs(totalWeight - 1) > 0.0001) {
                    $('#weightsError').text("The total weight must equal 1.");
                    return;
                } else {
                    $('#weightsError').text("");
                }

                // Send data to the PHP backend via AJAX
                $.ajax({
                    url: 'update_weights.php',  // Ensure this path is correct
                    method: 'POST',
                    data: formData,
                    dataType: 'json', // Expect JSON response
                    success: function (response) {
                        if (response.status === 'success') {
                            $('#successAlert').removeClass('d-none').text(response.message);
                            $('#errorAlert').addClass('d-none');
                            // Optionally, reload the page or update the rankings table to reflect new weights
                            setTimeout(() => {
                                $('#weightUpdateModal').modal('hide');
                                location.reload(); // Reload to fetch updated data
                            }, 1500);
                        } else {
                            $('#errorAlert').removeClass('d-none').text(response.message);
                            $('#successAlert').addClass('d-none');
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX Error:", status, error);
                        console.error("Response Text:", xhr.responseText);
                        $('#errorAlert').removeClass('d-none').text("Error: " + xhr.status + " " + xhr.statusText);
                        $('#successAlert').addClass('d-none');
                    }
                });
            });

                // Handle Edit Scores Button Click
                $('.edit-scores-btn').on('click', function () {
                    // Retrieve CSO data from data attributes
                    var csoId = $(this).data('cso-id');
                    var csoName = $(this).data('cso-name');
                    var compliance = $(this).data('compliance');
                    var communityEngagement = $(this).data('community-engagement');
                    
                    // Populate the modal with CSO data
                    $('#csoName').text(csoName);
                    $('#complianceScore').val(compliance);
                    $('#communityEngagementScore').val(communityEngagement);
                    $('#csoId').val(csoId);
                    
                    // Reset alerts
                    $('#editSuccessAlert').addClass('d-none');
                    $('#editErrorAlert').addClass('d-none');
                    
                    // Show the modal
                    $('#editScoresModal').modal('show');
                });
                
                // Handle Edit Scores Form Submission
                $('#editScoresForm').on('submit', function (event) {
                    event.preventDefault(); // Prevent default form submission
                    
                    // Collect form data
                    var formData = {
                        csoId: $('#csoId').val(),
                        complianceScore: $('#complianceScore').val(),
                        communityEngagementScore: $('#communityEngagementScore').val()
                    };
                    
                    // Validate scores are between 1 and 5
                    if (
                        formData.complianceScore < 1 || formData.complianceScore > 5 ||
                        formData.communityEngagementScore < 1 || formData.communityEngagementScore > 5
                    ) {
                        $('#editErrorAlert').removeClass('d-none').text('Scores must be between 1 and 5.');
                        $('#editSuccessAlert').addClass('d-none');
                        return;
                    } else {
                        $('#editErrorAlert').addClass('d-none').text('');
                    }
                    
                    // Send AJAX request to update_scores.php
                    $.ajax({
                        url: 'update_scores.php', // Ensure this path is correct
                        method: 'POST',
                        data: formData,
                        dataType: 'json',
                        success: function (response) {
                            if (response.status === 'success') {
                                $('#editSuccessAlert').removeClass('d-none').text(response.message);
                                $('#editErrorAlert').addClass('d-none');
                                
                                // Update the table row with new scores without reloading
                                var button = $('.edit-scores-btn[data-cso-id="' + formData.csoId + '"]');
                                button.data('compliance', formData.complianceScore);
                                button.data('community-engagement', formData.communityEngagementScore);
                                
                                // Find the table row and update the score cells
                                var row = button.closest('tr');
                                row.find('td').eq(9).text(formData.complianceScore); // Compliance
                                row.find('td').eq(10).text(formData.communityEngagementScore); // Community Engagement
                                
                                // Optionally, recalculate the performance score if necessary
                                
                                // Hide the modal after a short delay
                                setTimeout(function () {
                                    $('#editScoresModal').modal('hide');
                                }, 1000);
                            } else {
                                $('#editErrorAlert').removeClass('d-none').text(response.message);
                                $('#editSuccessAlert').addClass('d-none');
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error("AJAX Error:", status, error);
                            $('#editErrorAlert').removeClass('d-none').text("An error occurred while updating scores.");
                            $('#editSuccessAlert').addClass('d-none');
                        }
                    });
                });
            });
        </script>
        <script>
    var csoNames = <?php echo json_encode(array_column($top_csos, 'cso_name')); ?>;
    var performanceScores = <?php echo json_encode(array_column($top_csos, 'performance_score')); ?>;

    // Get individual metric arrays
    var solvencyScores = <?php echo json_encode(array_column($top_csos, 'solvency')); ?>;
    var liquidityScores = <?php echo json_encode(array_column($top_csos, 'liquidity')); ?>;
    var roiScores = <?php echo json_encode(array_column($top_csos, 'roi')); ?>;
    var completionRates = <?php echo json_encode(array_column($top_csos, 'completion_rate')); ?>;
    var approvalRates = <?php echo json_encode(array_column($top_csos, 'approval_rate')); ?>;
    var complianceScores = <?php echo json_encode(array_column($top_csos, 'compliance_score')); ?>;
    var communityEngagementScores = <?php echo json_encode(array_column($top_csos, 'community_engagement_score')); ?>;
    var projectDelayImpact = <?php echo json_encode(array_column($top_csos, 'days_over')); ?>;
    var budgetDeviationImpact = <?php echo json_encode(array_column($top_csos, 'budget_over')); ?>;

    // Combine metrics into Financial and Project-based
    var financialScores = solvencyScores.map((s, i) =>
        (parseFloat(s) || 0) +
        (parseFloat(liquidityScores[i]) || 0) +
        (parseFloat(roiScores[i]) || 0)
    );

    var projectBasedScores = completionRates.map((c, i) =>
        (parseFloat(c) || 0) +
        (parseFloat(approvalRates[i]) || 0) +
        (parseFloat(complianceScores[i]) || 0) +
        (parseFloat(communityEngagementScores[i]) || 0) -
        (parseFloat(projectDelayImpact[i]) || 0) -
        (parseFloat(budgetDeviationImpact[i]) || 0)
    );

    var ctx = document.getElementById('rankingsChart').getContext('2d');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: csoNames,
            datasets: [
                {
                    label: 'Financial',
                    data: financialScores,
                    backgroundColor: 'rgba(53, 142, 212, 0.7)',
                    borderColor: 'rgba(53, 142, 212, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Project-Based',
                    data: projectBasedScores,
                    backgroundColor: 'rgba(155, 188, 109, 0.7)',
                    borderColor: 'rgba(155, 188, 109, 1)',
                    borderWidth: 1
                },
                {
                    type: 'line',
                    label: 'Performance Score',
                    data: performanceScores,
                    borderColor: 'rgba(0, 0, 0, 1)',
                    backgroundColor: 'rgba(0, 0, 0, 0.1)',
                    borderWidth: 3,
                    tension: 0.3,
                    fill: false,
                    yAxisID: 'y1',
                    pointRadius: 4,
                    pointHoverRadius: 6
                }
            ]
        },
        options: {
            responsive: true,
            interaction: {
                mode: 'index',
                intersect: false
            },
            scales: {
                x: {
                    title: {
                        display: true,
                        text: 'CSO Name',
                        font: { size: 12, weight: 'bold' }
                    },
                    ticks: {
                        maxRotation: 60,
                        minRotation: 40,
                        autoSkip: false,
                        font: { size: 10 }
                    }
                },
                y: {
                    type: 'linear',
                    position: 'left',
                    title: {
                        display: true,
                        text: 'Category Scores',
                        font: { size: 12, weight: 'bold' }
                    },
                    beginAtZero: true
                },
                y1: {
                    type: 'linear',
                    position: 'right',
                    title: {
                        display: true,
                        text: 'Performance Score',
                        font: { size: 12, weight: 'bold' }
                    },
                    grid: {
                        drawOnChartArea: false
                    },
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    position: 'right',
                    labels: {
                        boxWidth: 15,
                        font: { size: 9 }
                    }
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return `${context.dataset.label}: ${context.parsed.y}`;
                        }
                    }
                }
            }
        }
    });
</script>

    </body>
    </html>