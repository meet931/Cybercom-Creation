// Write a function that takes two objects as arguments and returns a new object that 
// combines the properties of both objects. For example, a function that takes two objects 
// with name and age properties and returns an object with name, age, and address 
// properties

function combineObject (obj1, obj2) {
    const combinedObject = {};

    // For Obj1
    for (let prop in obj1) {
        if (obj1.hasOwnProperty(prop)) {
            combinedObject[prop] = obj1[prop];
        }
    }

    // For Obj2
    for (let prop in obj2) {
        if (obj2.hasOwnProperty(prop)) {
            combinedObject[prop] = obj2[prop];
        }
    }

    return combinedObject;
}

const person1 = {
    name: "Mitesh",
    age: 22
};

const person2 = {
    address: "Kalol"
};

const newObject = combineObject(person1, person2);

console.log(newObject);