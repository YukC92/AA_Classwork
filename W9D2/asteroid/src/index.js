const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game");
const GameView = require("./game_view");


document.addEventListener("DOMContentLoaded", function () {
    const canvasEl = document.getElementById("game-canvas");
    
    const ctx = canvasEl.getContext("2d");
    const moveObject = new MovingObject(
        {pos: [30, 30],
        vel: [10, 10],
        radius: 5,
        color: "blue"} 
    );
        
    const game = new Game();
    new GameView(game, ctx).start();
    
    // moveObject.draw(ctx);
    
    window.MovingObject = MovingObject;
    window.ctx = ctx;
    window.moveObject = moveObject;
    window.Asteroid = Asteroid;
    window.GameView = GameView;
});
