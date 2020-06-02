function curriedSum(numArgs) {
    let numbers = [];
    let original = this;
    return function _curriedSum(arg) {
        numbers.push(arg)
        if (numbers.length === numArgs) {
            let total = 0;
            for (let i = 0; i < numbers.length; i++) {
                total += numbers[i];
            }
            return total;
            // return original.apply(null, numbers)
        } else {
            return _curriedSum;
        };
    };
    return _curriedSum;
};



Function.prototype.curry = function(numArgs) {
    let numbers = [];
    let _curriedSum = (arg) => {
        numbers.push(arg)
        if (numbers.length === numArgs) {
            return this.apply(null, numbers)                                    //using apply
            // return this.call(null, ...numbers)                               //using spread operator
        } else {
            return _curriedSum;
        };
    };
    return _curriedSum;
    
}


const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56
function sum ...
sum.curry(4)(1)(2)(3)(4);