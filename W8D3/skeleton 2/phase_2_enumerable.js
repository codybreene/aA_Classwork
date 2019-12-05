Array.prototype.myEach = function(cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
}

Array.prototype.myMap = function(cb) {
  let new_arr = [];
  // console.log(this)
  this.myEach(
    (el)=> {
      new_arr.push(cb(el))
    }
  );
  return new_arr;
};

Array.prototype.myReduce = function(cb, acc) {
  // let acc = 0;
  // console.log(acc);
  debugger
  if (acc === undefined) {
    acc = this.shift();
    // el = this[1];
  }
  // else {el = this[0];}

  this.myEach(
    (el) => {
      acc = (cb(acc, el));
    }
  );
    return acc;
};

// let cb = console.log;
let array = [1,2,3]
// [1, 2, 3].myEach(function (el) { console.log(el * 2) });
console.log(array.myMap((el) =>  el * 3 ));

console.log([1, 2, 3].myReduce(function (acc, el) { return acc + el; }));
console.log([1, 2, 3].myReduce(function (acc, el) { return acc + el; }, 25));

