// Array.prototype.uniq = function() {
//   let uniqueArr = [];
  
//   this.forEach(el => {
//     if (!uniqueArr.includes(el)) {
//       uniqueArr.push(el);
//     }
//   });

//   console.log(uniqueArr);
// }


// Array.prototype.twoSum = function() {
//   let pairs = [];

//   for(let i = 0; i < this.length - 1; i++) {
//     for(let j = 1; j < this.length; j++) {
//       if (this[i] + this[j] === 0) {
//         pairs.push([i, j]);
//       }
//     }
//   }
//   console.log(pairs);
// }

// // let arr = [-1, -2, -3, -4, -5, -6, 0, 1, 2, 3, 4, 5, 6, 7]












// Array.prototype.transpose = function() {
//   let transposedArr = [...Array(this.length)].map(el => Array(this.length));

//   for(let i = 0; i < this.length; i++) {
//     for(let j = 0; j < this.length; j++) {
//       transposedArr[i][j] = this[j][i];
//     }
//   }
//   return transposedArr;
// }


// // let arr = [[1,2,3], [4,5,6], [7,8,9]]
// // arr.transpose();
 

// // let t = [...Array(6)].map(el => Array(6));



// // Phase II: Enumerable



// Array.prototype.myEach = function(func) {
//   for(let i = 0; i < this.length; i++) {
//     func(this[i]);
//   }
// }


// // [1,2,3].forEach((el) => {
// //   console.log(el);
// // });


// Array.prototype.myMap = function(func) {
//   let res = [];
//   this.myEach(el => {
//     res.push(func(el));
//   });
//   return res;
// }


// Array.prototype.myReduce = function(func) {
//   let acc = this[0];

//   this.slice(1).myEach(el => {
//     acc = func(acc, el);
//   });

//   return acc;
// } 

// const adder = (acc, el) => {
//   return acc + el;
// }

// const times = (acc, el) => {
//   return acc * el;
// }

// // [1,2,3,4].myReduce(adder);
// // [1, 2, 3, 4].myReduce(times);















// Phase 3: Iteration



// [5,4,3,2,1]
Array.prototype.bubbleSort = function() {
  let sorted = false;

  while (sorted === false) {
    sorted = true;

    for(let i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        sorted = false;
        let temp = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
        break;
      }
    }
  }

  return this;
}

// let arr = [5,4,3,2,1].bubbleSort();
// console.log(arr); 







// 'string'
String.prototype.substrings = function() {
  let sub = [];

  for(let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      sub.push(this.slice(i, 1 + j));
    }
  }
  let filtered = sub.filter(el => {
    return el != '';
  });

  return [...new Set(filtered)];
}

console.log('hello'.substrings())

