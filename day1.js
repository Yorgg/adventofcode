//  Day 1  (javascript)
// http://adventofcode.com/2017/day/1

// part I
const captchaSolver = s => (
  s.split('').reduce((sum, curr, i) => (
    curr === s.charAt((i+1)%s.length) ? sum + +curr : sum
  ), 0)
)

// part II
const captchaSolver = s => (
  s.split('').reduce((sum, curr, i) => (
    curr === s.charAt((i+s.length/2)%s.length) ? sum + +curr : sum
  ), 0)
)


