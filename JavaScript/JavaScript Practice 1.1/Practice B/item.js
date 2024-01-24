document.addEventListener('DOMContentLoaded', function () {
    // By default, submit & remove button is disabled
    document.querySelector('#submit').disabled = true;
    document.querySelector('#remove').disabled = true;

    document.querySelector('#item').onkeyup = () => {
        // Button For adding the items in the list
        if (document.querySelector('#item').value.length > 0) {
            document.querySelector('#submit').disabled = false;
        } else {
            document.querySelector('#submit').disabled = true;
        }

        // Button For Removing the items from the list 
        if (document.querySelector('#items li')) {
            document.querySelector('#remove').disabled = false;
        } else {
            document.querySelector('#remove').disabled = true;
        }
    };

    document.querySelector('form').onsubmit = () => {
        // what user has typed in
        const item = document.querySelector('#item').value;

        // create list inside ul and whatever user typed in should go inside li
        const li = document.createElement('li');
        li.innerHTML = item;

        // add new li into ul
        document.querySelector('#items').appendChild(li);

        // input field is cleared out when the task is submitted
        document.querySelector('#item').value = '';

        // after submitting, button is disabled
        document.querySelector('#submit').disabled = true;

        // stop form from submitting
        return false;
    };

    document.querySelector('#remove').onclick = () => {
        // remove the last item from the list
        const itemsList = document.querySelector('#items');
        itemsList.removeChild(itemsList.lastElementChild);

        // disable remove button if there are no items left
        if (!document.querySelector('#items li')) {
            document.querySelector('#remove').disabled = true;
        }
    };
});