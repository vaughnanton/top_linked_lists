class LinkedList

  def initialize
    @head = nil
    @tail = nil
  end

#add new node to end of list
  def append(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

#add new node to beginning of list
  def prepend
    node = Node.new(data)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

#count total number of nodes in list
  def size
    return 0 if @head.nil?
    tmp = @head
    count = 0
    while tmp != nil
      tmp = tmp.next_node
      count += 1
    end
    count
  end

#return the first node of list
  def head
    return nil if @head.nil?
    @head.value
  end

#return the last node of list
  def tail
    return nil if @tail.nil?
    @tail.value
  end

#return node at given index
  def at(index)
    return 0 if @head.nil?
    tmp = @head
    index.times { tmp = tmp.next_node }
    tmp.value
  end

#remove last node of list
  def pop
    @new_tail = at((size) - 2)
    @new_tail.next_node = nil

    @tail = @new_tail
  end

#returns true if value is present in list
  def contains?(data)
    return false if @head.nil?
    tmp = @head
    answer = false
    until tmp.nil?
      answer = true if tmp.value == data
      tmp = tmp.next_node
    end
    answer
  end

#returns index of node containing value
  def find(data)
    return nil if @head.nil?
    i = 0
    answer = nil
    tmp = @head
    until tmp.nil?
      answer = i if tmp.value == data
      tmp = tmp.next_node
      i += 1
    end
    answer
  end

#represent linkedlist objects as strings so they can be viewed in console
  def to_s
    return nil if @head.nil?
    string = ""
    tmp = @head
    until tmp.nil?
      string += "( #{tmp.value} ) -> "
      tmp = tmp.next_node
    end
    string += "nil"
    string
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(data=nil)
    @value = data
    @next_node = nil
  end
end
