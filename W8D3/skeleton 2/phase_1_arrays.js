Array.prototype.uniq = function() {
  let new_arr = [];

  this.forEach(function(el) {
    if (!new_arr.includes(el)) 
    {
      new_arr.push(el);
    }
  })
  return new_arr;
}

Array.prototype.twoSum = function () {
  let ans = [];
  for(let step1 = 0; step1 < this.length - 1; step1++ ) {
    for (let step2 = step1 + 1; step2 < this.length; step2++) {
      // debugger;
      if ((this[step1] + this[step2]) === 0) {
        ans.push([step1, step2]);
      }
    }
  }
  return ans;
}

Array.prototype.transpose = function () {
  let length1 = this.length; 
  let length2 = this[0].length; 
  let i = 0;
  let outer_arr = [];
  while (i < length2) {
    j = 0;
    let inner_arr = [];
    while (j < length1) {
      inner_arr.push(this[j][i]);
      j++;
    }
    outer_arr.push(inner_arr);
    i++;
  }
  return outer_arr;
}

console.log([1, -2, -5, 2, 3, 3, 3, 34, 5].uniq())
console.log([1, -2, -5, 2, 3, 3, 3, 34, 5].twoSum())
console.log([[1, -2], [2, 3], [3, 34]].transpose())
