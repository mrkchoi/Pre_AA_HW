
// Phase I - JS Fundamentals

// function mysteryScoping1() {
//   var x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping2() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping4() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }





// madLib
// Write a function that takes three strings - a verb, an adjective, and a noun - uppercases and interpolates them into the sentence "We shall VERB the ADJECTIVE NOUN".Use ES6 template literals.

// For example,

// > madLib('make', 'best', 'guac');
// "We shall MAKE the BEST GUAC."

// function madLib(verb, adj, noun) {
//   console.log(`We shall ${verb} the ${adj} ${noun}.`);
// }

// madLib('destroy', 'cute', 'kitten');





// isSubstring
// Input

// 1) A String, called searchString.
// 2) A String, called subString.
//   Output: A Boolean.true if the subString is a part of the searchString.

// > isSubstring("time to program", "time")
// true

//   > isSubstring("Jump for joy", "joys")
// false



// function isSubstring(str, sub) {
//   console.log(str.includes(sub));
// }

// isSubstring("time to program", "time");
// isSubstring("Jump for joy", "joys");





// Phase II


// fizzBuzz
// 3 and 5 are magic numbers.

// Define a function fizzBuzz(array) that takes an array and returns a new array of every number in the array that is divisible by either 3 or 5, but not both.



// function fizzBuzz(arr) {
//   let newArr = arr.filter(num => num % 3 === 0 || num % 5 === 0);

//   console.log(newArr);
//   return newArr;
// }

// fizzBuzz([1,2,3,4,5,6,7,8,9,10]);






// isPrime
// Define a function isPrime(number) that returns true if number is prime.Otherwise, false.Assume number is a positive integer.

// > isPrime(2)
// true

//   > isPrime(10)
// false

//   > isPrime(15485863)
// true

//   > isPrime(3548563)
// false




// function isPrime(num) {
//   if (num === 2) {
//     return true;
//   }

//   for (let i = num - 1; i > 1; i--) {
//     if (num % i === 0) {
//       return false;
//     }
//   }
//   return true;
// }

// isPrime(2);
// isPrime(10);
// isPrime(15485863);
// isPrime(3548563);



// sumOfNPrimes
// Using firstNPrimes, write a function sumOfNPrimes(n) that returns the sum of the first n prime numbers.Hint: use isPrime as a helper method.

// > sumOfNPrimes(0)
// 0

//   > sumOfNPrimes(1)
// 2

//   > sumOfNPrimes(4)
// 17


function isPrime(num) {
  if (num === 2) {
    return true;
  }

  for (let i = num - 1; i > 1; i--) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

function firstNPrimes(num) {
  let primes = [];
  let i = 2;

  while (primes.length < num) {
    if (isPrime(i)) {
      primes.push(i);
    }
    i++;
  }
  return primes;
}

function sumOfPrimes(n) {
  let primes = firstNPrimes(n);
  let sum = primes.reduce((acc, cur) => {
    return acc + cur;
  });
  console.log(sum);
  return sum;
}