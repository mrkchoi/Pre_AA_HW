

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


Function.prototype.myBind1 = function(context) {
  let bindArgs = Array.prototype.slice.call(arguments, 1);
  
  let that = this;
  return function() {
    let callArgs = Array.prototype.slice.call(arguments);
    that.apply(context, bindArgs.concat(callArgs));
  };
};

Function.prototype.myBind2 = function (...args) {
  let context = args[0];
  let bindArgs = args.slice(1);

  let that = this;
  return function (...callArgs) {
    that.apply(context, bindArgs.concat(callArgs));
  };
};

// markov.says.myBind(pavlov, 'meow', 'Kush')(); // => 'Pavlov says meow to Kush'
// markov.says.myBind1(pavlov)("meow", "a tree");
// markov.says.myBind2(pavlov)("meow", "a tree");






function curriedSum(numArgs) {
  let numbers = [];

  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      return numbers.reduce((acc, cur) => acc + cur);
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

// console.log(curriedSum(4)(5)(30)(20)(1)) ;
// // console.log(sum(5)(30)(20)(1)); // => 56


function sum() {
  let total = 0;

  for (let i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }

  return total;
}

Function.prototype.curry1 = function(numArgs) {
  let that = this;
  let args = [];

  function _curry(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return that.apply(null, args);
    } else {
      return _curry;
    }
  }
  return _curry;
};


Function.prototype.curry2 = function (numArgs) {
  let that = this;
  let args = [];

  function _curry(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return that.call(null, ...args);
    } else {
      return _curry;
    }
  }
  return _curry;
};

console.log(sum.curry2(4)(1)(2)(3)(4));