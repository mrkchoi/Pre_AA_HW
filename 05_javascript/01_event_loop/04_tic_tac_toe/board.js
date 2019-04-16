


class Board {
  constructor() {
    this.board = [['_', '_', '_'], ['_','_','_'],['_','_','_']];
  }

  // DISPLAY BOARD
  printBoard() {
    console.log('');
    this.board.forEach(row => {
      console.log(row);
      console.log('');
    });
    return '';
  }

  // CHECK FOR WINNER
  won() {
    let winningCombos = [
      [[0,0],[0,1],[0,2]],
      [[1,0],[1,1],[1,2]],
      [[2,0],[2,1],[2,2]],
      [[0,0],[1,0],[2,0]],
      [[0,1],[1,1],[2,1]],
      [[0,2],[1,2],[2,2]],
      [[0,0],[1,1],[2,2]],
      [[0,2],[1,1],[2,0]]
    ];

    // winningCombos.some(combo => {
    //   let first = this.board[combo[0][0]][combo[0][1]];
    //   let second = this.board[combo[1][0]][combo[1][1]];
    //   let third = this.board[combo[2][0]][combo[2][1]];

    //   (first === second && second === third) && (first != '_');
    // });

    for (let combo of winningCombos) {
      let first = this.board[combo[0][0]][combo[0][1]];
      let second = this.board[combo[1][0]][combo[1][1]];
      let third = this.board[combo[2][0]][combo[2][1]];

      if ((first === second && second === third) && (first != '_')) {
        return true;
      }
    }

    return '';
  }

  winner(player) {
    console.log(`${player} wins!`);
  }

  // MOVE VALIDATION
  validMove(pos) {
    let col = parseInt(pos[0]) - 1;
    let row = parseInt(pos[1]) - 1;
    let colRange = col >= 0 && col <= 2;
    let rowRange = row >= 0 && row <= 2;

    if (colRange && rowRange && this.empty(pos)) {
      return true;
    } else {
      return false;
    }
  }

  empty(pos) {
    let col = parseInt(pos[0]) - 1;
    let row = parseInt(pos[1]) - 1;

    if (this.board[col][row] === '_') {
      return true;
    } else {
      return false;
    }
  }

  // MAKE MOVE
  placeMark(pos, mark) {
    if (this.validMove(pos)) {
      let col = parseInt(pos[0]) - 1;
      let row = parseInt(pos[1]) - 1;

      this.board[col][row] = mark;
      return true;
    } else {
      // console.log('Invalid move!');
      return false;
    }
  }

};

module.exports = Board;

let b = new Board();
console.log(b.won());

// console.log(b.printBoard());
// console.log(b.placeMark('11', 'X'));
// console.log(b.printBoard());
// console.log(b.placeMark('22', 'X'));
// console.log(b.printBoard());
// console.log(b.placeMark('33', 'X'));
// console.log(b.printBoard());
// console.log(b.placeMark('13', 'O'));
// console.log(b.printBoard());
// console.log(b.placeMark('23', 'O'));
// console.log(b.printBoard());
// console.log(b.placeMark('12', 'X'));
// console.log(b.printBoard());
// // console.log(b.placeMark('21', 'X'));
// // console.log(b.printBoard());
// // console.log(b.placeMark('31', 'X'));
// console.log(b.printBoard());
// console.log(b.placeMark('32', 'O'));
// console.log(b.printBoard());
// b.won();

