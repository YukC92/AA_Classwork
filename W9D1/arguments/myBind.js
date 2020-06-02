Function.prototype.myBind = function (ctx) {
    let orginal = this;
    let bindArgs = Array.from(arguments).slice(1);
    return function _bound() {
        let callArgs = Array.from(arguments);
        return orginal.apply(ctx, bindArgs.concat(callArgs));
    }
    //callArgs, bindArgs
}


Function.prototype.myBind2 = function (ctx, ...bindArgs) {
    let original = this;
    return function (...callArgs) {
        return original.apply(ctx, bindArgs.concat(callArgs));
    };
};