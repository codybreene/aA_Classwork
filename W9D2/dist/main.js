/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\"); \nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n// const Game = require('./game.js');\n\nconst Asteroid = function(pos, game) {\n  MovingObject.call(this, {\n    pos: pos, \n    vel: Util.randomVec(5), \n    color: '#42f575', \n    radius: 10,\n    game: game\n  });\n};\n\n// Asteroid.prototype.collideWith = function (otherObject) {\n//   if (otherObject instanceof Ship) {\n//     otherObject.relocate();\n//   }\n// };\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n\nconst Game = function() {\n  this.DIM_X = 1000;\n  this.DIM_Y = 800;\n  this.NUM_ASTEROIDS = 25;\n  this.asteroids = [];\n  this.addAsteroids();\n  this.ship = new Ship({game: this});\n  // debugger;\n  this.allObjects = this.asteroids.concat(this.ship);\n};\n\n\nGame.prototype.addAsteroids = function() {\n  let i = 0;\n  while (i < this.NUM_ASTEROIDS) {\n    let pos = this.randomPosition();\n    this.asteroids.push(new Asteroid(pos, this));\n    // debugger;\n    i++;\n  }\n};\n\nGame.prototype.randomPosition = function() {\n  let x = Math.floor(this.DIM_X * Math.random());\n  let y = Math.floor(this.DIM_Y * Math.random());\n  return [x,y];\n};\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);\n  for (let i = 0; i < this.allObjects.length; i++) {\n    this.allObjects[i].draw(ctx);\n  }\n};\n\nGame.prototype.moveObjects = function() {\n  for (let i = 0; i < this.allObjects.length; i++) {\n    this.allObjects[i].move();\n  }\n};\n\nGame.prototype.wrap = function(pos) {\n  let x;\n  let y;\n  if (pos[0] < 0) {\n    x = this.DIM_X;\n    y = pos[1];  \n  } else if (pos[1] < 0) {\n    y = this.DIM_Y;\n    x = pos[0];\n  } else {\n    x = pos[0] % this.DIM_X;\n    y = pos[1] % this.DIM_Y;}\n  return [x, y];\n};\n\nGame.prototype.checkCollisions = function () {\n  let obj = this.allObjects\n  for (let i = 0; i < obj.length; i++) {\n    for (let j = 0; j < obj.length; j++) {\n      if (i === j) {\n        continue;\n      } else if (obj[i].isCollidedWith(obj[j])) {\n        alert(\"There has a been a collision! Abandon ship!\");\n      }\n    }\n  }\n};\n\nGame.prototype.step = function(){\n  this.moveObjects();\n  this.checkCollisions();\n};\n\nGame.prototype.remove = function (asteroid) {\n  let index = this.allObjects.indexOf(asteroid);\n  if (index > -1) {\n    this.allObjects.splice(index,1);\n  }\n};\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nconst GameView = function(ctx) {\n  this.game = new Game();\n  this.ctx = ctx;\n};\n\nGameView.prototype.start = function () {\n  let that = this;\n  setInterval(\n    function(){\n      that.game.step();\n      that.game.draw(that.ctx);\n    }, 30);\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\nconsole.log(\"Webpack is working! (I think?)\");\n\ndocument.addEventListener('DOMContentLoaded', () => {\n  let canvas = document.getElementById(\"game-canvas\");\n  let ctx = canvas.getContext(\"2d\");\n  const ast = new Asteroid([100, 100]);\n  const g = new Game();\n  const gv = new GameView(ctx);\n  const mo = new MovingObject({\n    pos: [100, 150],\n    vel: [10, 10],\n    radius: 10,\n    color: \"#42f575\",\n    game: g\n  });  \n\n  window.mo = mo;\n  window.canvas = canvas;\n  window.ctx = ctx;\n  window.draw = MovingObject.draw;\n  window.MovingObject = MovingObject;\n  window.move = MovingObject.move;\n  window.Asteroid = Asteroid;\n  window.ast = ast;\n  window.g = g;\n  window.gv = gv;\n});\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(opts) {\n  this.pos = opts.pos;\n  this.vel = opts.vel;\n  this.radius = opts.radius;\n  this.color = opts.color;\n  this.game = opts.game;\n}\n\nMovingObject.prototype.draw = function (ctx) {\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n\n  ctx.arc(\n    this.pos[0],\n    this.pos[1],\n    this.radius,\n    0,\n    2 * Math.PI,\n    false\n  );\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function() {\n  // debugger;\n  this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];\n  this.pos = this.game.wrap(this.pos);\n};\n\nMovingObject.prototype.isCollidedWith = function (otherMovingObject) {\n  if (this.getDistance(otherMovingObject) <= (this.radius + otherMovingObject.radius)) {\n    this.collideWith(otherMovingObject);\n  } else {\n    return false;\n  }\n};\n\nMovingObject.prototype.getDistance = function (otherObject) {\n  // Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)\n  let x1 = this.pos[0];\n  let y1 = this.pos[1];\n  let x2 = otherObject.pos[0];\n  let y2 = otherObject.pos[1];\n  return Math.sqrt(Math.pow((x1 - x2), 2) + Math.pow((y1 - y2), 2));\n};\n\nMovingObject.prototype.collideWith = function (otherObject) {\n  this.game.remove(this);\n  this.game.remove(otherObject);\n};\n\nmodule.exports = MovingObject;\n \n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\"); \n\nconst Ship = function(opts) {\n    MovingObject.call(this, {\n      pos: opts.game.randomPosition(),\n      vel: [0, 0],\n      color: '#403bf3',\n      radius: 30,\n      game: opts.game\n    });\n  };\n\nShip.prototype.relocate = function () {\n  this.pos = opts.game.randomPosition();\n  this.vel = [0,0];\n};\n\nUtil.inherits(Ship, MovingObject);\n\nmodule.exports = Ship; \n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    function Surrogate () {}\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n  randomVec(length){\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  scale(vec, m){\n    return [vec[0] * m, vec[1] * m];\n  }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });