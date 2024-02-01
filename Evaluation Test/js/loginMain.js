document.addEventListener('DOMContentLoaded', function() {

    document.querySelector('#loginButton').addEventListener('click', () => {

            // Checking if local storage has users stored
            if(localStorage.getItem('users')) {
                renderUsers();
            }
            
            // Form submission
            $('#loginForm').submit(function(event) {
                event.preventDefault();
                
                // Get form values
                var emailValue = $('#email').val();
                var loginPwd = $('#password').val();

                // Basic validation
                if(emailValue && loginPwd) {
                    // Create user object
                    var user = {
                        emailValue: emailValue,
                        loginPwd: loginPwd
                    };

                    // Store user in local storage
                    if(localStorage.getItem('users')) {
                        var users = JSON.parse(localStorage.getItem('users'));
                        users.push(user);
                        localStorage.setItem('users', JSON.stringify(users));
                    } else {
                        localStorage.setItem('users', JSON.stringify([user]));
                    }

                    // Clear form fields
                    $('#loginForm')[0].reset();

                    // Render users
                    renderUsers();
                } else {
                    alert('All fields are required!');
                }
            });
    });

});