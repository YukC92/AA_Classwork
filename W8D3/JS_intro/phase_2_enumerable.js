

Array.prototype.myEach = function(func) {
    for(let i = 0; i < this.length ; i++) {
        func(this[i]);
    }
}
// NUM.myEach((number) => console.log(number + '$'))


Array.prototype.myMap = function(func) {
    let result = [];
    this.myEach( ele => result.push(func(ele)));
    return result;
}

// console.log(NUM.myMap(num => num * num))

Array.prototype.myReduce = function(func, initialValue) {
    
    let arr = this
    
    if (initialValue === undefined) {
        initialValue = arr[0];
        arr = arr.slice(1)
    }
    
    let result = initialValue 
    arr.myEach(ele => result = func(result, ele))
    
    return result
}

const NUM = [1, 2, 5, 7];

console.log(NUM.myReduce((total, item) => total + item));
console.log(NUM.myReduce((total, item) => total + item, -15));