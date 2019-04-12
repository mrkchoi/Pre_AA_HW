class Clock {
  constructor() {
    this.date =  new Date();
    this.hours = this.date.getHours();
    this.minutes = this.date.getMinutes();
    this.seconds = this.date.getSeconds();
    this.printTime();
    this._tick();
  }

  printTime() {
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    setInterval(() => {
      this.seconds += 1;
      this.printTime();
    }, 1000);
  }
}

// let c = new Clock();







// Add Numbers

let readline = require('readline');

let reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsLeft, completionCallback) {
  let totalSum = 0;

  if (numsLeft > 0) {
    reader.question('Enter a number: \n', (res) => {
      let number = parseInt(res);
      console.log(`You entered: ${number}\n`);
      
      sum += number;
      numsLeft -= 1;
      console.log(`Current sum: ${sum}\n`);

      addNumbers(sum, numsLeft, completionCallback);
    }); 
  } else if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
  }
}


addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));