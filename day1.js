//  Day 1  (javascript)

const captchaSolver = s => (
  s.split('').reduce((sum, curr, i) => (
    curr === s.charAt((i+1)%s.length) ? sum + +curr : sum
  ), 0)
)

