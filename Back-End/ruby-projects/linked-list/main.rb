# Node Class
class Node

  def init(value, link = nil)
    @value = value
    @link = link
  end

end


# LinkedList Class
class LinkedList

  def init
    @head = nil
  end

  def prepend(value)
    new_node = Node.new(value)
    unless @head == nil
      new_node.link = @head
      @head = new_node
    else
      @head = new_node
    end
  end

  def append(value)
    
  end

end
