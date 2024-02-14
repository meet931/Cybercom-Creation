document.addEventListener('DOMContentLoaded', function () {
    let users = JSON.parse(localStorage.getItem('users')) || [];

    // SHOWING REGISTRATION FORM
    document.getElementById('showRegister').addEventListener('click', function (event) {
        event.preventDefault();
        document.getElementById('loginForm').style.display = 'none';
        document.getElementById('registerForm').style.display = 'block';
    });

    // SHOWING LOGIN FORM
    document.getElementById('showLogin').addEventListener('click', function (event) {
        event.preventDefault();
        document.getElementById('registerForm').style.display = 'none';
        document.getElementById('loginForm').style.display = 'block';
    });

    // REGISTRATION
    document.getElementById('registerBtn').addEventListener('click', function (event) {
        event.preventDefault();
        resetErrors();

        // VALUES
        let username = document.getElementById('newUsername').value.trim();
        let fullName = document.getElementById('fullName').value.trim();
        let email = document.getElementById('registerEmail').value.trim();
        let phone = document.getElementById('phone').value.trim();
        let role = document.getElementById('newRole').value.trim();
        let password = document.getElementById('newPassword').value.trim();

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
    document.getElementById('loginBtn').addEventListener('click', function (event) {
        event.preventDefault();
        resetErrors();

        let username = document.getElementById('username').value.trim();
        let userEmail = document.getElementById('loginEmail').value.trim();
        let password = document.getElementById('loginPassword').value.trim();
        let role = document.getElementById('role').value.trim();

        // Validate fields
        if (!username || !userEmail || !password || !role) {
            document.getElementById('loginError').textContent = 'Please fill in all fields';
            return;
        }

        // Check for valid username and password
        let user = users.find(user => user.username === username && user.password === password && user.role === role);

        if (user) {
            localStorage.setItem('loggedInUser', JSON.stringify(user));
            alert('Login successful');
            if (role === 'patient') {
                window.location.href = '/html/dashboard/patient/patientFrame.html';
            } else if (role === 'doctor') {
                window.location.href = '/html/dashboard/dr/drFrame.html';
            }
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
