document.addEventListener('DOMContentLoaded', function () {

    const localStorage_KEYS = {
        TASKS: 'tasks'
    };

    // CHEKCKING IF LOCAL STORAGE HAS TASKS STORED
    console.log("Checking local storage for tasks...");
    if (localStorage.getItem(localStorage_KEYS.TASKS)) {
        console.log("Tasks found in local storage. Displaying tasks...");
        displayTasks();
    } else {
        console.log("No tasks found in local storage.");
    }

    // GET VALUES
    const form = document.querySelector('form');
    const newTask = document.getElementById('txtTask');
    const taskDescription = document.getElementById('txtDescription');
    const taskPriority = document.getElementById('taskPriority');
    const taskDueDate = document.getElementById('taskDueDate');
    const addButton = document.getElementById('addBtn');
    const taskList = document.getElementById('tasks');

    // BY DEFAULT, ADD BUTTON IS DISABLED
    addButton.disabled = true;

    // HOW BUTTON WILL ACT UPON INPUT ACTION
    newTask.onkeyup = () => {
        let addedTask = newTask.value.trim();

        if (addedTask.length > 0) {
            addButton.disabled = false;
        } else {
            addButton.disabled = true;
        }
    };


    // ON FORM SUBMIT
    form.onsubmit = (event) => {
        event.preventDefault();

        const addedTaskValue = newTask.value.trim();
        const addedDescValue = taskDescription.value.trim();
        const addedPriorityValue = taskPriority.options[taskPriority.selectedIndex].text;
        const addedDateValue = taskDueDate.value;

        if (addedTaskValue && addedDescValue && addedPriorityValue && addedDateValue) {
            console.log("Form submitted. Adding task to local storage...");

            // CREATED AN OBJECT
            const taskDetails = {
                'TaskName': addedTaskValue,
                'Description': addedDescValue,
                'Priority': addedPriorityValue,
                'Due': addedDateValue
            };

            // Store task in local storage
            if (localStorage.getItem(localStorage_KEYS.TASKS)) {
                let allTasks = JSON.parse(localStorage.getItem(localStorage_KEYS.TASKS));
                allTasks.push(taskDetails);
                localStorage.setItem(localStorage_KEYS.TASKS, JSON.stringify(allTasks));
            } else {
                localStorage.setItem(localStorage_KEYS.TASKS, JSON.stringify([taskDetails]));
            }

            // Clear form fields
            document.getElementById('taskForm').reset();

            // Display Tasks
            displayTasks();
        } else {
            alert('All fields are required!');
        }

        // STOPPING FORM FROM SUBMITTING
        return false;
    };
    

    // FUNCTION TO DISPLAY TASKS
    function displayTasks() {
        console.log("Displaying tasks...");
        let allTasks = JSON.parse(localStorage.getItem(localStorage_KEYS.TASKS));
        let taskList = document.getElementById('tasks');
        taskList.innerHTML = '';

        allTasks.forEach(function (taskDetails, index) {
            const li = document.createElement('li');
            li.innerHTML = `
                <span class="task-text">${taskDetails.TaskName}</span>
                <span class="task-desc">${taskDetails.Description}</span>
                <span class="task-priority">${taskDetails.Priority}</span>
                <span class="task-date">${taskDetails.Due}</span>
                <div class="float-right">
                    <button class="btn btn-sm btn-outline-primary edit-btn" data-id="${index}">Edit</button>
                    <button class="btn btn-sm btn-outline-danger delete-btn" data-id="${index}">Delete</button>
                    <input type="checkbox" class="form-check-input ml-2" data-id="${index}">
                </div>
            `;
            taskList.appendChild(li);
        });

        document.getElementById('txtTask').value = '';
        document.getElementById('addBtn').disabled = true;
    }

    
    // EDIT, DELETE AND MARK AS COMPLETED
    taskList.addEventListener('click', function (event) {
        const target = event.target;

        if (target.classList.contains('delete-btn')) {
            console.log("Delete button clicked. Deleting task...");

            const confirmed = confirm("Are you sure you want to delete this record ? ");
            if (confirmed) {
                const li = target.closest('li');
                const index = li.dataset.index;
    
                // Remove the task from local storage
                let allTasks = JSON.parse(localStorage.getItem(localStorage_KEYS.TASKS));
                allTasks.splice(index, 1); // Remove the task at the specified index
                localStorage.setItem(localStorage_KEYS.TASKS, JSON.stringify(allTasks));
    
                // Remove the task element from the DOM
                li.remove();
            }
        } else if (target.classList.contains('edit-btn')) {
            console.log("Edit button clicked. Editing task...");
            
            let taskId = target.dataset.id;
            let allTasks = JSON.parse(localStorage.getItem(localStorage_KEYS.TASKS));
            let taskDetails = allTasks[taskId];

            // Update form fields with task details
            document.getElementById('txtTask').value = taskDetails.TaskName;
            document.getElementById('txtDescription').value = taskDetails.Description;
            document.getElementById('taskPriority').value = taskDetails.Priority;
            document.getElementById('taskDueDate').value = taskDetails.Due;

            // Handle form submission for editing
            form.onsubmit = (event) => {
                event.preventDefault();

                // Update the task details
                taskDetails.TaskName = newTask.value.trim();
                taskDetails.Description = taskDescription.value.trim();
                taskDetails.Priority = taskPriority.options[taskPriority.selectedIndex].text;
                taskDetails.Due = taskDueDate.value;

                // Update the task in the array
                allTasks[taskId] = taskDetails;

                // Update local storage with modified array
                localStorage.setItem(localStorage_KEYS.TASKS, JSON.stringify(allTasks));

                // Clear form fields
                document.getElementById('taskForm').reset();

                // Display Tasks
                displayTasks();

                // Reset the form submission handler after editing
                form.onsubmit = form;
            };

        } else if (target.type == 'checkbox') {
            console.log("Checkbox clicked. Marking task as completed...");
            
            const li = target.closest('li');
            li.classList.toggle('task-complete', target.checked);
        }
    });
});