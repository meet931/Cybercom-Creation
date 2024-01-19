// Day
(() => {
    let day_selected = (new Date).getDate(); // current day
    let option = '';
    let day = '';
    option = '<option value="">Day</option>'; // first option

    for (let i = 1; i < 32; i++) {
        // value day number adding 0. 01 02 03 04..
        day = (i <= 9) ? '0' + i : i;

        // or value day number 1 2 3 4..
        // day = i;

        let selected = (i === day_selected ? ' selected' : '');
        option += '<option value="' + day + '"' + selected + '>' + day + '</option>';
    }
    document.getElementById("day").innerHTML = option;
})();

// year
var yearSelect = document.getElementById("year");
var currentYear = new Date().getFullYear();
for (var i = currentYear; i >= 1900; i--) {
    var option = document.createElement("option");
    option.value = "" + i;
    option.text = i;
    yearSelect.add(option);
}

function handleSubmit() {
    setTimeout(function () {
        window.location.href = 'submit.html';
    }, 2000);
}