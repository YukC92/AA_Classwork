Array.prototype.bubbleSort = function() {
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 0; i < this.length - 1; i++) {
            if (this[i] > this[i+1]) {
                [this[i], this[i+1]] = [this[i+1], this[i]];
                sorted = false;
            }
        }
    }
    return this;

}

// NUM = [3, 5, 1, 2];
// console.log(NUM.bubbleSort())

String.prototype.substrings = function() {
    let result = [];

    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j <= this.length; j++) {
            result.push(this.slice(i,j));
        }
    }
    return result
}

console.log('dog'.substrings())