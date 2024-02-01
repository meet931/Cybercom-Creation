$(document).ready(function() {

    // Checking if local storage has users stored
    if(localStorage.getItem('users')) {
        renderUsers();
    }

    // Form submission
    $('#addUserForm').submit(function(event) {
        event.preventDefault();
        
        // Get form values
        var txtUserName = $('#txtUserName').val();
        var userEmail = $('#userEmail').val();
        var userPassword = $('#userPassword').val();
        var userBdate = $('#userBdate').val();
        var userAge = function(userBdate) {
          let year = get(userBdate) - 2024;
        };


        // Basic validation
        if(txtUserName && userEmail && userPassword && userBdate) {
            // Create user object
            var user = {
                txtUserName: txtUserName,
                userEmail: userEmail,
                userPassword: userPassword,
                userBdate: userBdate
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
            $('#addUserForm')[0].reset();

            // Render users
            renderUsers();
        } else {
            alert('All fields are required!');
        }
    });

    // Function to render users in the table
    function renderUsers() {
        var users = JSON.parse(localStorage.getItem('users'));
        $('#userList').empty();

        $.each(users, function(index, user) {
            var row = '<tr>' +
                        '<td>' + user.txtUserName + '</td>' +
                        '<td>$' + user.userEmail + '</td>' +
                        '<td>' + user.userPassword + '</td>' +
                        '<td>' + user.userBdate + '</td>' +
                        '<td>' + user.userAge + '</td>' +
                        '<td><button class="edit" data-id="' + index + '">Edit</button>' +
                        ' <button class="delete" data-id="' + index + '">Delete</button></td>' +
                      '</tr>';
            $('#userList').append(row);
        });
    }

    // Event delegation for delete buttons
    $(document).on('click', '.delete', function() {
        var userId = $(this).data('id');
        var users = JSON.parse(localStorage.getItem('users'));
        users.splice(userId, 1);
        localStorage.setItem('users', JSON.stringify(users));
        renderUsers();
    });
});
