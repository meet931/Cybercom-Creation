$(document).ready(function () {
    $("#loginForm").validate({
        rules: {
            email: {
                required: true,
            },
            password: {
                required: true,
                minlength: 5
            },
            agree: "required"
        },

        messages: {
            email: "Please enter your email",
            password: {
                required: "Please enter a password",
                minlength: "Your password must consist of at least 5 characters"
            },
        },

         // messages with red color
         errorPlacement: function (error, element) {
            error.css({ "color": "red" });
            error.insertAfter(element);
        },

        // Highlight and unhighlight fields with red border on error
        highlight: function (element) {
            $(element).css({ "border": "1px solid red" });
        },
        unhighlight: function (element) {
            $(element).css({ "border": "1px solid #ccc" });
        },

        // Form submission handler
        submitHandler: function (form) {
            form.submit();
        }
    });
});


