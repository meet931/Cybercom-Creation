$(document).ready(function () {
    $("#registrationForm").validate({
        rules: {
            txtName: {
                required: true,
                minlength: 2,
            },
            email: {
                required: true,
            },
            password: {
                required: true,
                minlength: 5
            },
            cnfPassword: {
                required: true,
                minlength: 5,
                equalTo: "#cnfPassword"
            },
            agree: "required"
        },

        messages: {
            txtName: "Please enter your name",
            email: "Please enter your email",
            password: {
                required: "Please enter a password",
                minlength: "Your password must consist of at least 5 characters"
            },
            cnfPassword: {
                required: "Please enter a password",
                minlength: "Your password must consist of at least 5 characters",
                equalTo: "Please enter the same password as above"
            },
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


