// Day 3
// https://adventofcode.com/2017/day/3

// Part 1
// Note: this function does not build a spiral array, 
// but derives the distance from the edge position (edge-square) of input
// and the # of sub-squares. 

function distance(input) {
  const edgeSquare = input => { 
    let subSquareCount = 0, n = 1, lastVal = 0
    while(n*n < input) { n+=2; lastVal = n*n; subSquareCount++ }
    return { lastVal, subSquareCount };
  }

  const distanceFromEdgeToEdgeCenter = ({ subSquareCount, lastVal }, input) => {
    const intervals = [0,1,2,3,4,5,6,7].map(n => {
      const out = [lastVal - subSquareCount*(n+1), lastVal - subSquareCount*n];
      return([...out, n%2===0 ? out[0] : out[1]]);
    })
    const edgeCenter = intervals.find(a => input >= a[0] && input <= a[1])[2]
    return Math.abs(edgeCenter-input)
  }

  const edgeSquareVals = edgeSquare(input);
  return distanceFromEdgeToEdgeCenter(edgeSquareVals, input) + edgeSquareVals.subSquareCount
}

// Answer
distance(312051)  // => 430

// Big number
distance(999999999999) // => 999992
