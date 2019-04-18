let Dog = function(name) {
  this.name = name;
}

Dog.prototype.woof = function() {
  console.log(`Woof! My name is ${this.name}`);
};

module.exports = Dog;
