$(document).ready(function () {

    $('#addForm').validate({

        rules: {
            txtproductTitle: {
                required: true,
                minlength: 2
            },

            numProductPrice: "required",

            txtareaDescription: {
                required: true,
                minlength: 5
            },

            selectCategory: "required",

            imgLink:  {
                required: true,
                minlength: 10
            },
            agree: "required"
        },

        messages: {
            txtproductTitle:  {
                required: " Please enter a title",
                minlength:
                    " Title must consist of at least 2 characters"
            },
            numProductPrice: " Please enter a price",
            txtareaDescription:  {
                required: " Please enter a description",
                minlength:
                    " Description must consist of at least 5 characters"
            },
            selectCategory: " Please select a category",
            imgLink:  {
                required: " Please enter image link",
                minlength:
                    " Image link must consist of at least 10 characters"
            },

        }

    });

});