function validateForm(event) {
    event.preventDefault();

    // Reset error messages
    document.getElementById('firstNameError').innerText = '';
    document.getElementById('lastNameError').innerText = '';
    document.getElementById('emailError').innerText = '';

    // Get form values
    const firstName = document.getElementById('firstName').value.trim();
    const lastName = document.getElementById('lastName').value.trim();
    const email = document.getElementById('email').value.trim();

    // Validate first name
    if (firstName === '') {
        document.getElementById('firstNameError').innerText = 'First name is required';
        return;
    }

    // Validate last name
    if (lastName === '') {
        document.getElementById('lastNameError').innerText = 'Last name is required';
        return;
    }

    // Validate email
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        document.getElementById('emailError').innerText = 'Invalid email address';
        return;
    }

    // If all validations pass, you can submit the form or perform further actions
    alert('Form submitted successfully!');
}
