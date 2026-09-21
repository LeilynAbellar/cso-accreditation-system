function initMilestoneManagement() {
    // Get project dates from global JS variables that were set by PHP
    // These would be set in your PHP code with something like:
    // echo "var projectStartDate = '" . date('Y-m-d', $projectStart) . "';";
    // echo "var projectEndDate = '" . date('Y-m-d', $projectEnd) . "';";
    const projectStartDate = window.projectStartDate || '';
    const projectEndDate = window.projectEndDate || '';
    
    console.log("Project date range for validation:", projectStartDate, "to", projectEndDate);
    
    // Initialize Select2 for milestone task selection
    $('.milestone-tasks-select').select2({
        placeholder: "Select associated tasks",
        allowClear: true,
        width: '100%'
    });
    
    // Initialize DataTable for milestones
    if ($.fn.DataTable.isDataTable('#milestonesTable')) {
        $('#milestonesTable').DataTable().destroy();
    }
    
    $('#milestonesTable').DataTable({
        "order": [[0, "desc"]],
        "pageLength": 25,
        "lengthMenu": [10, 25, 50, 100, -1],
        "lengthChange": true,
        "columnDefs": [
            { "className": "dt-nowrap", "targets": [2, 3, 5] }
        ]
    });
    
    // Use event delegation instead of direct binding
    $(document).off('click', '.view-milestone-btn').on('click', '.view-milestone-btn', function() {
        const id = $(this).data('id');
        const title = $(this).data('title');
        const description = $(this).data('description');
        const targetDate = $(this).data('target-date');
        const actualDate = $(this).data('actual-date') || 'Not reached yet';
        const comments = $(this).data('comments');
        const status = $(this).data('status');
        const file = $(this).data('file');
        
        // Load data into the view modal
        $('#viewMilestoneTitle').val(title);
        $('#viewMilestoneDescription').val(description);
        $('#viewMilestoneTargetDate').val(targetDate);
        $('#viewMilestoneActualDate').val(actualDate);
        $('#viewMilestoneComments').val(comments);
        $('#viewMilestoneStatus').val(status);
        
        // Load associated tasks
        loadMilestoneAssociatedTasks(id);
        
        // Set file link if available
        if (file && file.trim() !== '') {
            const fileName = file.split('/').pop();
            $('#viewMilestoneFileLink').html(`<a href="${file}" target="_blank">${fileName}</a>`);
        } else {
            $('#viewMilestoneFileLink').text('No file uploaded');
        }
        
        // Show the modal
        $('#viewMilestoneModal').modal('show');
    });
    
    // Edit milestone button click handler - using event delegation
    $(document).off('click', '.edit-milestone-btn').on('click', '.edit-milestone-btn', function() {
        const id = $(this).data('id');
        const title = $(this).data('title');
        const description = $(this).data('description');
        const targetDate = $(this).data('target-date');
        const actualDate = $(this).data('actual-date');
        const comments = $(this).data('comments');
        const status = $(this).data('status');
        const file = $(this).data('file') || '';
        
        // Load data into the edit modal
        $('#editMilestoneId').val(id);
        $('#editMilestoneTitle').val(title);
        $('#editMilestoneDescription').val(description);
        $('#editMilestoneTargetDate').val(targetDate);
        $('#editMilestoneActualDate').val(actualDate);
        $('#editMilestoneComments').val(comments);
        $('#editMilestoneStatus').val(status);
        
        // Store the original file path for validation
        $('#editMilestoneModal').data('file', file);
        
        // Load associated tasks
        loadMilestoneAssociatedTasks(id, true);
        
        // Update available statuses based on actual date
        updateMilestoneAvailableStatuses($('#editMilestoneForm'));
        
        // Show the modal
        $('#editMilestoneModal').modal('show');
    });
    
    // Add validation for target date within project range
    $('input[name="target_date"]').off('change').on('change', function() {
        validateMilestoneTargetDate($(this), projectStartDate, projectEndDate);
    });
    
    // Actual date change handler
    $('input[name="actual_date"]').off('change').on('change', function() {
        const form = $(this).closest('form');
        updateMilestoneAvailableStatuses(form);
    });
    
    // Status change validation
    $('select[name="status"]').off('change').on('change', function() {
        validateMilestoneStatus($(this));
    });
    
    // Form submission validation
    $('#addMilestoneForm, #editMilestoneForm').off('submit').on('submit', function(e) {
        console.log("Milestone form submission attempted");
        const tasksData = getTasksData();
        console.log("Tasks data for validation:", tasksData);
        
        const isValid = validateMilestoneForm($(this), e, tasksData, projectStartDate, projectEndDate);
        console.log("Form validation result:", isValid);
        
        if (!isValid) {
            console.log("Preventing form submission due to validation failure");
            e.preventDefault();
            return false;
        }
        
        console.log("Form validation passed, allowing submission");
        return true;
    });
    
    // Initialize available statuses for all forms
    $('form').each(function() {
        updateMilestoneAvailableStatuses($(this));
    });
}

// Helper function to get tasks data from the page
function getTasksData() {
    const tasksData = [];
    console.log("Retrieving tasks data...");
    
    $('#tasksTable tbody tr').each(function() {
        const $row = $(this);
        const taskId = $row.find('td:first').text().trim();
        const status = $row.find('td:contains("Done"), td:contains("Pending"), td:contains("In Progress")').text().trim();
        
        console.log(`Task found: ID ${taskId}, Status: ${status}`);
        tasksData.push({
            id: taskId,
            status: status
        });
    });
    
    console.log(`Total tasks found: ${tasksData.length}`);
    return tasksData;
}

// Function to validate that target date is within project date range
function validateMilestoneTargetDate(targetDateField, projectStartDate, projectEndDate) {
    console.log("Validating milestone target date:", targetDateField.val());
    console.log("Project date range:", projectStartDate, "to", projectEndDate);
    
    const targetDate = new Date(targetDateField.val());
    const startDate = new Date(projectStartDate);
    const endDate = new Date(projectEndDate);
    
    // Clear previous validation message
    targetDateField.siblings('.validation-message').remove();
    
    // Only validate if target date has a value and project dates are valid
    if (targetDateField.val() && projectStartDate && projectEndDate) {
        if (targetDate < startDate) {
            showValidationMessage(targetDateField, "Target date cannot be before project start date (" + projectStartDate + ")");
            return false;
        }
        
        if (targetDate > endDate) {
            showValidationMessage(targetDateField, "Target date cannot be after project end date (" + projectEndDate + ")");
            return false;
        }
    }
    
    return true;
}

// Function to validate milestone status based on actual date
function validateMilestoneStatus(statusDropdown) {
    const statusVal = $(statusDropdown).val();
    const form = $(statusDropdown).closest('form');
    const actualDateField = form.find('input[name="actual_date"]');
    const actualDate = actualDateField.val();
    
    // Clear previous validation messages
    actualDateField.siblings('.validation-message').remove();
    
    let isValid = true;
    
    // Status-specific validations
    if (statusVal === 'Achieved') {
        // For Achieved: require actual date
        if (!actualDate) {
            showValidationMessage(actualDateField, "Actual date is required for Achieved status");
            isValid = false;
        }
    }
    
    return isValid;
}

// Function to update available status options based on actual date field
function updateMilestoneAvailableStatuses(form) {
    const actualDate = form.find('input[name="actual_date"]').val();
    const statusDropdown = form.find('[name="status"]');
    
    // Reset all options to enabled first
    statusDropdown.find('option').prop('disabled', false);
    
    if (actualDate) {
        // Actual date is filled - can only select "Achieved"
        statusDropdown.find('option[value="Pending"]').prop('disabled', true);
        statusDropdown.find('option[value="In Progress"]').prop('disabled', true);
        statusDropdown.find('option[value="Nearly Complete"]').prop('disabled', true);
        
        // Auto-select "Achieved" if current selection is disabled
        if (statusDropdown.find('option:selected').prop('disabled')) {
            statusDropdown.val('Achieved');
        }
    } else {
        // No actual date - cannot select "Achieved"
        statusDropdown.find('option[value="Achieved"]').prop('disabled', true);
        
        // If "Achieved" was selected, default to "In Progress"
        if (statusDropdown.val() === 'Achieved') {
            statusDropdown.val('In Progress');
        }
    }
    
    // Visual indication for disabled options
    statusDropdown.find('option:disabled').css('color', '#aaa');
    
    // Trigger change event to apply any validation
    statusDropdown.trigger('change');
}

// Function to check if all associated tasks are done
function areAllAssociatedTasksDone(associatedTaskIds, tasksData) {
    console.log("Checking associated tasks:", associatedTaskIds);
    console.log("Available tasks data:", tasksData);
    
    // Convert to a more easily searchable format
    const tasksById = {};
    tasksData.forEach(task => {
        tasksById[task.id] = task;
    });
    
    // Check each associated task
    for (const taskId of associatedTaskIds) {
        console.log(`Checking task ${taskId}, status: ${tasksById[taskId]?.status || 'unknown'}`);
        // If the task exists and is NOT done, return false
        if (tasksById[taskId] && tasksById[taskId].status.toLowerCase() !== 'done') {
            console.log(`Task ${taskId} is not done, validation fails`);
            return false;
        }
    }
    
    // All tasks are done (or don't exist)
    console.log("All tasks are done or don't exist, validation passes");
    return true;
}

// Milestone form validation (for both new and edit forms)
function validateMilestoneForm(form, e, tasksData, projectStartDate, projectEndDate) {
    let isValid = true;
    const statusVal = form.find('[name="status"]').val();
    const fileInput = form.find('input[name="supporting_doc"]');
    const associatedTasks = form.find('.milestone-tasks-select').val() || [];
    const targetDate = form.find('input[name="target_date"]').val();
    const actualDate = form.find('input[name="actual_date"]').val();
    
    // Clear previous validation messages
    form.find('.validation-message').remove();
    
    // Required fields validation
    if (!targetDate) {
        showValidationMessage(form.find('input[name="target_date"]'), "Target date is required");
        isValid = false;
    }
    
    // Revalidate that target date is within project date range
    if (targetDate && projectStartDate && projectEndDate) {
        if (!validateMilestoneTargetDate(form.find('input[name="target_date"]'), projectStartDate, projectEndDate)) {
            isValid = false;
        }
    }
    
    // Status-specific validations
    if (statusVal === 'Achieved') {
        // Must have actual date
        if (!actualDate) {
            showValidationMessage(form.find('input[name="actual_date"]'), 
                                "When status is 'Achieved', you must provide an Actual Date");
            isValid = false;
        }
        
        // Check for supporting document - more robust check
        if (form.attr('id') === 'editMilestoneForm') {
            const oldFilePath = form.closest('.modal').data('file') || "";
            const hasNewFile = fileInput[0].files.length > 0;
            const hasOldFile = (oldFilePath.trim() !== "");
            
            console.log("Edit form - Old file path:", oldFilePath);
            console.log("Has new file:", hasNewFile);
            console.log("Has old file:", hasOldFile);
            
            if (!hasOldFile && !hasNewFile) {
                showValidationMessage(fileInput, "When status is 'Achieved', you must have a Supporting Document");
                isValid = false;
            }
        } else {
            // For new milestone form
            if (fileInput[0].files.length === 0) {
                showValidationMessage(fileInput, "When status is 'Achieved', you must have a Supporting Document");
                isValid = false;
            }
        }
        
        // Associated tasks validation
        if (associatedTasks.length > 0 && !areAllAssociatedTasksDone(associatedTasks, tasksData)) {
            showFormMessage(form, 
                          "Cannot mark this milestone as 'Achieved' because one or more of its associated tasks are not completed.");
            isValid = false;
        }
    }
    
    // If there are validation errors, prevent form submission
    if (!isValid && e) {
        e.preventDefault();
        showFormMessage(form, "Please correct the errors before submitting.");
    }
    
    return isValid;
}

// Display validation message for form elements
function showValidationMessage(element, message, isError = true) {
    // Remove any existing messages
    element.siblings('.validation-message').remove();
    
    // Add the new message
    const messageClass = isError ? 'text-danger' : 'text-success';
    element.after(`<div class="validation-message ${messageClass} small mt-1">${message}</div>`);
}

// Display form-wide message
function showFormMessage(form, message, type = 'danger') {
    // Remove any existing form messages
    form.find('.form-message').remove();
    
    // Add the form message at the top
    form.prepend(`
        <div class="alert alert-${type} form-message alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    `);
    
    // Scroll to the message
    $('html, body').animate({
        scrollTop: form.offset().top - 100
    }, 200);
}

function loadMilestoneAssociatedTasks(milestoneId, isEdit = false) {
    $.ajax({
        url: 'get_milestone_tasks.php',
        type: 'GET',
        data: { milestone_id: milestoneId },
        dataType: 'json',
        success: function(response) {
            if (isEdit) {
                $('#editMilestoneAssociatedTasks').val(response).trigger('change');
            } else {
                let taskHtml = '<ul>';
                response.forEach(function(taskId) {
                    taskHtml += `<li>Task ID: ${taskId}</li>`;
                });
                taskHtml += '</ul>';
                $('#viewMilestoneAssociatedTasks').html(taskHtml);
            }
        },
        error: function(xhr, status, error) {
            console.error('Error loading milestone tasks:', error);
        }
    });
}

// Calculate milestone duration function (if needed)
function calculateMilestoneDuration(formPrefix) {
    const startDate = $(`#${formPrefix}MilestoneProposedStartDate`).val();
    const endDate = $(`#${formPrefix}MilestoneProposedEndDate`).val();
    
    if (startDate && endDate) {
        const start = new Date(startDate);
        const end = new Date(endDate);
        const differenceMs = end - start;
        const days = Math.ceil(differenceMs / (1000 * 60 * 60 * 24)) + 1;
        
        $(`#${formPrefix}MilestoneDuration`).val(days);
    }
}

function fixMilestoneStatusUpdates() {
    // Fix 1: Normalize status values when loading data into modals
    $(document).on('click', '.view-milestone-btn', function() {
        const status = $(this).data('status');
        // Capitalize first letter of each word for display
        const formattedStatus = status.replace(/\b\w/g, l => l.toUpperCase());
        $('#viewMilestoneStatus').val(formattedStatus);
    });

    // Fix 2: Normalize status values when loading edit modal
    $(document).on('click', '.edit-milestone-btn', function() {
        const status = $(this).data('status').toLowerCase();
        
        // Map lowercase database values to proper-case form values
        const statusMap = {
            'achieved': 'Achieved',
            'in progress': 'In Progress',
            'pending': 'Pending'
        };
        
        const formattedStatus = statusMap[status] || status;
        $('#editMilestoneStatus').val(formattedStatus);
    });
    
    // Fix 3: Update the table after form submission
    $('#editMilestoneForm').on('submit', function() {
        // Add a success callback to refresh the table or page
        $(this).data('submitted', true);
    });
    
    // Fix 4: Handle form submission result
    $('#editMilestoneModal').on('hidden.bs.modal', function() {
        const form = $('#editMilestoneForm');
        if (form.data('submitted')) {
            // Reset the flag
            form.data('submitted', false);
            // Refresh the page to show updated status
            location.reload();
        }
    });
}