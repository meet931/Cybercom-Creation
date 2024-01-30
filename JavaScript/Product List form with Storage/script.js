$(document).ready(function () {
    $("#productForm").validate({
        rules: {
            txtproductTitle: {
                required: true,
                minlength: 2
            },
            numProductPrice: {
                required: true,
            },
            txtareaDescription: {
                required: true,
                minlength: 5,
            },
            category: {
                required: true,
            },
        },
        messages: {
            txtproductTitle: "Please enter Product Title",
            numProductPrice: "Please enter Price",
            txtareaDescription: {
                required: "Please enter Description",
                minlength: "Product description must be at least 5 characters long"
            },
            category: "Please select a Category"
        },
    });
});
