const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid");

const DEFAULT = {
    DIM_X: 500,
    DIM_Y: 300,
    NUM_ASTEROIDS: 10,
    BKG_COLOR: "green"
}

function Game() {
    this.dim_x = DEFAULT.DIM_X;
    this.dim_y = DEFAULT.DIM_Y;
    this.numAsteroids = DEFAULT.NUM_ASTEROIDS;

    this.asteroids = [];
    this.addAsteroid();
}

Game.prototype.addAsteroid = function() {
    for(let i = 0; i < this.numAsteroids; i++) {
        let asteroid = new Asteroid({pos: this.randomPosition(), game: this});
        this.asteroids.push(asteroid);
    }
}

Game.prototype.randomPosition = function() {
    let asteroid = [DEFAULT.DIM_X * Math.random(), DEFAULT.DIM_Y * Math.random()];
    return asteroid;
}

Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, DEFAULT.DIM_X, DEFAULT.DIM_Y);
    ctx.fillStyle = DEFAULT.BKG_COLOR;
    ctx.fillRect(0, 0, DEFAULT.DIM_X, DEFAULT.DIM_Y);

    this.asteroids.forEach(function(asteroid) {
        asteroid.draw(ctx);
    });
};

Game.prototype.moveObjects = function() {
    this.asteroids.forEach(function (asteroid) {
        asteroid.move(ctx);
    });
}

Game.prototype.wrap = function(pos) {
    //move up down
    //it is out of bound, it will go from other side
    // let x = pos[0];
    // let y = pos[1];
    if (pos[0] < 0) {
        pos[0] = DEFAULT.DIM_X //- (pos[0] % DEFAULT.DIM_X);
    } else if (pos[0] > DEFAULT.DIM_X) {
        pos[0] = pos[0] % DEFAULT.DIM_X;
    } else {
        pos[0] = pos[0];
    }

    if (pos[1] < 0) {
        pos[1] = DEFAULT.DIM_Y //- (pos[1] % DEFAULT.DIM_Y);
    } else if (pos[1] > DEFAULT.DIM_Y) {
        pos[1] = pos[1] % DEFAULT.DIM_Y;
    } else {
        pos[1] = pos[1];
    }

    return [pos[0], pos[1]];
}

module.exports = Game;