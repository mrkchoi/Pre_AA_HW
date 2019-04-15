


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

  }

  winner() {

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
      return false;
    } else {
      console.log('Invalid move!');
      return false;
    }
  }

}

let b = new Board();
console.log(b.printBoard());
console.log(b.placeMark('22', 'X'));
console.log(b.printBoard());
console.log(b.placeMark('11', 'O'));
console.log(b.printBoard());
console.log(b.placeMark('31', 'X'));
console.log(b.printBoard());