// Create an array of objects to store information about multiple people or products. Write 
// code to loop through the array and display the information for each object.


const peopleArray = [
    {name:"Mitesh", age: 22, occupation: "Full Stack Developer"},
    {name: "Bhavisha", age: 20, occupation: "Computer Engineer"},
    {name: "Asha", age: 45, occupation: "Business Woman"},
    {name: "Veljibhai", age: 47, occupation: "Business Man"}
];

for (let i = 0; i < peopleArray.length; i++) {
    const person = peopleArray[i];
    console.log(`Person ${i+1}`);
    console.log(`Name: ${person.name}`);
    console.log(`Age: ${person.age}`);
    console.log(`Occupation: ${person.occupation}\n`);
}