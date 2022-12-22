# Node Class with a value and link
class Node

  def init(value, link = nil)
    @value = value
    @link = link
  end

end


# LinkedList Class with a head
class LinkedList

  def init
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

end
