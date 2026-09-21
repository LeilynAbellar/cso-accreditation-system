function showValidationMessage(element, message, isError = true) {
    // Remove any existing messages
    element.siblings('.validation-message').remove();
    
    // Add the new message
    const messageClass = isError ? 'text-danger' : 'text-success';
    element.after(`<div class="validation-message ${messageClass} small mt-1">${message}</div>`);
}

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

function areAllPredecessorsDone(predecessorIds, tasksData) {
    // Convert to a more easily searchable format
    const tasksById = {};
    tasksData.forEach(task => {
        tasksById[task.id] = task;
    });
    
    // Check each predecessor
    for (const predId of predecessorIds) {
        // If the predecessor task exists and is NOT done, return false
        if (tasksById[predId] && tasksById[predId].status.toLowerCase() !== 'done') {
            return false;
        }
    }
    
    // All predecessors are done (or don't exist)
    return true;
}

function calculateDuration(startDate, endDate) {
    if (!startDate || !endDate) return 0;
    
    const start = new Date(startDate);
    const end = new Date(endDate);
    
    // Check if dates are valid
    if (isNaN(start.getTime()) || isNaN(end.getTime())) return 0;
    
    // Calculate the difference in milliseconds
    const differenceMs = end - start;
    
    // Convert to days and round up
    return Math.ceil(differenceMs / (1000 * 60 * 60 * 24)) + 1; // +1 to include both start and end days
}

// Function to validate that end date isn't before start date
function validateDateOrder(startDateField, endDateField) {
    const startDate = new Date($(startDateField).val());
    const endDate = new Date($(endDateField).val());
    
    // Clear previous validation message
    $(endDateField).siblings('.validation-message').remove();
    
    // Only validate if both dates have values
    if ($(startDateField).val() && $(endDateField).val()) {
        if (endDate < startDate) {
            showValidationMessage($(endDateField), "End date cannot be before start date");
            return false;
        }
    }
    
    return true;
}

// Enhanced validation function that includes date order check
function validateTaskDates(statusDropdown) {
    const statusVal = $(statusDropdown).val();
    const form = $(statusDropdown).closest('form');
    const actualStartDateField = form.find('input[name="actual_start_date"]');
    const actualEndDateField = form.find('input[name="actual_end_date"]');
    const actualStartDate = actualStartDateField.val();
    const actualEndDate = actualEndDateField.val();
    
    // Clear previous validation messages
    form.find('.validation-message').remove();
    
    // First check date order
    let isValid = validateDateOrder(actualStartDateField, actualEndDateField);
    
    if (statusVal === 'In Progress') {
        // For In Progress: require actual start date, end date should be empty
        if (!actualStartDate) {
            showValidationMessage(actualStartDateField, "Required for In Progress status");
            isValid = false;
        }
    } 
    else if (statusVal === 'Done') {
        // For Done: require both actual start and end dates
        if (!actualStartDate) {
            showValidationMessage(actualStartDateField, "Required for Done status");
            isValid = false;
        }
        
        if (!actualEndDate) {
            showValidationMessage(actualEndDateField, "Required for Done status");
            isValid = false;
        }
    }
    
    return isValid;
}

// Function to update available status options based on date fields
function updateAvailableStatuses(form) {
    const actualStartDate = form.find('input[name="actual_start_date"]').val();
    const actualEndDate = form.find('input[name="actual_end_date"]').val();
    const statusDropdown = form.find('[name="status"]');
    
    // Reset all options to enabled first
    statusDropdown.find('option').prop('disabled', false);
    
    if (actualStartDate && actualEndDate) {
        // Both dates are filled - can only select "Done"
        statusDropdown.find('option[value="Pending"]').prop('disabled', true);
        statusDropdown.find('option[value="In Progress"]').prop('disabled', true);
        
        // Auto-select "Done" if current selection is disabled
        if (statusDropdown.find('option:selected').prop('disabled')) {
            statusDropdown.val('Done');
        }
    } else if (actualStartDate && !actualEndDate) {
        // Only start date is filled - can only select "In Progress"
        statusDropdown.find('option[value="Pending"]').prop('disabled', true);
        statusDropdown.find('option[value="Done"]').prop('disabled', true);
        
        // Auto-select "In Progress" if current selection is disabled
        if (statusDropdown.find('option:selected').prop('disabled')) {
            statusDropdown.val('In Progress');
        }
    } else if (!actualStartDate && !actualEndDate) {
        // No dates are filled - can only select "Pending"
        statusDropdown.find('option[value="In Progress"]').prop('disabled', true);
        statusDropdown.find('option[value="Done"]').prop('disabled', true);
        
        // Auto-select "Pending" if current selection is disabled
        if (statusDropdown.find('option:selected').prop('disabled')) {
            statusDropdown.val('Pending');
        }
    }
    
    // Visual indication for disabled options
    statusDropdown.find('option:disabled').css('color', '#aaa');
    
    // Trigger change event to apply any validation
    statusDropdown.trigger('change');
}

// Function to automatically update status based on dates
function updateStatusBasedOnDates(form) {
    const actualStartDate = form.find('input[name="actual_start_date"]').val();
    const actualEndDate = form.find('input[name="actual_end_date"]').val();
    const statusDropdown = form.find('[name="status"]');
    
    if (!statusDropdown.length) return;
    
    // Force status based on dates
    if (!actualStartDate && !actualEndDate) {
        statusDropdown.val('Pending');
    } else if (actualStartDate && !actualEndDate) {
        statusDropdown.val('In Progress');
    } else if (actualStartDate && actualEndDate) {
        statusDropdown.val('Done');
    }
    
    // Update available options
    updateAvailableStatuses(form);
}

// Update duration when dates change
function updateDuration(form) {
    const startDateField = form.find('input[name="actual_start_date"]');
    const endDateField = form.find('input[name="actual_end_date"]');
    const durationField = form.find('[name="duration"]');
    
    const actualStartDate = startDateField.val();
    const actualEndDate = endDateField.val();
    
    if (actualStartDate && actualEndDate) {
        const duration = calculateDuration(actualStartDate, actualEndDate);
        durationField.val(duration);
    } else {
        durationField.val(0);
    }
}

// Task form validation (for both new and edit forms)
function validateTaskForm(form, e, tasksData, taskDependencies) {
    let isValid = true;
    const statusVal = form.find('[name="status"]').val();
    const spentVal = parseFloat(form.find('[name="spent"]').val()) || 0;
    const fileInput = form.find('input[name="supporting_doc"]');
    const proposedStartDate = new Date(form.find('input[name="proposed_start_date"]').val());
    const proposedEndDate = new Date(form.find('input[name="proposed_end_date"]').val());
    const actualStartDate = form.find('input[name="actual_start_date"]').val() ? 
                            new Date(form.find('input[name="actual_start_date"]').val()) : null;
    const actualEndDate = form.find('input[name="actual_end_date"]').val() ? 
                        new Date(form.find('input[name="actual_end_date"]').val()) : null;
    
    // Clear previous validation messages
    form.find('.validation-message').remove();
    
    // Update duration
    updateDuration(form);
    
    // Validate dates first
    if (!validateTaskDates(form.find('[name="status"]'))) {
        isValid = false;
    }
    
    // Validate proposed dates
    if (proposedEndDate <= proposedStartDate) {
        showValidationMessage(form.find('input[name="proposed_end_date"]'), 
                            "Proposed end date must be after the proposed start date");
        isValid = false;
    }
    
    // If actual start date is provided, it should not be before proposed start date
    if (actualStartDate && actualStartDate < proposedStartDate) {
        showValidationMessage(form.find('input[name="actual_start_date"]'), 
                            "Actual start date should not be before the proposed start date");
        isValid = false;
    }
    
    // Status-specific validations
    if (statusVal === 'Done') {
        // Must have spent > 0
        if (spentVal <= 0) {
            showValidationMessage(form.find('[name="spent"]'), 
                                "When status is 'Done', you must provide a non-zero 'Budget Spent'");
            isValid = false;
        }
        
        // Check for supporting document
        const oldFilePath = $('#editTaskModal').data('file') || "";
        const noOldFile = (oldFilePath.trim() === "");
        
        if (form.attr('id') === 'editTaskForm') {
            // For edit form
            if (noOldFile && fileInput[0].files.length === 0) {
                showValidationMessage(fileInput, 
                                    "When status is 'Done', you must have a Supporting Document");
                isValid = false;
            }
        } else {
            // For new task form
            if (fileInput[0].files.length === 0) {
                showValidationMessage(fileInput, 
                                    "When status is 'Done', you must have a Supporting Document");
                isValid = false;
            }
        }
        
        // Predecessor validation
        const selectedPredecessors = form.find('.task-dependencies-select').val() || [];
        if (selectedPredecessors.length > 0 && !areAllPredecessorsDone(selectedPredecessors, tasksData)) {
            showFormMessage(form, 
                          "Cannot mark this task as 'Done' because one or more of its predecessor tasks are not completed.");
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

// Initialize the task management functionality
function initTaskManagement(tasksData, taskDependencies, taskTitles) {
    // Initialize tooltips
    $('[data-bs-toggle="tooltip"]').tooltip();
    
    // Initialize DataTable
    $('#tasksTable').DataTable({
        responsive: false,
        autoWidth: false,
        scrollX: true,
        scrollY: true,
        pageLength: 25,
        lengthMenu: [10, 25, 50, 100, -1],
        lengthChange: true,
        stripeClasses: [],
        language: {
            emptyTable: "No tasks assigned.",
            zeroRecords: "No matching records found."
        },
        columnDefs: [{ 
            targets: '_all',
            className: 'dt-nowrap'
        }]
    });
    
    // Initialize select2
    $('.task-dependencies-select').select2({
        placeholder: "Select predecessor tasks",
        allowClear: true
    });
    
    // Date field change events - using event delegation for better performance
    $(document).on('change', 'input[name="actual_start_date"], input[name="actual_end_date"]', function() {
        const form = $(this).closest('form');
        
        // Validate date order
        validateDateOrder(
            form.find('input[name="actual_start_date"]'),
            form.find('input[name="actual_end_date"]')
        );
        
        // Update status suggestion
        updateStatusBasedOnDates(form);
        
        // Update duration
        updateDuration(form);
    });
    
    // Handle field clearing
    $(document).on('input', 'input[name="actual_start_date"], input[name="actual_end_date"]', function() {
        const form = $(this).closest('form');
        updateAvailableStatuses(form);
    });
    
    // Status change event - add validation and automatic date handling
    $(document).on('change', '[name="status"]', function() {
        const form = $(this).closest('form');
        const status = $(this).val();
        const actualStartDate = form.find('input[name="actual_start_date"]').val();
        const actualEndDate = form.find('input[name="actual_end_date"]').val();
        
        // If changing to "In Progress", ensure actual start date exists
        if (status === 'In Progress' && !actualStartDate) {
            // Set today's date as the actual start date
            const today = new Date().toISOString().split('T')[0];
            form.find('input[name="actual_start_date"]').val(today);
            showValidationMessage(form.find('input[name="actual_start_date"]'), 
                                "Start date set to today automatically", false);
        }
        
        // If changing to "Done", ensure both dates exist
        if (status === 'Done') {
            if (!actualStartDate) {
                // Set start date to proposed start date or today
                const proposedStartDate = form.find('input[name="proposed_start_date"]').val();
                const startDate = proposedStartDate || new Date().toISOString().split('T')[0];
                form.find('input[name="actual_start_date"]').val(startDate);
                showValidationMessage(form.find('input[name="actual_start_date"]'), 
                                    "Start date set automatically", false);
            }
            
            if (!actualEndDate) {
                // Set end date to today
                const today = new Date().toISOString().split('T')[0];
                form.find('input[name="actual_end_date"]').val(today);
                showValidationMessage(form.find('input[name="actual_end_date"]'), 
                                    "End date set to today automatically", false);
            }
            
            // Update duration after setting dates
            updateDuration(form);
        }
        
        // Run standard validation
        validateTaskDates(this);
    });
    
    // Initialize available statuses for all forms
    $('form').each(function() {
        updateAvailableStatuses($(this));
    });
    
    // When opening the modals, ensure statuses are properly restricted
    $('#addTaskModal, #editTaskModal').on('shown.bs.modal', function() {
        const form = $(this).find('form');
        updateAvailableStatuses(form);
    });
    
    // Form submit validation
    $('#assignTaskForm').on('submit', function(e) {
        return validateTaskForm($(this), e, tasksData, taskDependencies);
    });
    
    $('#editTaskForm').on('submit', function(e) {
        return validateTaskForm($(this), e, tasksData, taskDependencies);
    });

    // View Task Button
    $('.view-task-btn').on('click', function() {
        const title = $(this).data('title');
        const description = $(this).data('description');
        const duration = $(this).data('duration');
        const spent = $(this).data('spent');
        const comments = $(this).data('comments') || "";
        const status = $(this).data('status');
        const filePath = $(this).data('file') || "";
        const proposedStartDate = $(this).data('proposed-start');
        const proposedEndDate = $(this).data('proposed-end');
        const actualStartDate = $(this).data('actual-start') || "Not started";
        const actualEndDate = $(this).data('actual-end') || "Not completed";
        // Handle predecessors display
        const taskId = $(this).data('id');
        let predecessorsHtml = 'None';
        let successorsHtml = 'None';
        
        // Show predecessors (tasks this task depends on)
        if (taskDependencies[taskId] && taskDependencies[taskId].length > 0) {
            predecessorsHtml = '<ul>';
            taskDependencies[taskId].forEach(function(depId) {
                // Find the task title by id
                if (taskTitles[depId]) {
                    predecessorsHtml += '<li>' + taskTitles[depId] + '</li>';
                }
            });
            predecessorsHtml += '</ul>';
        }
        
        // Show successors (tasks that depend on this task)
        let successors = [];
        // Loop through all tasks to find which ones have this task as a predecessor
        Object.keys(taskDependencies).forEach(function(tid) {
            if (taskDependencies[tid] && taskDependencies[tid].includes(parseInt(taskId))) {
                successors.push(tid);
            }
        });
        
        if (successors.length > 0) {
            successorsHtml = '<ul>';
            successors.forEach(function(sucId) {
                if (taskTitles[sucId]) {
                    successorsHtml += '<li>' + taskTitles[sucId] + '</li>';
                }
            });
            successorsHtml += '</ul>';
        }

        $('#viewTaskProposedStartDate').val(proposedStartDate);
        $('#viewTaskProposedEndDate').val(proposedEndDate);
        $('#viewTaskActualStartDate').val(actualStartDate);
        $('#viewTaskActualEndDate').val(actualEndDate);
        $('#viewTaskPredecessors').html(predecessorsHtml);
        $('#viewTaskSuccessors').html(successorsHtml);
        $('#viewTaskTitle').val(title);
        $('#viewTaskDescription').val(description);
        $('#viewTaskDuration').val(duration);
        $('#viewTaskSpent').val(spent);
        $('#viewTaskComments').val(comments);
        $('#viewTaskStatus').val(status);

        // Show/hide link for the file
        if (filePath.trim() !== "") {
            // Provide a clickable link
            const fileName = filePath.split("/").pop();
            $('#viewTaskFileLink').html(`
                <a href="${filePath}" target="_blank" style="text-decoration: underline;">
                    ${fileName}
                </a>
            `);
        } else {
            $('#viewTaskFileLink').text("No file uploaded");
        }

        $('#viewTaskModal').modal('show');
    });

    // Edit Task Button
    $('.edit-task-btn').on('click', function() {
        const id = $(this).data('id');
        const title = $(this).data('title');
        const description = $(this).data('description');
        const duration = $(this).data('duration');
        const spent = $(this).data('spent');
        const comments = $(this).data('comments') || "";
        const status = $(this).data('status');
        const filePath = $(this).data('file') || "";
        
        const proposedStartDate = $(this).data('proposed-start');
        const proposedEndDate = $(this).data('proposed-end');
        const actualStartDate = $(this).data('actual-start') || "";
        const actualEndDate = $(this).data('actual-end') || "";

        // Attach the old file path to the modal so we can check it on submit
        $('#editTaskModal').data('file', filePath);

        $('#editTaskId').val(id);
        $('#editTaskTitle').val(title);
        $('#editTaskDescription').val(description);
        $('#editTaskDuration').val(duration);
        $('#editTaskSpent').val(spent);
        
        // Set the date values
        $('#editTaskProposedStartDate').val(proposedStartDate);
        $('#editTaskProposedEndDate').val(proposedEndDate);
        $('#editTaskActualStartDate').val(actualStartDate);
        $('#editTaskActualEndDate').val(actualEndDate);
        
        // Reset predecessors and set selected ones
        $('#editTaskPredecessors option:selected').prop('selected', false);
        
        // Get the dependencies for this task
        if (taskDependencies[id]) {
            // Set each predecessor as selected
            taskDependencies[id].forEach(function(depId) {
                $('#editTaskPredecessors option[value="' + depId + '"]').prop('selected', true);
            });
        }
        
        // Remove this task as an option (can't depend on itself)
        $('#editTaskPredecessors option[value="' + id + '"]').remove();
        $('#editTaskComments').val(comments);
        $('#editTaskStatus').val(status);

        // Validate the form after populating
        validateTaskDates($('#editTaskStatus'));
        updateAvailableStatuses($('#editTaskForm'));

        $('#editTaskModal').modal('show');
    });
}

