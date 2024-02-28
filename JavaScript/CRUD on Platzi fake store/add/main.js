fetch('https://api.escuelajs.co/api/v1/categories')
.then(response => response.json())
.then(productCategories => {
    // console.log(productCategories);

    // I'm selecting the select for appending the categories options into select
    const selectCategory = document.getElementById('selectCategory');
    productCategories.forEach((category) => {
        let option = document.createElement('option');
        option.value = category.id;
        option.textContent = category.name;
        selectCategory.appendChild(option);
    });
})
.catch(error => console.log(error))


document.getElementById('addForm').addEventListener('submit', (event) => {

    event.preventDefault();
    // console.log(event);

    const title = document.getElementById('txtproductTitle').value;
    const price = document.getElementById('numProductPrice').value;
    const txtareaDescription = document.getElementById('txtareaDescription').value;
    const imgLink = document.getElementById('imgLink').value;

    if(title || price || txtareaDescription || imgLink) {
        const addedProduct = {
            "title": title,
            "price": price,
            "description": txtareaDescription,
            "categoryId": 1,
            "images": imgLink.split(",")
            .map((url) => url.trim()),
        };
    
        console.log(addedProduct)
        fetch('https://api.escuelajs.co/api/v1/products/', {
            method: 'POST',
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(addedProduct)
        })
        .then(response => response.json())
        .then(data => {
            console.log(data);
            alert('Product added succefully...!!');
        })
        .catch(error => console.log(error))
    }

});