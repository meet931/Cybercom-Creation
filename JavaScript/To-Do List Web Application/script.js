document.addEventListener('DOMContentLoaded', function () {

    const localStorage_KEYS = {
        TASKS: 'tasks'
    };

    // Checking if local storage has tasks stored
    if (localStorage.getItem(localStorage_KEYS.TASKS)) {
        displayTasks();
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
        const addedPriorityValue = taskPriority.value;
        const addedDateValue = taskDueDate.value;

        if (addedTaskValue && addedDescValue && addedPriorityValue && addedDateValue) {

            // CREATEDF AN OBJECT
            const taskDetails = {
                'TaskName': addedTaskValue,
                'Description': addedDescValue,
                'Priority': addedPriorityValue,
                'Due': addedDateValue
            };

            // Store tasks in local storage
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

        // LISTING THE TASK LISTS
        function displayTasks() {
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

            taskList.appendChild(li);

            newTask.value = '';
            addButton.disabled = true;

        }

        // STOPPING FORM FROM SUBMTTING
        return false;
    };


    // EDIT, DELETE AND MARK AS COMPLETED
    taskList.addEventListener('click', function (event) {

        const target = event.target;

        if (target.classList.contains('delete-btn')) {
            
            const li = target.closest('li');
            const index = li.dataset.index;

            // Remove the task from localStorage
            let allTasks = JSON.parse(localStorage.getItem(localStorage_KEYS.TASKS));
            allTasks.splice(index, 1); // Remove the task at the specified index
            localStorage.setItem(localStorage_KEYS.TASKS, JSON.stringify(allTasks));

            // Remove the task element from the DOM
            li.remove();


        } else if (target.classList.contains('edit-btn')) {

            const taskText = target.closest('li').querySelector('.task-text').textContent;
            const editedTask = prompt('Edit Task: ', taskText);

            if (editedTask !== null && editedTask.trim() !== '') {
                target.closest('li').querySelector('.task-text').textContent = editedTask.trim();
            }

        } else if (target.type == 'checkbox') {
            const li = target.closest('li');
            li.classList.toggle('task-complete', target.checked);
        }

    });

});
