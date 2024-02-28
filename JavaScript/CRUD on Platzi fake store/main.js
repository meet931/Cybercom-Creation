let listProduct = document.querySelector('.listProduct');

// FOR PAGINGATION
const productsPerPage = 9;
let currentPage = 1;
let totalPages = 0;
let products = [];
let filteredProducts = [];


// FETCHING API URL
const getDataUsingFetch = () => {
    fetch('https://api.escuelajs.co/api/v1/products', {
        method: 'GET',
        headers: {
            'Content-type': 'application/json'
        }
    })
        .then(response => {
            if (response.ok) {
                console.log('success')
                return response.json();
            } else {
                console.log('failed to load', response.status);
            }
        })
        .then(data => {
            // console.log(data)
            products = data
            displayProducts(products);
        })
        .catch(error => console.log(error));
};

getDataUsingFetch();


const displayProducts = (products) => {
    const startIndex = (currentPage - 1) * productsPerPage;
    const endIndex = currentPage * productsPerPage;
    const paginatedProducts = products.slice(startIndex, endIndex);

    // console.log(products)

    listProduct.innerHTML = '';

    if (paginatedProducts.length > 0) {
        paginatedProducts.forEach(product => {
            // console.log(product)
            let newProduct = document.createElement('div');
            newProduct.dataset.id = Date.now();
            newProduct.classList.add('item');
            newProduct.innerHTML =
                // `<img src="${JSON.parse(product.images[0])[0]}" alt="">
                `<img src="${(product.images[0])[0]}" alt="">
                <h2>${product.title}</h2>
                <div class="price">Rs.${product.price}</div> </br>
                <details>
                    <summary>Description</summary>
                    ${product.description}
                </details>
                <button class="updateBtn" id="updateBtn" onclick="updateBtn(${product.id})">Update</button>
                <button class="removeBtn" onclick="removeProduct(${product.id})">Remove</button>`;
            listProduct.appendChild(newProduct);
        });

        updatePagination(products.length);
    } else {
        listProduct.innerHTML = '<div>Couldn\'t find any products</div>';
        updatePagination(0);
    }
}

const updateBtn = (id) => {
    console.log(id);
    window.location.href = '/update/index.html?id=' + id;
}


// SHOWING PAGE NUMBER AS PER API'S PRODUCT LISTING
const updatePagination = (totalProducts) => {
    const pagination = document.querySelector('.pagination');
    pagination.innerHTML = '';

    totalPages = Math.ceil(totalProducts / productsPerPage);

    const previousLink = document.createElement('a');
    previousLink.textContent = "<<";
    previousLink.href = '#';
    previousLink.addEventListener('click', () => {
        if(currentPage > 1) {
            currentPage--;
            displayProducts(filteredProducts);
        }
    });
    pagination.appendChild(previousLink);

    for (let i = 1; i <= totalPages; i++) {
        const pageLink = document.createElement('a');
        pageLink.textContent = i;
        pageLink.href = '#';
        pageLink.addEventListener('click', () => {
            currentPage = i;
            displayProducts(filteredProducts);
        });
        pagination.appendChild(pageLink);
    }

    const nextLink = document.createElement('a');
    nextLink.textContent = '>>';
    nextLink.href = '#';
    nextLink.addEventListener('click', () => {
        if(currentPage < totalPages) {
            currentPage++;
            displayProducts(filteredProducts);
        }
    });
    pagination.appendChild(nextLink);
}


// SEARCHING PRODUCT
const searchItem = () => {
    let txtSearch = document.getElementById('txtSearch').value.trim().toLowerCase();

    fetch('https://api.escuelajs.co/api/v1/products')
        .then(response => response.json())
        .then(data => {
            filteredProducts = data.filter(product => {
        
                return product.title.toLowerCase().includes(txtSearch) ||
                    product.description.toLowerCase().includes(txtSearch) ||
                    (product.category && typeof product.category.name === 'string' && product.category.name.toLowerCase().includes(txtSearch));
            });

            // SORTING
            const sortBy = document.getElementById('itemSorting').value;

            // for price
            if (sortBy === 'priceLowToHigh') {
                filteredProducts.sort((a, b) => a.price - b.price);
            } else if (sortBy === 'priceHighToLow') {
                filteredProducts.sort((a, b) => b.price - a.price);
            } else if (sortBy === 'a-z') {
                filteredProducts.sort((a, b) => a.title.localeCompare(b.title));
            } else if (sortBy === 'z-a') {
                filteredProducts.sort((a, b) => b.title.localeCompare(a.title));
            }

            displayProducts(filteredProducts);
        })
        .catch(error => console.log(error));
};



// SORTING
document.getElementById('sorting').addEventListener('change', function filterByCategory() {
    searchItem();
});


// FETCHING CATEGORIES
const fetchCategories = () => {
    fetch('https://api.escuelajs.co/api/v1/categories')
    .then(response => {
        if(!response.ok) {
            throw new Error('Failed to fetch data');
        }
        return response.json();
    })
    .then(categories => {
        // console.log(categories);
        const filterByCategory = document.getElementById('filterByCategory');
        categories.forEach((category) => {
            const option = document.createElement('option');
            option.value = category.name;
            option.textContent = category.name;
            filterByCategory.appendChild(option);
        });
    })
    .then()
    .catch(error => console.log(error))
}
fetchCategories();
document.getElementById('filterByCategory').addEventListener('change', function () {

    console.log('filter');
    // let filteredProducts = products;
    let categorySelected = document.getElementById('filterByCategory').value;


    if (categorySelected !== '') {
        // console.log(products)
        // console.log(categorySelected)
        
        filteredProducts = products.filter((product) => {
            return product.category && product.category.name === categorySelected;
        });
        console.log(filteredProducts)
    } else {

        // If no category is selected, show all products
        filteredProducts = products;
    }
    currentPage = 1;
    updatePagination(filteredProducts.length);
    displayProducts(filteredProducts)


});

// FOR REMOVING PRODUCTS FROM THE SERVER
const removeProduct = (id) => {
    console.log(id)
    const confirmed = confirm('Are you sure you want to delete this product?');

    if(confirmed) {
        fetch(`https://api.escuelajs.co/api/v1/products/${id}`, {
            method: 'DELETE',
        })
        .then(res => {
            if (res.ok) {
                console.log('Item is deleted successfully....')
                location.reload();
            } else {
                console.log('Failed to delete resource.', res.status);
            }
        })
        .catch(error => console.log(error));
    }

}