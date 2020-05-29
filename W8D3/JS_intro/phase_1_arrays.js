Array.prototype.uniq = function() {
    let result = [];
    for (let i = 0; i < this.length; i++) {
        if (result.indexOf(this[i]) === -1) {
            result.push(this[i])
        }
    }
    return result;
}

// ([1,2,2,3,3,3].uniq() => [1,2,3])

Array.prototype.twoSum = function() {
    let result = [];
    
    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                result.push([i, j]);
            }
        }
    }
    return result;
}

Array.prototype.transpose = function() {
    let result = Array.from(this.length);
    let columnLength = this[0].length
    for (let i = 0; i < columnLength; i++) {
        result.push([])
    }
    for (let j = 0; j <this.length; j++) {
        for (let k = 0; k < columnLength; k++) {
            result[k].push(this[j][k])
        }
    }
    return result
}

//[[0, 1, 2], [3, 4, 5], [6, 7, 8]].transpose()

