const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });


  function askIfGreaterThan(el1, el2, callback){
    //   debugger
    reader.question(`Is ${el1} greater than ${el2}?`, function(answer){
        // debugger
        if (answer === "yes"){
            callback(true);
        } else { 
            callback(false);
        }
    })
  };
  
  function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    // Do an "async loop":
    // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
    //    know whether any swap was made.
    // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
    //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
    //    continue the inner loop. You'll want to increment i for the
    //    next call, and possibly switch madeAnySwaps if you did swap.
    if (i < arr.length - 1 ) {
        askIfGreaterThan(arr[i], arr[i+1], function(isGreaterThan){ //isGreaterThan is gonna be true or false
            madeAnySwaps = false;
            if (isGreaterThan){ //
                // console.log('performing swap')
                // arr[i], arr[i+1] = arr[i+1], arr[i];
                const tem = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = tem;
                madeAnySwaps = true;
            }
    
            innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
        });
    } else if (i == arr.length -1) {
        outerBubbleSortLoop(madeAnySwaps);
    }


  }

  //   innerBubbleSortLoop([2,1], 0, false, function(madeAnySwaps){console.log(madeAnySwaps)})
  // TO TEST  ^^


  // Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
  // Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.
  
  function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        if (madeAnySwaps) {
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        } else {
            sortCompletionCallback(arr);
        }
      // Begin an inner loop if you made any swaps. Otherwise, call
      // `sortCompletionCallback`.
    }
  
    // Kick the first outer loop off, starting `madeAnySwaps` as true.
    outerBubbleSortLoop(true);
  }

  absurdBubbleSort([3, 5, 1], function(arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
  });