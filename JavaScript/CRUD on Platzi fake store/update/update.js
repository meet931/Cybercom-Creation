document.addEventListener('DOMContentLoaded', function() {

    const urlParams = new URLSearchParams(window.location.search);
    const productId = urlParams.get('id');
    console.log(productId)

    fetch('https://api.escuelajs.co/api/v1/products/' + productId)
    .then(response => {
        // console.log(response)
        if(response.ok) {
            console.log('Product fetched successfully...!!')
            return response.json();
        } else {
            console.log('Failed to fetch..!!', response.status);
        }
    })
    .then(product => {
        console.log(product);
        document.getElementById('txtproductTitle').value = product.title;
        document.getElementById('numProductPrice').value = product.price;
        document.getElementById('txtareaDescription').value = product.description;
        document.getElementById('imgLink').value = product.images.join(",");
    })
    .catch(error => console.log(error))

    document.getElementById('updateForm').addEventListener('submit', (event) => {

        console.log(event);
        event.preventDefault();

        if (validateForm()) {
            const updateProduct = {
                title: document.getElementById('txtproductTitle').value,
                price: document.getElementById('numProductPrice').value,
                description: document.getElementById('txtareaDescription').value,
                images: document.getElementById('imgLink').value
                    .split(",")
                    .map(function (url) {
                      return url.trim();
                    }),
            };
    
            fetch('https://api.escuelajs.co/api/v1/products/' + productId, {
                method: "PUT",
                headers: {
                    "Content-type": 'application/json'
                },
                body: JSON.stringify(updateProduct)
            })
            .then(response => {
                console.log(response)
                if(response.ok) {
                    alert('Product updated successfully..!!');
                    return response.json();
                } else {
                    console.log('Failed to update..!!')
                }
            })
            .then(data => console.log(data))
            .catch(error => console.log(error))
        }
    });

    function validateForm() {
        const title = document.getElementById('txtproductTitle').value.trim();
        const price = document.getElementById('numProductPrice').value.trim();
        const description = document.getElementById('txtareaDescription').value.trim();
        const imgLink = document.getElementById('imgLink').value.trim();

        if (title === '' || price === '' || description === '' || imgLink === '') {
            return false;
        }

        return true;
    }
});