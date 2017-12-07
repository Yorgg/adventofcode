# Day 7
# https://adventofcode.com/2017/day/7

def parse_nodes(str)
  match = str.match(/->\s([a-z,\s]+)$/)
  match ? match[1].split(', ') : nil
end

def parse_id(str)
  str.strip.match(/^([a-z]+)/)[0]
end

def parse_weight(str)
  str.match(/\((\d+)\)/)[1].to_i
end

def descendants(towers_with_nodes)
  descendants = towers_with_nodes.reduce([]) do |towers, str| 
    towers.concat(parse_nodes(str))
  end 
end

def find_root(towers)
  towers_with_nodes = towers.select {|s| s.match(/->/)}
  ids = towers_with_nodes.map{|s| parse_id(s)}
  descendants = descendants(towers_with_nodes)
  ids.find{|tower| !descendants.include?(tower)}
end


def hash_of_all_nodes(towers)
  towers.reduce({}) do |hash, str|
    weight = parse_weight(str)
    id = parse_id(str)
    hash[id] = Tower.new(id, weight, parse_nodes(str)) 
    hash
  end
end

def add_descendant_towers(all_towers)
  all_towers.each do |id, tower|
    if tower.nodes 
      tower.nodes = tower.nodes.map{|x| all_towers[x]} 
    end
  end
end

# tree node 

class Tower
  attr_accessor :id, :weight, :nodes
  def initialize(id, weight=0, nodes=nil)
    @id     = id 
    @weight = weight
    @nodes  = nodes
  end 
end

##

def build_tree(towers, start)
  node_hash = hash_of_all_nodes(towers)
  add_descendant_towers(node_hash)
  node_hash[start]
end

def add_weights(weights)
  weights.map{|x| x[0] + x[1]}
end

def bad_weight?(weights)
  add_weights(weights).uniq.length > 1
end

def bad_node_index(weights)
  weights = add_weights(weights)
  weights.map{|x| weights.count(x)}.find_index(1)
end

def weight_diff(bad_node, weights)
  weights = add_weights(weights)
  weights[(bad_node+1)%weights.length] - weights[bad_node]
end

def bad_node(tower)
  return 0 if tower.nodes.nil? 
  weights = tower.nodes.map do |node| 
    total_above_weight = bad_node(node) 

    # this doesn't seem very elegant, lol...
    return total_above_weight if total_above_weight.is_a?(Hash)

    [node.weight, total_above_weight]
  end

  if bad_weight?(weights)
     bad_node_index = bad_node_index(weights)
     { weight: weights[bad_node_index][0], 
       diff: weight_diff(bad_node_index, weights) }
  else
    add_weights(weights).reduce(0) {|acc, el| acc+el}
  end
end

towers = input.split("\n")

# part 1
start = find_root(towers)  
puts start # => 'eqgvf'

# part 2
root = build_tree(towers, start)
bad_node = bad_node(root)
res = bad_node[:weight] + bad_node[:diff]     
puts res # => 757


  







