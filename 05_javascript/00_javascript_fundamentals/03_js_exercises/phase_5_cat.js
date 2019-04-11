
function Cat(name, owner) {
  this.name = name;
  this.owner = owner;

  this.meow = function() {
    console.log('Cats love to meow');
  }

}

Cat.prototype.cuteStatement = function () {
  console.log(`Everyone loves ${this.name}!`);
}


let c1 = new Cat('Fluffers', 'Mike');
c1.meow = function() {
  console.log(`${this.name} is meowing!!!`);
}

let c2 = new Cat('Whiskers', 'Jen');
let c3 = new Cat('Garfield', 'Steven');

