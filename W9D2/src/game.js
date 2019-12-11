const Asteroid = require('./asteroid');
const Ship = require('./ship');

const Game = function() {
  this.DIM_X = 1000;
  this.DIM_Y = 800;
  this.NUM_ASTEROIDS = 25;
  this.asteroids = [];
  this.addAsteroids();
  this.ship = new Ship({game: this});
  // debugger;
  this.allObjects = this.asteroids.concat(this.ship);
};


Game.prototype.addAsteroids = function() {
  let i = 0;
  while (i < this.NUM_ASTEROIDS) {
    let pos = this.randomPosition();
    this.asteroids.push(new Asteroid(pos, this));
    // debugger;
    i++;
  }
};

Game.prototype.randomPosition = function() {
  let x = Math.floor(this.DIM_X * Math.random());
  let y = Math.floor(this.DIM_Y * Math.random());
  return [x,y];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  for (let i = 0; i < this.allObjects.length; i++) {
    this.allObjects[i].draw(ctx);
  }
};

Game.prototype.moveObjects = function() {
  for (let i = 0; i < this.allObjects.length; i++) {
    this.allObjects[i].move();
  }
};

Game.prototype.wrap = function(pos) {
  let x;
  let y;
  if (pos[0] < 0) {
    x = this.DIM_X;
    y = pos[1];  
  } else if (pos[1] < 0) {
    y = this.DIM_Y;
    x = pos[0];
  } else {
    x = pos[0] % this.DIM_X;
    y = pos[1] % this.DIM_Y;}
  return [x, y];
};

Game.prototype.checkCollisions = function () {
  let obj = this.allObjects
  for (let i = 0; i < obj.length; i++) {
    for (let j = 0; j < obj.length; j++) {
      if (i === j) {
        continue;
      } else if (obj[i].isCollidedWith(obj[j])) {
        alert("There has a been a collision! Abandon ship!");
      }
    }
  }
};

Game.prototype.step = function(){
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function (asteroid) {
  let index = this.allObjects.indexOf(asteroid);
  if (index > -1) {
    this.allObjects.splice(index,1);
  }
};

module.exports = Game;