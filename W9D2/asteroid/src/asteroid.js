const MovingObject = require("./moving_object.js");
const Util = require("./util")

const DEFAULT = {
    COLOR: "yellow",
    RADIUS: 5
};

function Asteroid(options) {
    options.color = DEFAULT.COLOR;
    options.radius = DEFAULT.RADIUS;
    options.vel = Util.randomVec(3);
    options.pos = options.pos;

    MovingObject.call(this, options);

}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;