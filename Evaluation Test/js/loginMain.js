document.addEventListener('DOMContentLoaded', function() {

    document.querySelector('#loginButton').addEventListener('click', () => {

            let emailValue = document.getElementById('email').value;
            let loginPwd = document.getElementById('password').value;

             // Store user in local storage
             if(localStorage.getItem('users')) {
                var users = JSON.parse(localStorage.getItem('user'));
                users.push(users);
                localStorage.setItem('users', JSON.stringify(users));
            } else {
                localStorage.setItem('users', JSON.stringify([users]));
            }

    });

});