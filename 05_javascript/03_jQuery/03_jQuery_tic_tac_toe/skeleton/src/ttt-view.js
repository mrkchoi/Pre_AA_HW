class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {
    let that = this;
    let board = $('.board');
    board.on('click', 'li', function(e) {
      let square = $(e.currentTarget);
      that.makeMove(square);
    });
  }

  makeMove($square) {
    let pos = $square.data('pos');
    pos = pos.split(',').map(Number);
    console.log(pos);
    this.game.playMove(pos);
    this.setupBoard();
  }

  setupBoard() {
    let container = $('.ttt');
    container.html('');
    let board = $("<ul class='board'></ul>");
    let grid = this.game.board.grid;

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let square = $('<li class="square"></li>');
        $(square).attr('data-pos', [i, j]);

        if (grid[i][j] === null) {
          $(square).text(' ');
        } else if (grid[i][j] === 'x') {
          $(square).text('x');
        } else if (grid[i][j] === 'o') {
          $(square).text('o');
        }

        board.append(square);
      }
    }

    this.$el.append(board);
    this.bindEvents();
  }
}

module.exports = View;
