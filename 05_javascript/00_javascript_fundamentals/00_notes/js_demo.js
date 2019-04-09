"use strict";

function soundMaker(sound, times) {
  function makeSound() {
    console.log(`${sound}`);
  }

  

  for(let i = 0; i < times; i ++) {
    makeSound();
  }
}
soundMaker('woof', 5);


// function summation(arr) {
//   let sum = 1;

//   function summer() {
//     for(let i = 0; i < arr.length; i++) {
//       sum *= arr[i];
//     }
//   }

//   summer();
//   return sum;
// }

// console.log(summation([1, 2, 3, 4]));


// let callback = function() {
//   console.log("It has been 5 seconds!");
// }
// global.setTimeout(callback, 3000);



global.setTimeout(() => {
  console.log("It has been 2 seconds");
}, 2000);
