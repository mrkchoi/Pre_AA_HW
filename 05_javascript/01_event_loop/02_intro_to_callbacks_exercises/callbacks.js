// class Clock {
//   constructor() {
//     this.date =  new Date();
//     this.hours = this.date.getHours();
//     this.minutes = this.date.getMinutes();
//     this.seconds = this.date.getSeconds();
//     this.printTime();
//     this._tick();
//   }

//   printTime() {
//     console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
//   }

//   _tick() {
//     setInterval(() => {
//       this.seconds += 1;
//       this.printTime();
//     }, 1000);
//   }
// }

// // let c = new Clock();







// // Add Numbers

// let readline = require('readline');

// let reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });


// function addNumbers(sum, numsLeft, completionCallback) {
//   let totalSum = 0;

//   if (numsLeft > 0) {
//     reader.question('Enter a number: \n', (res) => {
//       let number = parseInt(res);
//       console.log(`You entered: ${number}\n`);
      
//       sum += number;
//       numsLeft -= 1;
//       console.log(`Current sum: ${sum}\n`);

//       addNumbers(sum, numsLeft, completionCallback);
//     }); 
//   } else if (numsLeft === 0) {
//     completionCallback(sum);
//     reader.close();
//   }
// }


// // addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));










// absurdBubbleSort
let readlines = require('readline');

let reader = readlines.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} > ${el2}? (yes/no)\n `, res => {
    if (res === 'yes') {
      callback(true);
    } else {
      callback(false);
    }
  });
}
// askIfGreaterThan(5, 3, (res) => {
//   if (res === true) {
//     console.log('true');
//   } else {
//     console.log('false');
//   }
// });


function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i === arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps);
    // console.log('Triggered outerBubbleSortLoop!');
    // console.log(madeAnySwaps);
  } else {
    askIfGreaterThan(arr[i], arr[i + 1], (res) => {
      if (res === true) {
        let temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        madeAnySwaps = true;
        console.log(arr);
      }
      i += 1;
      innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop);
    });
  }
}

// innerBubbleSortLoop([3,2,1], 0, true, outerBubbleSortLoop);



function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps === true) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }

  outerBubbleSortLoop(true);
}


absurdBubbleSort([5,4,3,2,1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
})