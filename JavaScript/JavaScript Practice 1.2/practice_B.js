// Create an object to store information about a product (e.g., name, price, quantity, etc.). 
// Write code to calculate the total cost of a specified quantity of the product.



const productInformation = {
    id: 123456,
    name: "MSI G63 Laptop",
    price: 49990,
    quantity: 100
};

function calculateTotalCost (yourQuantity) {
    if (yourQuantity <= 0) {
        console.log('Please enter a valid quantity.');
        return 0;
    }

    if (yourQuantity > productInformation.quantity) {
        console.log(`Not enough stock available. Available quantity: ${product.quantityInStock}`);
        return 0;
    }

    const totalCost = yourQuantity * productInformation.price;
    return totalCost;
}


// Example
const quantityToBy = 10;
const totalCost = calculateTotalCost(quantityToBy);

if(totalCost > 0) {
    console.log('\n##### Welcome to MSI Store #####\n')
    console.log(`Total cost for buying ${quantityToBy} units of ${productInformation.name}: ${totalCost} Rs.\n\n----- Thank you for visiting us -----`)
}
