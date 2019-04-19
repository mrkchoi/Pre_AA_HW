
// Function.prototype.inherits = function (superClass) {
//   function Surrogate() { }

//   Surrogate.prototype = superClass.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// };

// function MovingObject(name) {
//   this.name = name;
// }

// MovingObject.prototype.sayObjectName = function() {
//   console.log(`My object name is ${this.name}`);
// };

// function Ship(name, model) {
//   MovingObject.call(this, name);
//   this.model = model;
// }
// Ship.inherits(MovingObject);

// Ship.prototype.flyShip = function() {
//   console.log(`Ship is flying!`);
// };


// function Asteroid(name, color) {
//   MovingObject.call(this, name);
//   this.color = color;
// }
// Asteroid.inherits(MovingObject);

// Asteroid.prototype.flyAsteroid = function() {
//   console.log(`I am a big bad asteroid!`);
// };


// //////////////////////////////////////////
// // function Surrogate() {}

// // Surrogate.prototype = MovingObject.prototype;
// // Ship.prototype = new Surrogate();
// // Ship.prototype.constructor = Ship;

// // Surrogate.prototype = MovingObject.prototype;
// // Asteroid.prototype = new Surrogate();
// // Asteroid.prototype.constructor = Asteroid;
// //////////////////////////////////////////


// window.ship = new Ship('L33t5h1P', 'LC674S');
// window.asteroid = new Asteroid('uhOh', 'space gray');

// console.log(ship.sayObjectName());
// console.log(ship.flyShip());
// console.log(asteroid.sayObjectName());

// console.log(ship.prototype);






// IMPLEMENTATION #2: Prototypal Inheritance via Object.create
function MovingObject(name) {
  this.name = name;
}

MovingObject.prototype.sayHi = function() {
  console.log(`hey my name is ${this.name}`);
};

function Ship(name, model) {
  MovingObject.call(this, name);
  this.model = model;
}

Ship.prototype = Object.create(MovingObject.prototype);
Ship.prototype.constructor = Ship;

Ship.prototype.warp = function() {
  console.log(`Warpspeed!!!`);
};

function Asteroid(name, color) {
  MovingObject.call(this, name);
  this.color = color;
}

Asteroid.prototype = Object.create(MovingObject.prototype);
Asteroid.prototype.constructor = Asteroid;

Asteroid.prototype.hit = function() {
  console.log(`You're mine!!`);
};

let s = new Ship('Shippy', 'bu8746xy');
let a = new Asteroid('Astee', 'space gray');

