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
    array.empty? ? nil : array = array.uniq.sort
    current_line = 1
    levels = 1 + Math.log(array.size, 2).floor

    until current_line == levels
      iter = Array.new()
      for i in (0...2**(levels-1)) do
        next
      end
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end
