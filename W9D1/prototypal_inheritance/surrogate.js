// Function.prototype.inherits = function (SuperClass) {
//     function Surrogate() {}
//     Surrogate.prototype = SuperClass.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// };

Function.prototype.inherits2 = function(SuperClass) {
    this.prototype = Object.create(SuperClass.prototype);
    this.prototype.constructor = this;
}
function MovingObject(name) {
    this.name = name;
};

MovingObject.prototype.explode = function() {
    console.log(`${this.name} has exploded!`);
}

function Ship(name, mass) {
    this.name = name;
    this.mass = mass;
};
Ship.inherits2(MovingObject);

Ship.prototype.fly = function () {
    console.log(`${this.name} with mass ${this.mass} is flying in space`);
};

Asteroid.inherits2(MovingObject);
function Asteroid(name, radius) {
    this.name = name;
    this.radius = radius;
}

Asteroid.prototype.flow = function() {
    console.log(`${this.name} with circumference ${2 * Math.PI * this.radius} is flowing in the space`)
}


let apollo = new Ship('Apollo 13', 1000);

let vesta = new Asteroid('4 Vesta', 2000);

apollo.explode();           //should work
// apollo.flow();              //shouldn't work
apollo.fly();               //should work

vesta.explode();           //should work
vesta.flow();              //should work
// vesta.fly();               //shouldn't work
  
// const Shape = require('./shape');

// function Circle(color, radius){
//   this.color = color;
//   this.radius = radius;
// };

// Circle.prototype = Object.create(Shape.prototype);
// Circle.prototype.constructor = Circle;

// Circle.prototype.calcCircumference = function(){
//   console.log(`My circumference is ${2 * Math.PI * this.radius} because my radius is ${this.radius}`);
// }

// module.exports = Circle;