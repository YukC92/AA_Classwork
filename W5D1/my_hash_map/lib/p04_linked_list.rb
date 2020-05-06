class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    node = @head.next
    node = node.next until node.key == key || node == @tail
    node.val
  end

  def include?(key)
    found = get(key)
    found ? true : false
  end

  def append(key, val)
    new_node = Node.new(key, val)

    sec_last = @tail.prev
    sec_last.next = new_node

    @tail.prev = new_node

    new_node.prev = sec_last
    new_node.next = @tail
  end

  def update(key, val)
  end

  def remove(key)
    node = @head.next
    until node.key == key
      node = node.next
      return if node == @tail
    end
    
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
