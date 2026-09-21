function initGanttChart(tasksData, taskDependencies) {
    if (!tasksData || tasksData.length === 0) {
        document.getElementById('gantt-chart-container').innerHTML = 
            '<div class="alert alert-info">No tasks found for this project.</div>';
        
        // Safely handle the critical path elements if they exist
        const criticalPathContainer = document.getElementById('critical-path-container');
        if (criticalPathContainer) {
            criticalPathContainer.innerHTML = '';
        }
        
        const criticalPathTable = document.getElementById('criticalPathTable');
        if (criticalPathTable) {
            criticalPathTable.style.display = 'none';
        }
        
        return;
    }

    // Process the tasks for use with Google Charts
    preprocessTasksForGantt(tasksData, taskDependencies);
}

function preprocessTasksForGantt(tasksData, taskDependencies) {
    // Safely hide the critical path table if it exists
    const criticalPathContainer = document.getElementById('critical-path-container');
    if (criticalPathContainer && criticalPathContainer.parentElement) {
        criticalPathContainer.parentElement.style.display = 'none';
    }
    
    // Create graph structure for critical path analysis
    const graph = buildDependencyGraph(tasksData, taskDependencies);
    
    // Perform critical path calculation
    const criticalPathData = calculateCriticalPath(graph, tasksData);
    
    // Draw the Gantt chart
    drawGanttChart(tasksData, taskDependencies, criticalPathData);
}

function buildDependencyGraph(tasks, dependencies) {
    const graph = {
        nodes: {},
        edges: {},
        reverseEdges: {}
    };
    
    // Initialize nodes
    tasks.forEach(task => {
        const taskId = task.id.toString();
        graph.nodes[taskId] = {
            id: taskId,
            name: task.title,
            duration: parseInt(task.duration) || 0,
            earlyStart: 0,
            earlyFinish: 0,
            lateStart: 0,
            lateFinish: 0,
            slack: 0,
            isCritical: false
        };
        graph.edges[taskId] = [];
        graph.reverseEdges[taskId] = [];
    });
    
    // Add dependency relationships
    for (const [taskId, predecessorIds] of Object.entries(dependencies)) {
        if (Array.isArray(predecessorIds)) {
            predecessorIds.forEach(predId => {
                const taskIdStr = taskId.toString();
                const predIdStr = predId.toString();
                
                if (graph.nodes[taskIdStr] && graph.nodes[predIdStr]) {
                    graph.edges[predIdStr].push(taskIdStr);
                    graph.reverseEdges[taskIdStr].push(predIdStr);
                }
            });
        }
    }
    
    return graph;
}

function calculateCriticalPath(graph, tasks) {
    // Find nodes with no incoming edges (start nodes)
    const startNodes = Object.keys(graph.nodes).filter(nodeId => 
        graph.reverseEdges[nodeId].length === 0
    );
    
    // Find nodes with no outgoing edges (end nodes)
    const endNodes = Object.keys(graph.nodes).filter(nodeId => 
        graph.edges[nodeId].length === 0
    );
    
    // If no start or end nodes, we can't calculate
    if (startNodes.length === 0 || endNodes.length === 0) {
        return [];
    }
    
    // Forward pass - Calculate early start and early finish
    let visited = new Set();
    const topoOrder = [];
    
    function dfsForward(nodeId) {
        if (visited.has(nodeId)) return;
        visited.add(nodeId);
        
        // Process all predecessors first
        graph.reverseEdges[nodeId].forEach(predId => {
            dfsForward(predId);
        });
        
        topoOrder.push(nodeId);
    }
    
    // Start DFS from all end nodes
    endNodes.forEach(nodeId => {
        dfsForward(nodeId);
    });
    
    // Process nodes in topological order
    topoOrder.reverse().forEach(nodeId => {
        const node = graph.nodes[nodeId];
        
        if (graph.reverseEdges[nodeId].length === 0) {
            // Start node - early start is 0
            node.earlyStart = 0;
        } else {
            // Find maximum early finish from predecessors
            node.earlyStart = Math.max(
                ...graph.reverseEdges[nodeId].map(predId => 
                    graph.nodes[predId].earlyFinish
                )
            );
        }
        
        // Early finish = early start + duration
        node.earlyFinish = node.earlyStart + node.duration;
    });
    
    // Determine project duration
    const projectDuration = Math.max(
        ...Object.values(graph.nodes).map(node => node.earlyFinish)
    );
    
    // Backward pass - Calculate late start and late finish
    Object.values(graph.nodes).forEach(node => {
        if (graph.edges[node.id].length === 0) {
            // End node - late finish is project duration
            node.lateFinish = projectDuration;
        } else {
            // Find minimum late start from successors
            node.lateFinish = Math.min(
                ...graph.edges[node.id].map(succId => 
                    graph.nodes[succId].lateStart
                )
            );
        }
        
        // Late start = late finish - duration
        node.lateStart = node.lateFinish - node.duration;
        
        // Calculate slack
        node.slack = node.lateStart - node.earlyStart;
        
        // Critical path has zero slack
        node.isCritical = node.slack === 0;
    });
    
    return Object.values(graph.nodes);
}

function drawGanttChart(tasksData, taskDependencies, criticalPathData) {
    // Get the container
    const container = document.getElementById('gantt-chart-container');
    
    // Clear any existing content
    container.innerHTML = '';
    
    if (!tasksData || tasksData.length === 0) {
        container.innerHTML = '<div class="alert alert-info">No tasks found for this project.</div>';
        return;
    }
    
    // Create a new container for the chart
    const chartContainer = document.createElement('div');
    chartContainer.style.width = '100%';
    chartContainer.style.height = '100%';
    container.appendChild(chartContainer);
    
    // Find earliest and latest dates
    let minDate = new Date('9999-12-31');
    let maxDate = new Date('1970-01-01');
    
    tasksData.forEach(task => {
        if (task.proposed_start_date) {
            const startDate = new Date(task.proposed_start_date);
            if (startDate < minDate) minDate = startDate;
        }
        
        if (task.proposed_end_date) {
            const endDate = new Date(task.proposed_end_date);
            if (endDate > maxDate) maxDate = endDate;
        }
        
        // Also check actual dates if available
        if (task.actual_start_date) {
            const actualStart = new Date(task.actual_start_date);
            if (actualStart < minDate) minDate = actualStart;
        }
        
        if (task.actual_end_date) {
            const actualEnd = new Date(task.actual_end_date);
            if (actualEnd > maxDate) maxDate = actualEnd;
        }
    });
    
    // Ensure we have valid dates
    if (minDate > maxDate) {
        minDate = new Date();
        maxDate = new Date();
        maxDate.setDate(maxDate.getDate() + 30);
    }
    
    // Create a mapping of task IDs to critical path status
    const criticalMap = {};
    criticalPathData.forEach(task => {
        criticalMap[task.id] = task.isCritical;
    });
    
    // Generate HTML for the Gantt chart
    let html = `
        <div class="gantt-chart">
            <div class="gantt-header">
                <div class="gantt-task-info">Task ID</div>
                <div class="gantt-timeline">
    `;
    
    // Generate timeline headers (days)
    const dayCount = Math.ceil((maxDate - minDate) / (1000 * 60 * 60 * 24)) + 1;
    const dayWidth = Math.max(30, Math.min(100, 900 / dayCount)); // Responsive width between 30-100px
    
    for (let i = 0; i < dayCount; i++) {
        const day = new Date(minDate);
        day.setDate(day.getDate() + i);
        html += `<div class="gantt-day" style="width: ${dayWidth}px;">${day.getDate()}/${day.getMonth() + 1}</div>`;
    }
    
    html += `
                </div>
            </div>
            <div class="gantt-body">
    `;
    
    // Generate task rows
    tasksData.forEach(task => {
        const taskId = task.id.toString();
        const isCritical = criticalMap[taskId] || false;
        
        // Calculate position for task bar
        let startDate, endDate;
        
        // Use actual dates if available, otherwise proposed dates
        if (task.actual_start_date) {
            startDate = new Date(task.actual_start_date);
        } else if (task.proposed_start_date) {
            startDate = new Date(task.proposed_start_date);
        } else {
            startDate = new Date(minDate);
        }
        
        if (task.actual_end_date) {
            endDate = new Date(task.actual_end_date);
        } else if (task.proposed_end_date) {
            endDate = new Date(task.proposed_end_date);
        } else {
            endDate = new Date(startDate);
            endDate.setDate(endDate.getDate() + (parseInt(task.duration) || 1));
        }
        
        // Calculate position metrics
        const daysBefore = Math.floor((startDate - minDate) / (1000 * 60 * 60 * 24));
        const taskDuration = Math.ceil((endDate - startDate) / (1000 * 60 * 60 * 24));
        
        const leftPos = daysBefore * dayWidth;
        const barWidth = taskDuration * dayWidth;
        
        // Format dates for tooltip
        const startDateStr = startDate.toLocaleDateString();
        const endDateStr = endDate.toLocaleDateString();
        
        // Create tooltip content
        const tooltipContent = `${task.title}\n` +
            `Start: ${startDateStr}\n` +
            `End: ${endDateStr}\n` +
            `Duration: ${task.duration || taskDuration} days\n` +
            `Status: ${task.status || 'Unknown'}`;
        
        // Determine bar color based on status and critical path
        let barClass = '';
        if (isCritical) {
            barClass = 'critical-task';
        }
        
        const status = task.status.toLowerCase();
        if (status === 'done') {
            barClass += ' done-task';
        } else if (status === 'in progress') {
            barClass += ' progress-task';
        } else {
            barClass += ' pending-task';
        }
        
        html += `
            <div class="gantt-row">
                <div class="gantt-task-info">
                    ${task.id}
                </div>
                <div class="gantt-task-timeline">
                    <div class="gantt-task-bar ${barClass}" style="left: ${leftPos}px; width: ${barWidth}px;" title="${tooltipContent}">
                        <span class="task-label">${task.id}</span>
                    </div>
                </div>
            </div>
        `;
    });
    
    html += `
            </div>
        </div>
    `;
    
    // Add CSS for the Gantt chart
    const style = document.createElement('style');
    style.textContent = `
        .gantt-chart {
            display: flex;
            flex-direction: column;
            width: 100%;
            overflow-x: auto;
        }
        .gantt-header, .gantt-row {
            display: flex;
            width: 100%;
        }
        .gantt-task-info {
            width: 10%;
            min-width: 80px;
            padding: 5px;
            background-color: #f8f9fa;
            border-right: 1px solid #dee2e6;
            border-bottom: 1px solid #dee2e6;
            font-weight: bold;
            text-align: center;
        }
        .gantt-timeline, .gantt-task-timeline {
            display: flex;
            flex-grow: 1;
            position: relative;
            border-bottom: 1px solid #dee2e6;
        }
        .gantt-day {
            text-align: center;
            border-right: 1px solid #dee2e6;
            font-size: 0.8rem;
            padding: 5px 0;
        }
        .gantt-task-bar {
            position: absolute;
            height: 24px;
            top: 3px;
            border-radius: 3px;
            padding: 0 5px;
            color: white;
            font-size: 0.8rem;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: help;
        }
        .task-label {
            font-size: 0.75rem;
            white-space: nowrap;
            text-align: center;
        }
        .critical-task {
            border: 2px solid #dc3545 !important;
        }
        .done-task {
            background-color: #28a745;
        }
        .progress-task {
            background-color: #ffc107;
            color: #212529;
        }
        .pending-task {
            background-color: #6c757d;
        }
    `;
    
    document.head.appendChild(style);
    chartContainer.innerHTML = html;
}