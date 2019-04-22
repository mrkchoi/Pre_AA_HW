const View = require('./ttt-view');// require appropriate file
const Game = require('../../node_solution/game'); // require appropriate file

  $(() => {
    // Your code here
    let game = new Game();
    let board = $('.ttt');

    let view = new View(game, board);
  });
