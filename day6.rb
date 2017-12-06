# Day 6
# https://adventofcode.com/2017/day/6

# this method has side effect (banks variable)
def _cycle(banks, max_i, i, count)
  until count.zero? do  
    i = i%banks.length
    banks[i] += 1
    banks[max_i] -= 1
    count -= 1
    i += 1
  end
end

def redistribute(banks)
  history = []
  cycles = 0

  until history.include?(banks.join('')) do 
    max   = banks.max 
    max_i = banks.find_index(max)
    history << banks.join('')   
    _cycle(banks, max_i, max_i+1, max) 
    cycles += 1
  end
  
  {total_cycles: cycles, loop_cycles: cycles - history.find_index(banks.join('')) }
end

# setup
input = '14  0  15 12  11 11  3  5  1  6  8  4  9  1  8  4'
banks = input.split(' ').map(&:to_i)
res = redistribute(banks)

# part 1
puts res[:total_cycles] # => 11137 

# part 2
puts res[:loop_cycles] # => 1037 


