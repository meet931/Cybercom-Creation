document.addEventListener('DOMContentLoaded', function() {
    let users = JSON.parse(localStorage.getItem('users')) || [];

    // SHOWING REGISTRATION FORM
    document.getElementById('showRegister').addEventListener('click', function(event) {
        event.preventDefault();
        document.getElementById('loginForm').style.display = 'none';
        document.getElementById('registerForm').style.display = 'block';
    });

    // SHOWING LOGIN FORM
    document.getElementById('showLogin').addEventListener('click', function(event) {
        event.preventDefault();
        document.getElementById('registerForm').style.display = 'none';
        document.getElementById('loginForm').style.display = 'block';
    });

    // REGISTRATION
    document.getElementById('registerBtn').addEventListener('click', function(event) {
        event.preventDefault();
        resetErrors();

        // VALUES
        let username = document.getElementById('newUsername').value;
        let fullName = document.getElementById('fullName').value;
        let email = document.getElementById('registerEmail').value; 
        let phone = document.getElementById('phone').value;
        let role = document.getElementById('newRole').value;
        let password = document.getElementById('newPassword').value;

        // Validate fields
        if (!username || !password || !role || !fullName || !email || !phone) {
            document.getElementById('registerError').textContent = 'Please fill in all fields';
            return;
        }

        // Check for username or email availability
        if (users.some(user => user.username === username) || users.some(user => user.email === email)) {
            document.getElementById('registerError').textContent = 'User already exists';
            return;
        }

        // Add the user to the local storage
        let newUser = {
            username,
            password,
            role,
            fullName,
            email,
            phone
        };

        users.push(newUser);
        localStorage.setItem('users', JSON.stringify(users));

        alert('Registration successful. Please login.');
        document.getElementById('registerForm').style.display = 'none';
        document.getElementById('loginForm').style.display = 'block';
    });

    // LOGIN
    document.getElementById('loginBtn').addEventListener('click', function(event) {
        event.preventDefault();
        resetErrors();

        let username = document.getElementById('username').value;
        let userEmail = document.getElementById('loginEmail').value;
        let password = document.getElementById('loginPassword').value;
        let role = document.getElementById('role').value;

        // Validate fields
        if (!username || !userEmail || !password || !role) {
            document.getElementById('loginError').textContent = 'Please fill in all fields';
            return;
        }

        // Check for valid username and password
        let patient = users.find(patient => patient.username === username && patient.password === password && patient.role === 'patient');
        console.log('Patient', patient)
        let dr = users.find(dr => dr.username === username && dr.password === password && dr.role === 'doctor');
        console.log('Dr', dr)

        if (patient) {

            localStorage.setItem('loggedInPatient', JSON.stringify(patient));
            alert('Login successful');
            window.location.href = '/html/dashboard/patient/patientDashboard.html';
        } else if(dr) {
            localStorage.setItem('loggedInDr', JSON.stringify(dr));
            alert('Login successful');
            window.location.href = '/html/dashboard/dr/drDashboard.html';
        } else {
            document.getElementById('loginError').textContent = 'Invalid username or password';
        }
    });

    // Reset error messages
    function resetErrors() {
        document.getElementById('registerError').textContent = '';
        document.getElementById('loginError').textContent = '';
    }
});
