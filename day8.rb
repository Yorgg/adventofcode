# Day 8
# https://adventofcode.com/2017/day/8

@highest = 0
registers = Hash.new(0)

def _create_command(a,b,registers)
  a.gsub!(/inc|dec/){|m| m=='inc' ? '+=' : '-='}
  [a,b].each {|x| x.gsub!(/[a-z]+/){|m|"registers['#{m}']"}}
  command = [a,b].join(' if ')
end

def _run_instruction(a,b,registers)
  eval(_create_command(a,b,registers))
end

def _update_highest(registers, register)
  register_val = registers[register]
  @highest  = register_val if register_val > @highest
end

input.strip.each_line do |str|
  a, b = str.split(' if ')
  register = a.match(/^[a-z]+/)[0]
  _run_instruction(a,b,registers)
  _update_highest(registers, register)
end

# Part 1
puts registers.values.max # => 5143

# Part 2
puts @highest  # => 6209 
