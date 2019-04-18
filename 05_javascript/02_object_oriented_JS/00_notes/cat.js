let Cat = function(name) {
  this.name = name;
}

Cat.prototype.meow = function() {
  console.log(`Meow! My name is ${this.name}`);
};

module.exports = Cat;
