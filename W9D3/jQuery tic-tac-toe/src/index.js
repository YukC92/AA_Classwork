const View = require("./ttt-view")// require appropriate file
const Game = require("./game")// require appropriate file

  $(() => {
    const $el = $(".ttt")
    const game = new Game();
    new View (game, $el)
    // Your code here
  });
