# Day5
# https://adventofcode.com/2017/day/5

def steps_required(instructions)
  finish = instructions.length
  position, count = 0, 0

  until position >= finish do 
    el = instructions[position]
    instructions[position] = block_given? ? yield(el) : el+1 
    count += 1
    position += el
  end
  
  count
end

instructions = input.split("\n").map(&:to_i)

# part 1
puts steps_required(instructions) # => 5 

# part 2
puts steps_required(instructions) {|x| x >= 3 ? x-1 : x+1} # => 26395586 



