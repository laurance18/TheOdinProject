# Node Class with a value and link
class Node

  attr_accessor :link, :value
  def initialize(value, link = nil)
    @value = value
    @link = link
  end

end


# LinkedList Class with a head
class LinkedList

  attr_accessor :head
  def initialize
    @head = nil
  end

  def prepend(value)
    new_node = Node.new(value)
    unless @head == nil # Check if head is already present, if so, prepend accordingly
      new_node.link = @head
      @head = new_node
    else
      @head = new_node # If no head is present, head = new_node
    end
  end

  def append(value)
    new_node = Node.new(value)
    unless @head == nil # Check if head is already present, if so, check until current.link == nil, then append
      current = @head
      until current.link == nil
        current = current.link
      end
      current.link = new_node
    else
      @head = new_node # If no head is present, head = new_node
    end
  end

  def size
    current = @head
    total = 1
    until current.link == nil # Iterate until current.link == nil (no next node) and return total count
      current = current.link
      total += 1
    end
    return total
  end

  def head
    return @head
  end

  def tail
    current = @head
    until current.link == nil
      current = current.link
    end
    return current
  end

  def at(index)
    count = 0
    current = @head
    until count == index
      current = current.link
      count += 1
    end
    return current
  end

  def pop
    current = @head
    until current.link == tail
      current = current.link
    end
    current.link = nil
  end

  def contains?(value)
    current = @head
    until current == nil
      return true if current.value == value
      current = current.link
    end
    return false
  end

  def find(value)

  end

  def to_s
    current = @head
    string_rep = String.new()
    until current == nil
      string_rep += "( #{current.value} ) -> "
      current = current.link
    end
    string_rep += "nil"
    return string_rep
  end

end
