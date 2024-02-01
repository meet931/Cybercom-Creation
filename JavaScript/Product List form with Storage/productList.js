document.addEventListener('DOMContentLoaded', function() { 

    const products = JSON.parse(localStorage.getItem("products"));
    console.log(products)

    products.forEach(element => {
        const tbody = document.getElementById("tbody");
        console.log(tbody)

        tbody.forEach

    });

    // for (let i = 0; i < productTitles.length; i++) {
    //     let tableRow = document.createElement('tr');

    //     let tableData1 = document.createElement('td');
    //     tableData1.innerHTML = productTitles[i];

    //     let tableData2 = document.createElement('td');
    //     tableData2.innerHTML = categories[i];

    //     let tableData3 = document.createElement('td');
    //     tableData3.innerHTML = productPrices[i];

    //     let editButton = document.querySelector('#editButton');

    //     let deleteButton = document.querySelector('#dltButton');

    //     tableRow.appendChild(tableData1);
    //     tableRow.appendChild(tableData2);
    //     tableRow.appendChild(tableData3);
    //     tableRow.appendChild(editButton);
    //     tableRow.appendChild(deleteButton);

    //     document.querySelector('.tbody').appendChild(tableRow);
    // }
});
