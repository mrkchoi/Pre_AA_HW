Array.prototype.uniq = function() {
  let uniqueArr = [];
  
  this.forEach(el => {
    if (!uniqueArr.includes(el)) {
      uniqueArr.push(el);
    }
  });

  console.log(uniqueArr);
}


Array.prototype.twoSum = function() {
  let pairs = [];

  for(let i = 0; i < this.length - 1; i++) {
    for(let j = 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        pairs.push([i, j]);
      }
    }
  }
  console.log(pairs);
}

// let arr = [-1, -2, -3, -4, -5, -6, 0, 1, 2, 3, 4, 5, 6, 7]












Array.prototype.transpose = function() {
  let transposedArr = [...Array(this.length)].map(el => Array(this.length));

  for(let i = 0; i < this.length; i++) {
    for(let j = 0; j < this.length; j++) {
      transposedArr[i][j] = this[j][i];
    }
  }
  return transposedArr;
}


let arr = [[1,2,3], [4,5,6], [7,8,9]]
arr.transpose();
 

// let t = [...Array(6)].map(el => Array(6));