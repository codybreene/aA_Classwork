const Util = require("./utils.js");
const MovingObject = require("./moving_object.js"); 
const Ship = require("./ship");
// const Game = require('./game.js');

const Asteroid = function(pos, game) {
  MovingObject.call(this, {
    pos: pos, 
    vel: Util.randomVec(5), 
    color: '#42f575', 
    radius: 10,
    game: game
  });
};

// Asteroid.prototype.collideWith = function (otherObject) {
//   if (otherObject instanceof Ship) {
//     otherObject.relocate();
//   }
// };

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;