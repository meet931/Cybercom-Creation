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
                digits: true,
                minlength: 10,
                maxlength: 12
            },
            fromDestination: {
                required: true,
            },
            toDestination: {
                required: true,
            },
            departureDate: {
                required: true,
            },
            noOfPassenger: {
                required: true,
            },
            class: {
                required: true,
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

        // messages as per rules
        messages: {
            txtName: {
                required: "Please enter your Name",
                minlength: "Your name must consist of at least 2 characters"
            },
            email: {
                required: "Please enter your email",
                email: "Please enter a valid email address"
            },
            phoneNumber: {
                required: "Please enter your phone number",
                digits: "Please enter a valid phone number",
                minlength: 'Min 10 digits',
                maxlength: 'Max 12 digits'
            },
            fromDestination: {
                required: "Please enter your Destination",
            },
            toDestination: {
                required: "Please enter your Destination",
            },
            departureDate: {
                required: "Please enter your departure date.",
            },
            noOfPassenger: {
                required: "Please add no. of passengers.",
            },
            class: {
                required: "Please select class type.",
            },
            password: {
                required: "Please enter a password",
                minlength: "Your password must consist of at least 5 characters"
            },
            confirm_password: {
                required: "Please enter a password",
                minlength: "Your password must consist of at least 5 characters",
                equalTo: "Please enter the same password as above"
            },
            agree: "Please accept our policy"
        },

        // messages with red color
        errorPlacement: function (error, element) {
            error.css({ "color": "red" });
            error.insertAfter(element);
        },

        // Highlight and unhighlight fields with red border on error
        highlight: function (element, errorClass, validClass) {
            $(element).css({ "border": "1px solid red" });
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).css({ "border": "1px solid #ccc" });
        },

        // Form submission handler
        submitHandler: function (form) {
            form.submit();
        }
    });
});