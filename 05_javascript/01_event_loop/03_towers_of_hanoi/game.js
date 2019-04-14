let readline = require('readline');
let reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


class Game {
  constructor(numTowers) {
    // CREATE NEW GAME BOARD
    this.towers = this.createTowers(numTowers);
  }

  ///////////////////////////////////
  // RUN GAME
  ///////////////////////////////////
  run() {
    // until all pieces are moved in correct order to finishing tower
      // render game board
      // prompt player for move
      // check to see if move is valid?
      // make move on board
  }

  ///////////////////////////////////
  // CREATE TOWERS
  ///////////////////////////////////
  createTowers(numTowers) {
    let towers = [[], [], []]

    for (let i = 1; i <= numTowers; i++) {
      towers[0].unshift(i);
    }

    towers[1].push(4)
    return towers;
  }

  ///////////////////////////////////
  // PROMPT PLAYER
  ///////////////////////////////////
  promptMove() {
    // print stacks
    this.printStacks();
    
    // prompt user for start & end move to a callback
    reader.question("Enter starting pos:", (res1) => {
      reader.question("\nEnter ending pos:\n\n", (res2) => {
        this.isValidMove(res1, res2);
      });
    });

    return '';
  }


  ///////////////////////////////////
  // MOVE VALIDATION
  ///////////////////////////////////
  isValidMove(start, end) {
    let startInt = parseInt(start);
    let endInt = parseInt(end);

    // check pos in range
    if (![1, 2, 3].includes(startInt) || ![1, 2, 3].includes(endInt)) {
      console.log(`\nInvalid positions!\n`);
      this.promptMove();
      return;
    }

    // check that start last element can be moved to end last element
    let startStack = this.towers[start - 1];
    let endStack = this.towers[end - 1];
    let startDisk = startStack.slice(-1)[0];
    let currentEndDisk = endStack.slice(-1)[0];

    if (currentEndDisk === undefined || startDisk < currentEndDisk) {
      this.move(start, end);
      return;
    } else {
      console.log(`Invalid move! Try again!\n\n`);
      this.promptMove();
      return;
    }
  }


  ///////////////////////////////////
  // MAKE MOVE
  ///////////////////////////////////
  move(start, end) {
    let startStack = this.towers[start - 1];
    let endStack = this.towers[end - 1];

    let startDisk = startStack.slice(-1)[0];
    let currentEndDisk = endStack.slice(-1)[0];
  }


  ///////////////////////////////////
  // RUN GAME
  ///////////////////////////////////
  printStacks() {
    console.log(this.towers);
  }

}

let g = new Game(3);
console.log(g.promptMove() + "\n");
// console.log(g.createTowers(3));