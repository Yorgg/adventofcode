// Day 3
// https://adventofcode.com/2017/day/3

// Part 1
// Note: this function does not build a spiral array, 
// but derives the distance from the edge position (outer square) of input
// and the # of sub-squares. 

function distance(input) {
  const squareEndVals = input => { 
    let array = [1];
    let n = 1;
    while(n*n < input) { n+=2; array = [...array, n*n]; }
    return array;
  }

  const distanceFromEdgeToInnerSquare = squares => squares.length-1;

  const distanceToEdgeCenter = (squares, input) => {
    const intervals = [0,1,2,3,4,5,6,7].map(n => {
      const half = squares.length-1;
      const last = squares[half];
      const out = [last - half*(n+1), last - half*n];
      return([...out, n%2===0 ? out[0] : out[1]]);
    })
    const edgeCenter = intervals.find(a => input >= a[0] && input <= a[1])[2]
    return Math.abs(edgeCenter-input)
  }

  const squares = squareEndVals(input)
  return(distanceToEdgeCenter(squares,input) + distanceFromEdgeToInnerSquare(squares))
}

// Answer
distance(312051)  //=> 430
