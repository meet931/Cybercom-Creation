document.addEventListener('DOMContentLoaded', function () {
    const localStorage_KEYS = {
        PATIENTS: 'patients',
        APPROVED_PATIENTS: 'approvedPatients'
    };

    let patients = JSON.parse(localStorage.getItem(localStorage_KEYS.PATIENTS)) || [];

    // Checking if local storage has patients stored
    if (patients.length > 0) {
        displayPatients();
    } else {
        console.log("No patients found in local storage.");
    }
    displayApprovedPatients();

    
    // Function to display patients
    function displayPatients() {
        let allPatients = JSON.parse(localStorage.getItem(localStorage_KEYS.PATIENTS));
        let patientAppointmentList = document.getElementById('listOfPatientsForAppointment');
        patientAppointmentList.innerHTML = '';

        allPatients.forEach(function (patientDetails, index) {
            const row = document.createElement('tr');
            row.id = `row${index}`; // unique ID for each row
            row.innerHTML = `
            <td>${index + 1}</td>
            <td>${patientDetails.Name}</td>
            <td>${patientDetails.AppointmentDate}</td>
            <td>${patientDetails.PhoneNumber}</td>
            <td>${patientDetails.AppointmentTime}</td>
            <td id='action${index}'>
                <button class="accept" id="acceptButton${index}" onclick="accept(${index})">Accept</button>
                <button class="decline" onclick="decline(${index})">Decline</button>
            </td>
        `;
            patientAppointmentList.appendChild(row);
        });
    }


    // Function to update appointment status
    function updateAppointmentStatus(index, status) {
        let allPatients = JSON.parse(localStorage.getItem(localStorage_KEYS.PATIENTS)) || [];
        if (allPatients[index]) {
            allPatients[index].Status = status;
            localStorage.setItem(localStorage_KEYS.PATIENTS, JSON.stringify(allPatients));
        } else {
            console.error(`Patient with index ${index} not found.`);
        }
    }

    // Function to accept appointment
    window.accept = function (index) {
        console.log('Accept function called for index:', index);
        let allPatients = JSON.parse(localStorage.getItem(localStorage_KEYS.PATIENTS));
        let approvedList = JSON.parse(localStorage.getItem(localStorage_KEYS.APPROVED_PATIENTS)) || [];
        let acceptedPatient = allPatients[index];

        if (acceptedPatient.Status === 'Accepted') {
            console.log('This appointment has already been accepted.');
            return;
        }

        approvedList.push(acceptedPatient);
        localStorage.setItem(localStorage_KEYS.APPROVED_PATIENTS, JSON.stringify(approvedList));

        let acceptButton = document.getElementById(`acceptButton${index}`);
        console.log('Button element:', acceptButton);
        if (acceptButton) {
            acceptButton.textContent = "Accepted";
        } else {
            console.error(`Button with id 'acceptButton${index}' not found.`);
        }

        updateAppointmentStatus(index, 'Accepted');
        displayApprovedPatients();
    }

    // Function to decline appointment
    window.decline = function (index) {
        console.log('Decline function called for index:', index);

        updateAppointmentStatus(index, 'Declined');

        let rowToRemove = document.getElementById(`row${index}`);
        if (rowToRemove) {
            rowToRemove.remove();
        } else {
            console.error(`Row with id 'row${index}' not found.`);
        }
        displayApprovedPatients();
    }


    // Function to display approved patients
    function displayApprovedPatients() {
        let approvedPatients = JSON.parse(localStorage.getItem(localStorage_KEYS.APPROVED_PATIENTS)) || [];
        let approvedPatientList = document.getElementById('approvedlistOfPatientsForAppointment');
        approvedPatientList.innerHTML = '';

        approvedPatients.forEach(function (patientDetails, index) {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${index + 1}</td>
                <td>${patientDetails.Name}</td>
                <td>${patientDetails.AppointmentDate}</td>
                <td>${patientDetails.PhoneNumber}</td>
                <td>${patientDetails.AppointmentTime}</td>
            `;
            approvedPatientList.appendChild(row);
        });
    }
});
