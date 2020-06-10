// Problem #1
// You are climbing a stair case.It takes n steps to reach to the top.
// Each time you can either climb 1 or 2 steps.In how many distinct ways can you climb to the top ?
//   Note : Given n will be a positive integer.
//     Example 1:
// Input: 2
// Output: 2
// Explanation: There are two ways to climb to the top.
// 1. 1 step + 1 step
// 2. 2 steps

// Example 2:
// Input: 3
// Output: 3
// Explanation: There are three ways to climb to the top.
// 1. 1 step + 1 step + 1 step
// 2. 1 step + 2 steps
// 3. 2 steps + 1 step

// 1) how many ways
// 2) 1step or 2steps, any combination 


function countSteps(N) {
  
  // just as in our solution explanation above, we know that to climb 1 step
  // there is only 1 solution, and for 2 steps there are 2 solutions
  if (N === 1) { return 1; }
  if (N === 2) { return 2; }
  
  // for all N > 2, we add the previous (N - 1) + (N - 2) steps to get
  // an answer recursively
  return countSteps(N - 1) + countSteps(N - 2);
  
}

// the solution for N = 6 will recursively be solved by calculating
// the solution for N = 5, N = 4, N = 3, and N = 2 which we know is 2
console.log(countSteps(4)); 
[1,1,1,1], [2,2], [1,2,1,], [2,1,1], [1,1,2]


// Problem #2
// Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
// Example:
// Input: [0, 1, 0, 3, 12]
// Output: [1, 3, 12, 0, 0]
// Note:
// Minimize the total number of operations.

function arrange(array) {
  let left = []
  let right = []
  for(let i = 0; i < array.length; i++) {
    if (array[i] === 0) {
      right.push(array[i])
    } else {
      left.push(array[i])
    }
  }
  return left.sort().concat(right)
}