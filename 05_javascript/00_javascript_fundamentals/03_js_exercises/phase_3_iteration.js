

// Phase 3: Iteration



// [5,4,3,2,1]
Array.prototype.bubbleSort = function () {
  let sorted = false;

  while (sorted === false) {
    sorted = true;

    for (let i = 0; i < this.length - 1; i++) {
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
String.prototype.substrings = function () {
  let sub = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      sub.push(this.slice(i, 1 + j));
    }
  }
  let filtered = sub.filter(el => {
    return el != '';
  });

  return [...new Set(filtered)];
}

// console.log('hello'.substrings())




