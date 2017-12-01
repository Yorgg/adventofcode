//  Day 1  (javascript)

const captchaSolver = s => (
  s.split('').reduce((sum, curr, i) => {
    const next = (i===s.length-1 ? s.charAt(0) : s.charAt(i+1));
    return(curr === next ? sum + +curr : sum);
  }, 0)
)
