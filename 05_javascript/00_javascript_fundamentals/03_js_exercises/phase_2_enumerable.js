
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






