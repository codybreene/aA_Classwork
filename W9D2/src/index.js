const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require('./game.js');
const GameView = require('./game_view.js');

console.log("Webpack is working! (I think?)");

document.addEventListener('DOMContentLoaded', () => {
  let canvas = document.getElementById("game-canvas");
  let ctx = canvas.getContext("2d");
  const ast = new Asteroid([100, 100]);
  const g = new Game();
  const gv = new GameView(ctx);
  const mo = new MovingObject({
    pos: [100, 150],
    vel: [10, 10],
    radius: 10,
    color: "#42f575",
    game: g
  });  

  window.mo = mo;
  window.canvas = canvas;
  window.ctx = ctx;
  window.draw = MovingObject.draw;
  window.MovingObject = MovingObject;
  window.move = MovingObject.move;
  window.Asteroid = Asteroid;
  window.ast = ast;
  window.g = g;
  window.gv = gv;
});

