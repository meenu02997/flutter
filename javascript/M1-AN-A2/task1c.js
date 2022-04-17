console.log("--------task 1c");
const animals = ['Hen', 'elephant', 'llama', 'leopard', 'ostrich', 'Whale', 'octopus', 'rabbit', 'lion', 'dog']
const Msg = animals.reduce((accumulator, animal) => accumulator +' '+ animal[0], '')
console.log(Msg.trim().split(" "));
let secretMessage = animals.map(function(animal) {
     return animal[0]
});
