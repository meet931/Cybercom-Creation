document.addEventListener('DOMContentLoaded', function () {

    const localStorage_KEYS = {
        PATIENTS: 'patients'
    };

    // Get values
    const form = document.getElementById('appointmentForm');
    const name = document.getElementById('txtName');
    const phoneNumber = document.getElementById('numPhone');
    const bloodGroup = document.getElementById('txtBloodGroup');
    const division = document.getElementById('division-select');
    const drList = document.getElementById('doctor-select');
    const date = document.getElementById('appointmentData');
    const bookAppointmentBtn = document.getElementById('addBtn');

    // By default, add button is disabled
    bookAppointmentBtn.disabled = true;

    // Enable/Disable button based on name input
    name.addEventListener('input', () => {
        let nameValue = name.value.trim();

        if (nameValue.length > 0) {
            bookAppointmentBtn.disabled = false;
        } else {
            bookAppointmentBtn.disabled = true;
        }
    });

    // On form submit
    form.addEventListener('submit', (event) => {
        event.preventDefault();

        const nameValue = name.value.trim();
        const addedPhone = phoneNumber.value.trim();
        const addedBloodGroup = bloodGroup.value.trim();
        const addedDivision = division.options[division.selectedIndex].text;
        const addedDrList = drList.options[drList.selectedIndex].text;
        const addedDateValue = date.value;

        if (nameValue && addedPhone && addedDivision && addedBloodGroup && addedDrList && addedDateValue) {
            console.log("Form submitted. Adding patient to local storage...");

            const patientDetails = {
                'Name': nameValue,
                'PhoneNumber': addedPhone,
                'BloodGroup': addedBloodGroup,
                'Division': addedDivision,
                'Doctor': addedDrList,
                'AppointmentDate': addedDateValue
            };

            // Store patient in local storage
            if (localStorage.getItem(localStorage_KEYS.PATIENTS)) {
                let allPatients = JSON.parse(localStorage.getItem(localStorage_KEYS.PATIENTS));
                allPatients.push(patientDetails);
                localStorage.setItem(localStorage_KEYS.PATIENTS, JSON.stringify(allPatients));
            } else {
                localStorage.setItem(localStorage_KEYS.PATIENTS, JSON.stringify([patientDetails]));
            }
            form.reset();

            displayAppointments();
        } else {
            alert('All fields are required!');
        }

        // Stop form from submitting
        return false;
    });

    // FUNCTION TO DISPLAY PATIENTS
    function displayAppointments() {
        console.log("Displaying Appointments...");
        let allPatients = JSON.parse(localStorage.getItem(localStorage_KEYS.PATIENTS));
        let patientList = document.getElementById('bookedAppointmentList');
        patientList.innerHTML = '';

        allPatients.forEach(function (patientDetails, index) {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${index+1}</td>
                <td class="patient-name">${patientDetails.Name}</td>
                <td class="patient-phone">${patientDetails.PhoneNumber}</td>
                <td class="patient-blood-group">${patientDetails.BloodGroup}</td>
                <td class="patient-division">${patientDetails.Division}</td>
                <td class="patient-doctor">${patientDetails.Doctor}</td>
                <td class="patient-appointment-date">${patientDetails.AppointmentDate}</td>
                <td>pending</td>
                <td>
                    <button class="cancel-appointment-btn" data-index="${index}">Cancel</button>
                </td>
            `;
            patientList.appendChild(row);
        });

        name.value = '';
        bookAppointmentBtn.disabled = true;

        const cancelButtons = document.querySelectorAll('.cancel-appointment-btn');
        cancelButtons.forEach(cancelButton => {
            cancelButton.addEventListener('click', function () {
                const index = this.getAttribute('data-index');
                cancelAppointment(index);
            });
        });
    }

    // Function to cancel appointment
    function cancelAppointment(index) {
        let allPatients = JSON.parse(localStorage.getItem(localStorage_KEYS.PATIENTS));
        const confirmCancel = confirm('Are you sure you want to cancel this appointment?');

        if (confirmCancel) {
            allPatients.splice(index, 1);
            localStorage.setItem(localStorage_KEYS.PATIENTS, JSON.stringify(allPatients));

            displayAppointments();
        }
    }
    displayAppointments();
});


document.addEventListener("DOMContentLoaded", function () {
    const divisions = {
        "cardiology": ["Dr. Hitesh", "Dr. Mahesh", "Dr. Seema", "Dr. Chirag"],
        "neurology": ["Dr. Mehta", "Dr. Sheetal", "Dr. Mahajan", "Dr. Zeel"],
        "orthopedics": ["Dr. Saloni", "Dr. Asha", "Dr. Dipak", "Dr. Neeraj"]
    };
    
    const divisionSelect = document.getElementById("division-select");
    const doctorSelect = document.getElementById("doctor-select");

    const timeSlotSelect = document.getElementById('time-select');

    // Populate doctor select options based on selected division
    divisionSelect.addEventListener("change", function () {
        const selectedDivision = this.value;
        const doctors = divisions[selectedDivision];
        doctorSelect.innerHTML = "";

        // Adding new options
        doctors.forEach(doctor => {
            const option = document.createElement("option");
            option.textContent = doctor;
            doctorSelect.appendChild(option);
        });
    });

    // Initialize doctor select options with the first division
    const firstDivision = Object.keys(divisions)[0];
    divisionSelect.value = firstDivision;
    divisionSelect.dispatchEvent(new Event("change"));
});
