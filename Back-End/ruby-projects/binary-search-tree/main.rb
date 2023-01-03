# Node Class 
class Node
  
  attr_accessor :value, :left, :right
  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end

# Tree Class
class Tree
  
  attr_accessor :root
  def initialize(array = [])
    @root = build_tree(array)
  end

  def build_tree(array)
    array = array.uniq.sort
    return nil if array.empty?

    mid = array.length / 2
    root = Node.new(array[mid])
    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid+1..-1])
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(key, root = @root)
    if root == nil
      return Node.new(key)
    else
      if root.value == key
        return root
      elsif root.value < key
        root.right = insert(key, root.right)
      else
        root.left = insert(key, root.left)
      end
    end
    return root
  end

  def delete(value, root = @root)
    return nil if root.nil?
  
    if value < root.value
      root.left = delete(value, root.left)
    elsif value > root.value
      root.right = delete(value, root.right)
    else
      if root.left.nil?
        temp = root.right
        root = nil
        return temp
      elsif root.right.nil?
        temp = root.left
        root = nil
        return temp
      end
  
      # node with two children: Get the inorder successor (smallest
      # in the right subtree)
      temp = min_value_node(root.right)
      root.value = temp.value
      root.right = delete(temp.value, root.right)
    end
    root
  end
  
  def min_value_node(node)
    current = node
    while !current.left.nil?
      current = current.left
    end
    current
  end
  
end
