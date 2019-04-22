class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {
    let board = $("<ul class='board'></ul>");
    let square = '<li class="square"></li>';
    let squares = '';

    for (let i = 0; i < 9; i++) {
      squares += square;
    }

    squares = $(squares);
    board.append(squares);
    this.$el.append(board);
  }
}

module.exports = View;
