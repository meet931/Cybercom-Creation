let cart = JSON.parse(localStorage.getItem("CART")) || [];
const cartItem = document.getElementById('cart-items');
const grandTotal = document.getElementById('grandTotal');

renderProdcuts();

// RENDER PRODUCTS
function renderProdcuts() {
  // cartItem.innerHTML ='';
  cart.forEach((product) => {
 
    const div = document.createElement('div');
    div.className = "item"
    div.innerHTML += `
                <div class="item-container">
                    <div class="item-img">
                        <img src="${product.imgSrc}" alt="${product.name}">
                    </div>
                    <div class="desc">
                        <h2>${product.name}</h2>
                        <h2><small>Rs. </small>${product.price}</h2>
                    </div>
                    <div class="add-to-cart" onclick="addToCart(${product.id})">
                        <img src="./icons/bag-plus.png" alt="add to cart">
                    </div>
                </div>  
        `;
        cartItem.appendChild(div);
  });
}

function calculatePrice() {
  let totalPrice = cart.reduce((current, previous) => {
    return previous.price + current
  }, 0);
  grandTotal.innerHTML = `Grandtotal (${cart.length} items): Rs. ${totalPrice}`

}

calculatePrice();