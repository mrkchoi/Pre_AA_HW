
// range(start, end) - receives a start and end value, returns an array from start up to end

// (1,4) => [1,2,3,4]
function range(start, end) {
  if (end < start) {
    return [];
  }

  if (start === end) {
    return [end];
  }

  return [start].concat(range((start + 1), end));

}
// console.log(range(1,100)); 










// sumRec(arr) - receives an array of numbers and recursively sums them

// [1,2,3] => 6

function sumRec(arr) {
  if (arr.length === 0) {
    return 0;
  }

  if (arr.length === 1) {
    return arr[0];
  }

  return arr[0] + sumRec(arr.slice(1));
}


// console.log(sumRec([1, 2, 3,4,5,6,7,8,9,10]));









// exponent(base, exp) - receives a base and exponent, returns the base raise to the power of the exponent(base ^ exp)

// write two versions:
// # this is math, not Ruby methods.

// # version 1
// exp(b, 0) = 1
// exp(b, n) = b * exp(b, n - 1)

// # recursion 2
// exp(b, 0) = 1
// exp(b, 1) = b
// exp(b, n) = exp(b, n / 2) ** 2[for even n]
// exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2)[for odd n]


// Version 1
// (2, 2) => 4
function exp1(b, n) {
  if (n === 0) {
    return 1;
  }

  if (n === 1) {
    return b;
  }

  return b * exp1(b, n - 1);
}


// Version 2
// (2, 4) => 8
function exp2(b, n) {
  if (n === 0) {
    return 1;
  }

  if (n === 1) {
    return b;
  }

  if (n % 2 === 0) {
    return Math.pow(exp2(b, n / 2), 2);
  } else {
    return b * Math.pow(exp2(b, ((n - 1) / 2)), 2);
  }
}

// console.log(exp2(2, 3));

// Math.pow(exp2(2, 4/2), 2)
// Math.pow(exp2(2, 2), 2)
// Math.pow((Math.pow(exp2(2, 1), 2)), 2)
// Math.pow((Math.pow(2, 2)), 2)
// Math.pow(4, 2)
// Math.pow(4, 2)
// 16


// fibonacci(n) - receives an integer, n, and returns the first n Fibonacci numbers


// fib(3) => [1,1,2]
// fib(4) => [1,1,2,3]
function fib(n) {
  if (n === 0) {
    return [];
  }

  if (n === 1) {
    return [1];
  }

  if (n === 2) {
    return [1, 1];
  }

  return fib(n - 1).concat((fib(n - 1).slice(-2)[0]) + (fib(n - 1).slice(-1)[0]));
}

// console.log(fib(10));










// deepDup(arr) - deep dup of an Array!
// arr = [1,2]
// arr = [1,[2,[3,4,[5,6],7],8],9]

function deepDup(arr) {
  if (arr.length === 0) {
    return [];
  }

  if (arr.length === 1) {
    return [arr[0]];
  }

  return [arr[0]].concat(deepDup(arr.slice(1)));
}

// console.log(deepDup([1, 2, 3, [4, [5,6]]]));




















// bsearch(arr, target) - receives a sorted array, returns the index of the target or - 1 if not found

// arr = [1,2], 2
// arr = [1,2], 3
function bsearch(arr, target) {
  let mid = Math.floor(arr.length / 2);

  if (arr[mid] === target) {
    return mid;
  } else if (arr.length === 1 && arr !== target) {
    return NaN;
  }

  if (target <= arr[mid]) {
    return bsearch(arr.slice(0, mid), target);
  } else {
    return bsearch(arr.slice(mid), target) + mid;
  }

}

// console.log(bsearch([1,2,3,4,500], 500));




















// mergesort(arr) - receives an array, returns a sorted copy of the array by implementing merge sort sorting algorithm



function ms(arr) {
  // Split arr until length == 1
  if (arr.length < 1) {
    return [];
  }

  if (arr.length === 1) {
    return arr;
  }

  let mid = Math.floor(arr.length / 2);
  let left = arr.slice(0, mid);
  let right = arr.slice(mid);  

  // Merge elements back together in correct order
  return merge(ms(left), ms(right));
}

// [2], [1]
function merge(left, right) {
//  let a1 = left[0];
//  let a2 = right[0];
  let merged = [];

  while (left.length > 0 && right.length > 0) {
    if (left[0] < right[0]) {
      merged.push(left.shift(1));
    } else {
      merged.push(right.shift(1));
    }
  }
  return merged.concat(left).concat(right);
}
  

// [5,4,3,2,1]


// console.log(ms([5,4,3,2,1]));














// subsets(arr) - receives an array, returns an array containing all the subsets of the original array

// abc
// '', a, b, c, ab, ac, bc, abc


// arr = [1,2,3]
// function subsets(arr) {
//   if (arr.length === 0) {
//     return [[]];
//   }

//   const first = [arr.pop()];
//   const prevSubs = subsets(arr);
//   let res = prevSubs.slice(0);

//   for (let i = 0; i < prevSubs.length; i++) {
//     res.push(prevSubs[i].concat(first));
//   }

//   return res;
// }









// function subsets(arr) {
//   if (arr.length === 0) {
//     return [[]];
//   }

//   const first = [arr.pop()];
//   const prevSubs = subsets(arr);
//   let res = prevSubs.slice(0);

//   for(let i = 0; i < prevSubs.length; i++) {
//     res.push(prevSubs[i].concat(first));
//   }

//   return res;
// }


// console.log(subsets([1,2,3]));








