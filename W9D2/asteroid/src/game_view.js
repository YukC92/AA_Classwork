const Game = require("./game");

function GameView(game, ctx) {
    this.ctx = ctx;
    this.game = game;
}

GameView.prototype.start = function () {
    let that = this;
    setInterval( function () {
        that.game.draw(that.ctx);
        that.game.moveObjects();
    }, 20) 
}

module.exports = GameView;