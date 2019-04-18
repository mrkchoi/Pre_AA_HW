

// function sum() {
//   let sum = 0;
  
//   for (let i = 0; i < arguments.length; i++) {
//     sum += arguments[i];
//   }
//   return sum;
// }

// console.log(sum(1, 2, 3, 4));


// function sum() {
//   let sum = 0;
//   let args = [...arguments];

//   args.forEach(el => sum += el);
//   return sum;
// }

// console.log(sum(1, 2, 3, 4, 5));




class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat('Markov');
const pavlov = new Cat('Pavlov');
// markov.says('meow', 'Ned');


Function.prototype.myBind = function(context) {
  let bindArgs = Array.prototype.slice.call(arguments, 1);
  
  let that = this;
  return function() {
    let callArgs = Array.prototype.slice.call(arguments);
    that.apply(context, bindArgs.concat(callArgs));
  };
};

// markov.says.myBind(pavlov, 'meow', 'Kush')(); // => 'Pavlov says meow to Kush'
markov.says.myBind(pavlov)("meow", "a tree");


