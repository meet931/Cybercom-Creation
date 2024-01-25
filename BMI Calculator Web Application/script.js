function calculateBMI() {
    let heightInput = document.getElementById('height');
    let weightInput = document.getElementById('weight');
    let bmiValue = document.getElementById('bmiValue');
    let bmiCategory = document.getElementById('bmiCategory');

    // CLEAR PREVIOUS RESULTS
    bmiValue.innerHTML = '';
    bmiCategory.innerHTML = '';

    // CALCULATING BMI
    let height = parseFloat(heightInput.value);
    let weight = parseFloat(weightInput.value);

    if (isNaN(height) || isNaN(weight) || height <= 0 || weight <= 0) {
        alert('Please enter valid numerical values for height and weight.');
    } else {
        // FORMULA FOR BMI
        let bmi = weight / (height * height);

        // DISPLAY BMI VALUE
        bmiValue.innerHTML = 'Your BMI: ' + bmi.toFixed(2); // Round to 2 decimal places

        // BMI CATEGORY
        if (bmi < 18.5) {
            bmiCategory.innerHTML = 'Category: Underweight';
        } else if (bmi >= 18.5 && bmi < 24.9) {
            bmiCategory.innerHTML = 'Category: Normal Weight';
        } else if (bmi >= 25 && bmi < 29.9) {
            bmiCategory.innerHTML = 'Category: Overweight';
        } else {
            bmiCategory.innerHTML = 'Category: Obese';
        }
    }
}
