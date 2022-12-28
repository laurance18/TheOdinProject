# Node Class 
class Node
  
  attr_reader :value, :left, :right
  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end

# Tree Class
class Tree
  
  def initialize(array = [])
    @root = build_tree(array)
  end

  def build_tree(array)
    array.uniq!.sort!
    
  end

end