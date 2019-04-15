


class Board {
  constructor() {
    this.board = [['_', '_', '_'], ['_','_','_'],['_','_','_']];
  }

  printBoard() {
    console.log('');
    this.board.forEach(row => {
      console.log(row);
      console.log('');
    });
    return '';
  }

  won() {

  }

  winner() {

  }

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

  // pos => 12 || 23 || 13
  empty(pos) {
    let col = parseInt(pos[0]) - 1;
    let row = parseInt(pos[1]) - 1;

    if (this.board[col][row] === '_') {
      return true;
    } else {
      return false;
    }
  }

  place_mark(pos, mark) {

  }

}

let b = new Board();
console.log(b.printBoard());
console.log(b.validMove('22'));