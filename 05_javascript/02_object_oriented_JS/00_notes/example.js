// let Animal = function(name) {
//   this.name = name;
// };

// Animal.prototype.sayHello = function () {
//   console.log(`Hello, my name is ${this.name}`);
// };

// let Dog = function(name, coatColor) {
//   Animal.call(this, name);
//   this.coatColor = coatColor;
// };

// Dog.prototype = Object.create(Animal.prototype);

// Dog.prototype.constructor = Dog;

// Dog.prototype.bark = function() {
//   console.log('Bark!');
// }

// let lisa = new Dog('Lisa');

// console.log(lisa.name); 
// lisa.sayHello();
// lisa.bark();





// let Animal = function(name) {
//   this.name = name;
// }

// Animal.prototype.sayHello = function() {
//   console.log(`Hi name name is bark, ${this.name}`);
// }

// let Dog = function(name, coatColor) {
//   Animal.call(this, name);

//   this.coatColor = coatColor;
// }

// let Surrogate = function() {}
// Surrogate.prototype = Animal.prototype;
// Dog.prototype = new Surrogate();

// Dog.prototype.constructor = Dog;

// let k = new Dog('Kenny');
// k.sayHello();






class Bicycle {
  constructor(color, model) {
    this.color = color;
    this.model = model;
  }

  action() {
    return 'rolls along'
  }
}

class RaceBicycle extends Bicycle {
  constructor(color, model, gears) {
    super(color, model);
    this.gears = gears;
  }

  action() {
    let oldAction = super.action();
    console.log(`${oldAction} at a blistering pace!`);
  }
}

let r = new RaceBicycle('black', 's2000', 27);
r.action();