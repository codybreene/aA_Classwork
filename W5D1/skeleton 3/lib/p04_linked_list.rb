# require "byebug"

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

  include Enumerable

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
    @tail.prev == @head
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    # debugger
    node = Node.new(key, val)
    node.prev = @tail.prev
    node.prev.next = node 
    node.next = @tail 
    @tail.prev = node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

# k_v_pairs = {first: 1, second: 2, third: 3}

# list = LinkedList.new
#     k_v_pairs.each do |key, val|
#       list.append(key, val)
#     end

# p list    
# empty_list = LinkedList.new
# empty_list.append(:first, 1)
