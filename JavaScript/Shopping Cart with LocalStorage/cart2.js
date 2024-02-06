let cart = JSON.parse(localStorage.getItem("CART")) || [];
const cartItem = document.getElementById('cart-items');
const grandTotal = document.getElementById('grandTotal');

renderProdcuts();

// RENDER PRODUCTS
function renderProdcuts() {
  cartItem.innerHTML ='';
  cart.forEach((product) => {
 
    const div = document.createElement('div');
    div.className = "item"
    div.innerHTML += `
                <div class="item-container">
                    <div class="item-img">
                        <img src="${product.imgSrc}" alt="${product.name}">
                        <h4>${product.name}</h4>
                    </div>
                    <div class="desc">
                        <h5>&#8377;${product.price}</h5>
                    </div>
                    <div class="noOfUnits">
                        <h5>${product.numberOfUnits}</h5>
                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="totalPrice">
                      <h5>&#8377;${product.price * product.numberOfUnits}</h5>
                    </div>
                </div>  
        `;
        cartItem.appendChild(div);
  });
}

function calculatePrice() {
  let totalPrice = 0,
    totalItems = 0;

  cart.forEach((item) => {
    totalPrice += item.price * item.numberOfUnits;
    totalItems += item.numberOfUnits;
  });
  grandTotal.innerHTML = `Grandtotal (${totalItems} items):&nbsp; &#8377; <h4>${totalPrice}</h4>`

}

calculatePrice();