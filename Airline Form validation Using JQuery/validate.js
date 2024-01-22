$().ready(function () {

    $("#airLineForm").validate({

        rules: {
            txtName: {
                required: true,
                minlength: 2 // For length of name
            },
            email: {
                required: true,
                email: true
            },
            phoneNumber: {
                required: true,
                phoneNumber: true
            },
            password: {
                required: true,
                minlength: 5
            },
            confirm_password: {
                required: true,
                minlength: 5,
                equalTo: "#password" // For checking both passwords are the same or not
            },
            agree: "required"
        },

        // message as per rules
        messages: {
            txtName: {
                required: " Please enter your Name",
                minlength:
                    " Your name must consist of at least 2 characters"
            },
            email: {
                required: "Please enter your email",
                email: "Please enter a valid email address"
            },
            phoneNumber: {
                required: "Please enter your phone nubmer",
                phoneNumber: "Please enter a valid phone nubmer"
            },
            password: {
                required: "Please enter a password",
                minlength:
                    " Your password must be consist of at least 5 characters"
            },
            confirm_password: {
                required: "Please enter a password",
                minlength:
                    "Your password must be consist of at least 5 characters",
                equalTo: "Please enter the same password as above"
            },
            agree: "Please accept our policy"
        }
    });
});
