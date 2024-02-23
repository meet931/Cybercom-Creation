const localStorage_KEYS = {
    PRODUCTS: 'products'
};

let listProduct = document.querySelector('.listProduct');
let products = JSON.parse(localStorage.getItem(localStorage_KEYS.PRODUCTS)) || [];
let url = 'https://dummyjson.com/products';

// FOR PAGINGATION
const productsPerPage = 9;
let currentPage = 1;
let totalPages = 0;


// FETCHING API URL
const getDataUsingFetch = () => {
    fetch(url, {
        method: 'GET',
        headers: {
            'Content-type': 'application/json'
        }
    })
        .then(response => response.json())
        .then(data => {
            products = data.products;
            displayProducts(products);
            // console.log(products)
        })
        .catch(error => console.log(error));
};

getDataUsingFetch();


// DISPLAYING PRODUCT LIST
const displayProducts = (products) => {
    const startIndex = (currentPage - 1) * productsPerPage;
    const endIndex = currentPage * productsPerPage;
    const paginatedProducts = products.slice(startIndex, endIndex);

    listProduct.innerHTML = '';

    if (paginatedProducts.length > 0) {
        paginatedProducts.forEach(product => {
            let newProduct = document.createElement('div');
            newProduct.dataset.id = Date.now();
            newProduct.classList.add('item');
            newProduct.innerHTML =
                `<img src="${product.thumbnail}" alt="">
                <h2>${product.title}</h2>
                <h4>Rating: ${product.rating}</h4>
                <div class="price">$${product.price}</div>
                <button class="removeBtn" onclick="removeProduct()">Remove</button>`;
            listProduct.appendChild(newProduct);
        });

        updatePagination(products.length);
    } else {
        listProduct.innerHTML = '<div>Couldn\'t find any products</div>';
        updatePagination(0);
    }
}


// SHOWING PAGE NUMBER AS PER API'S PRODUCT LISTING
const updatePagination = (totalProducts) => {
    // console.log('totalProducts: ',totalProducts);
    const pagination = document.querySelector('.pagination');
    pagination.innerHTML = '';

    totalPages = Math.ceil(totalProducts / productsPerPage);
    // console.log(totalPages)

    for (let i = 1; i <= totalPages; i++) {
        const pageLink = document.createElement('a');
        pageLink.textContent = i;
        pageLink.href = '#';
        pageLink.addEventListener('click', () => {
            currentPage = i;
            displayProducts(products);
        });
        pagination.appendChild(pageLink);
    }
}


// SEARCHING PRODUCT
const searchItem = () => {
    let txtSearch = document.getElementById('txtSearch').value.trim().toLowerCase();

    fetch(url)
        .then(response => response.json())
        .then(data => {
            const products = data.products;
            // console.log(products)
            const filteredProducts = products.filter(product => {
                return product.title.toLowerCase().includes(txtSearch) ||
                    product.description.toLowerCase().includes(txtSearch) ||
                    product.category.toLowerCase().includes(txtSearch);
            });

            // SORTING
            const sortBy = document.getElementById('itemSorting').value;

            // for rating
            if (sortBy === 'ratingLowToHigh') {
                filteredProducts.sort((a, b) => a.rating - b.rating);
            } else if (sortBy === 'ratingHighToLow') {
                filteredProducts.sort((a, b) => b.rating - a.rating);

                // for price
            } else if (sortBy === 'priceLowToHigh') {
                filteredProducts.sort((a, b) => a.price - b.price);
            } else if (sortBy === 'priceHighToLow') {
                filteredProducts.sort((a, b) => b.price - a.price);
            }

            // console.log(filteredProducts);

            displayProducts(filteredProducts);
        })
        .catch(error => console.log(error));
};


// SORTING
document.getElementById('sorting').addEventListener('change', function () {
    searchItem();
});


// ADDING PRODUCTS
const addProduct = () => {
    openNav();

    const img = document.getElementById('imageLink').value;
    const productName = document.getElementById('title').value;
    const rating = document.getElementById('rating').value;
    const price = document.getElementById('price').value;

    const addedProduct = {
        'id': Date.now(),
        'image': img,
        'name': productName,
        'rating': rating,
        'price': price
    };

    if (!img || !productName || !rating || !price) {
        return;
    } else {
        let products = JSON.parse(localStorage.getItem(localStorage_KEYS.PRODUCTS)) || [];

        products.push(addedProduct);

        localStorage.setItem(localStorage_KEYS.PRODUCTS, JSON.stringify(products));

        displayProducts(products);
        document.getElementById('productForm').reset();
    }
}


// FOR REMOVING PRODUCTS FROM THE SERVER
const removeProduct = () => {
    fetch(url, {
        method: 'DELETE',
    })
        .then(res => {
            if(res.ok) {
                console.log('Item is deleted successfully....')
            } else {
                console.log('Failed to delete resource.', res.status);
            }
        })
        .catch(error => console.log(error));


    if(localStorage.getItem(localStorage_KEYS.PRODUCTS)) {
        let products = JSON.parse(localStorage.getItem(localStorage_KEYS.PRODUCTS));
        console.log(products);
        let id = products.id;
        console.log(id);
        products.slice(id, 1);
    } else {
        localStorage.setItem(localStorage_KEYS.PRODUCTS, JSON.stringify(products));
    }
}


// NAV OPENING
function openNav() {
    document.getElementById("mySidenav").style.width = "260px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}