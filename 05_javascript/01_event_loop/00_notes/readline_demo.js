
// const readline = require('readline');

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

// reader.question('What is your name?', function(answer) {
//   console.log(`Hello ${answer}!`);

//   reader.close();
// });

// // console.log('Last program line');



// const readline = require('readline');

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

// function addTwoNumbers(callback) {
//   reader.question('Enter #1: ', function (numString1) {
//     reader.question('Enter #2: ', function (numString2) {
//       const num1 = parseInt(numString1);
//       const num2 = parseInt(numString2);

//       callback(num1 + num2);
//     })
//   });
// }

// addTwoNumbers(function (result) {
//   console.log(`The result is: ${result}`);
//   reader.close();
// });





// function absurdTimes(numTimes, fn) {
//   let i = 0;

//   function loopStep() {
//     if (numTimes == i) {
//       return;
//     }

//     fn();

//     i++;

//     loopStep();
//   }
//   loopStep();
// }

// absurdTimes(5, function() {
//   console.log('This will be printed mutliple times!')
// })





const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function absurdTimesAsync (numTimes, fnAsync, completionFn) {
  let i = 0;

  function loopStep() {
    if (i == numTimes) {
      completionFn();
      return;
    }

    i++;

    fnAsync(loopStep);
  }

  loopStep();
}

function addTwoNumbersAsync(callback) {
  reader.question('Enter #1: ', function (numString1) {
    reader.question('Enter #2: ', function (numString2) {
      const num1 = parseInt(numString1);
      const num2 = parseInt(numString2);

      callback(num1 + num2);
    })
  })
}

let totalSum = 0;

function addTwoNumbersAndIncrementAsync (callback) {
  addTwoNumbersAsync(function (result) {
    totalSum += result;

    console.log(`Sum: ${result}`);
    console.log(`Total Sum: ${totalSum}`);

    callback();
  })
}

function outputResultAndCloseReader() {
  console.log(`All done! Total Sum: ${totalSum}`);
}

absurdTimesAsync(3, addTwoNumbersAndIncrementAsync, outputResultAndCloseReader);