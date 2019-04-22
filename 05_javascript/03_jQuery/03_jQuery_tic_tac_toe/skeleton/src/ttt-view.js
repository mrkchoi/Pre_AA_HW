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
    $(window).on('error', function(e) {
      alert("Invalid move!");
    });
    this.winner();
  }

  winner() {
    let container = $('.ttt');
    let winner = this.game.board.winner();
    if (winner) {
      let winMsg = $(`<p class="win_msg">You win, ${winner}!</p>`);
      if (winner === 'x') {
        container.addClass('game_winner_X');
      } else {
        container.addClass('game_winner_O');
      }
      container.append(winMsg);
      container.addClass('game_won');
    } else if (this.game.board.isOver() && !winner) {
      let drawMsg = $(`<p class="win_msg">Draw game!</p>`);
      container.addClass('draw_game');
      container.append(drawMsg);
    }
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
          $(square).addClass('x_mark');
        } else if (grid[i][j] === 'o') {
          $(square).text('o');
          $(square).addClass('o_mark');
        }

        board.append(square);
      }
    }

    this.$el.append(board);
    this.bindEvents();
  }
}

module.exports = View;
