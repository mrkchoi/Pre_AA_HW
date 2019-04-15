let readline = require('readline');
let reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor(numTowers) {
    this.numTowers = numTowers;
    this.towers = this.createTowers(numTowers);
  }

  ///////////////////////////////////
  // RUN GAME
  ///////////////////////////////////
  run(reader, gameCompletionCallback) {
    this.promptMove(reader, (start, end) => {
      if (!this.move(start, end)) {
        console.log("Invalid move!");
      }

      if (!this.isWon()) {
        this.run(reader, gameCompletionCallback);
      } else {
        this.printStacks();
        console.log('You win!!!');
        gameCompletionCallback();
      }
    });
  }

  ///////////////////////////////////
  // PRINT STACKS
  ///////////////////////////////////
  printStacks() {
    console.log("\n");
    console.log(this.towers);
  }

  ///////////////////////////////////
  // PROMPT PLAYER
  ///////////////////////////////////
  promptMove(reader, callback) {
    this.printStacks();
    reader.question("Enter starting pos: ", (res1) => {
      reader.question("Enter ending pos: ", (res2) => {
        callback(parseInt(res1), parseInt(res2));
      });
    });
  }

  ///////////////////////////////////
  // CREATE TOWERS
  ///////////////////////////////////
  createTowers(numTowers) {
    let towers = [[], [], []];

    for (let i = 1; i <= numTowers; i++) {
      towers[0].unshift(i);
    }
    return towers;
  }

  ///////////////////////////////////
  // MOVE VALIDATION
  ///////////////////////////////////
  isValidMove(start, end) {
    let startInt = parseInt(start);
    let endInt = parseInt(end);

    if (![1, 2, 3].includes(startInt) || ![1, 2, 3].includes(endInt)) {
      console.log(`Invalid positions!`);
      this.promptMove();
      return;
    }

    let startStack = this.towers[start - 1];
    let endStack = this.towers[end - 1];
    let startDisk = startStack.slice(-1)[0];
    let currentEndDisk = endStack.slice(-1)[0];

    if (currentEndDisk === undefined || startDisk < currentEndDisk) {
      return true;
    } else {
      console.log(`Invalid move! Try again!`);
      return false;
    }
  }


  ///////////////////////////////////
  // MAKE MOVE
  ///////////////////////////////////
  move(start, end) {
    let startStack = this.towers[start - 1];
    let endStack = this.towers[end - 1];

    if (this.isValidMove(start, end)) {
      endStack.push(startStack.pop());
      return true;
    } else {
      return false;
    }
  }

  ///////////////////////////////////
  // CHECK WIN
  ///////////////////////////////////
  isWon() {
    let final = [];
    let towerCount = this.numTowers;
    let i = 1;

    while (i <= towerCount) {
      final.unshift(i);
      i += 1;
    }

    if (this.towers[1].length === this.numTowers || this.towers[2].length === this.numTowers) {
      return true;
    } else {
      return false;
    }
  }
}

function completionCallback() {
  reader.question("Play again? (y/n)\n", (res) => {
    if (res === 'y') {
      g = new Game(3);
      g.run(reader, completionCallback);
    } else if (res === 'n') {
      console.log('Thanks for playing!');
      reader.close();
    } else {
      completionCallback();
    }
  });
}


let g = new Game(3);
g.run(reader, completionCallback);