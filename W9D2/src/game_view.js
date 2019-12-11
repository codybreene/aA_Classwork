const Game = require('./game.js');

const GameView = function(ctx) {
  this.game = new Game();
  this.ctx = ctx;
};

GameView.prototype.start = function () {
  let that = this;
  setInterval(
    function(){
      that.game.step();
      that.game.draw(that.ctx);
    }, 30);
};

module.exports = GameView;