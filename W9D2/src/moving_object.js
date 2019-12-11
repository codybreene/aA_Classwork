function MovingObject(opts) {
  this.pos = opts.pos;
  this.vel = opts.vel;
  this.radius = opts.radius;
  this.color = opts.color;
  this.game = opts.game;
}

MovingObject.prototype.draw = function (ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );
  ctx.fill();
};

MovingObject.prototype.move = function() {
  // debugger;
  this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
  this.pos = this.game.wrap(this.pos);
};

MovingObject.prototype.isCollidedWith = function (otherMovingObject) {
  if (this.getDistance(otherMovingObject) <= (this.radius + otherMovingObject.radius)) {
    this.collideWith(otherMovingObject);
  } else {
    return false;
  }
};

MovingObject.prototype.getDistance = function (otherObject) {
  // Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)
  let x1 = this.pos[0];
  let y1 = this.pos[1];
  let x2 = otherObject.pos[0];
  let y2 = otherObject.pos[1];
  return Math.sqrt(Math.pow((x1 - x2), 2) + Math.pow((y1 - y2), 2));
};

MovingObject.prototype.collideWith = function (otherObject) {
  this.game.remove(this);
  this.game.remove(otherObject);
};

module.exports = MovingObject;
 
