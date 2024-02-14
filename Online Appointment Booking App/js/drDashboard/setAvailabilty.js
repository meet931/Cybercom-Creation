document.addEventListener('DOMContentLoaded', function () {
    const availabilityForm = document.getElementById('availabilityForm');
    const availabilityTable = document.getElementById('availabilityData');

    // Load data from localStorage if available
    let availabilityData = JSON.parse(localStorage.getItem('availabilityData')) || [];

    availabilityForm.addEventListener('submit', function (event) {
        event.preventDefault();

        const date = document.getElementById('date').value;
        const fromTime = document.getElementById('fromTime').value;
        const toTime = document.getElementById('toTime').value;
        const slots = parseInt(document.getElementById('slots').value);

        if (!validateInput(date, fromTime, toTime, slots)) {
            alert('Please enter valid input');
            return;
        }

        addAvailabilityToTable(date, fromTime, toTime, slots);
        saveToLocalStorage(date, fromTime, toTime, slots);

        availabilityForm.reset();
    });

    function validateInput(date, fromTime, toTime, slots) {
        if (!date || !fromTime || !toTime || !slots || slots <= 0) {
            return false;
        }

        const from = new Date(`2000-01-01T${fromTime}`);
        const to = new Date(`2000-01-01T${toTime}`);

        if (from >= to) {
            return false;
        }

        return true;
    }

    function addAvailabilityToTable(date, fromTime, toTime, slots) {
        const newRow = availabilityTable.insertRow(-1);
        const dateCell = newRow.insertCell(0);
        const fromCell = newRow.insertCell(1);
        const toCell = newRow.insertCell(2);
        const slotsCell = newRow.insertCell(3);

        dateCell.textContent = date;
        fromCell.textContent = fromTime;
        toCell.textContent = toTime;
        slotsCell.textContent = slots;
    }

    function saveToLocalStorage(date, fromTime, toTime, slots) {
        const availability = {
            date: date,
            from: fromTime,
            to: toTime,
            slots: slots
        };

        availabilityData.push(availability);
        localStorage.setItem('availabilityData', JSON.stringify(availabilityData));
    }

    // Populate table with existing data from localStorage
    availabilityData.forEach(data => {
        addAvailabilityToTable(data.date, data.from, data.to, data.slots);
    });
});