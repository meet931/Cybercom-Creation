// Write a function that takes an object as an argument and returns a new object with 
// specific properties. For example, a function that takes an object with name, age, and 
// address properties and returns an object with only the name and age properties.

function extractProperties(originalObject, propertiesToExtract) {
    const extractedObject = {};

    // Loop for each property which we want to keep
    propertiesToExtract.forEach(property => {
        
        // check if original object has the properties to be extracted then store inside extractedObject
        if (originalObject.hasOwnProperty(property)) {
            extractedObject[property] = originalObject[property];
        }
    });

    return extractedObject;
}

const personInformation = {
    name: "Mitesh",
    age: 22,
    bloodGroup: "B+",
    address: "Kalol"
}

// Array for which properties have to be kept
const propertiesToKeep = ['name', 'age'];

const newObject = extractProperties(personInformation, propertiesToKeep);

console.log(newObject);