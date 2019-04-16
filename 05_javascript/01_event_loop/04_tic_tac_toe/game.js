let readline = require('readline');
let reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let Player = require('./player');
let Board = require('./board');

class Game {
  constructor(reader) {
    this.reader = reader;
    this.board = new Board();
    this.currentPlayer = new Player('X');
    this.nextPlayer = new Player('O');
  }

  run(reader, completionCallback) {
    this.promptMove(reader, res => {
      if (!this.board.placeMark(res, this.currentPlayer.mark)) {
        console.log('Invalid move!');
        this.run(reader, completionCallback);
        return;
      }

      console.log(`board won: ${this.board.won()}`);
      if (!this.board.won()) {
        this.switchPlayers();
        this.run(reader, completionCallback);
      } else {
        completionCallback();
        this.board.printBoard();
        console.log(`\n${this.currentPlayer.mark} wins!\n`);
        
      }
    });
  }

  switchPlayers() {
    let temp = this.currentPlayer;
    this.currentPlayer = this.nextPlayer;
    this.nextPlayer = temp;
  }

  promptMove(reader, callback) {
    this.board.printBoard();

    reader.question(`${this.currentPlayer.mark}'s move: `, res => {
      console.log(res);
      callback(res);
    });
  }

  loadPlayers() {
    let p1 = new Player('X');
    let p2 = new Player('O');
    return [p1, p2];
  }
}

function gameComplete() {
  reader.question('Play again? (y/n): ', res => {
    if (res === 'y') {
      let g = new Game(reader);
      g.run(reader, gameComplete());
    } else if (res === 'n') {
      gameComplete();
    } else {
      console.log(`Thanks for playing!\n`);
    }
  });
}


let g = new Game(reader);
g.run(reader, gameComplete);










// console.log(g.players); 
// b.printBoard();
// b.placeMark('11', 'X');
// b.placeMark('22', 'X');
// b.placeMark('33', 'X');
// b.printBoard();