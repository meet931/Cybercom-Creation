var yearSelect = document.getElementById("year");
var currentYear = new Date().getFullYear();
for (var i = currentYear; i >= 1900; i--) {
    var option = document.createElement("option");
    option.value = "" + i;
    option.text = i;
    yearSelect.add(option);
}

