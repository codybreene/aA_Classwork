const Util = require("./utils.js");
const MovingObject = require("./moving_object.js"); 

const Ship = function(opts) {
    MovingObject.call(this, {
      pos: opts.game.randomPosition(),
      vel: [0, 0],
      color: '#403bf3',
      radius: 30,
      game: opts.game
    });
  };

Ship.prototype.relocate = function () {
  this.pos = opts.game.randomPosition();
  this.vel = [0,0];
};

Util.inherits(Ship, MovingObject);

module.exports = Ship; 