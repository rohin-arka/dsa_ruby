# Implements stack interface
class Stack

  EMPTY_STACK_SIZE = 0

  private_constant :EMPTY_STACK_SIZE

  attr_reader :size

  def initialize(stack_size = EMPTY_STACK_SIZE)
    @size = stack_size
    @store = Array.new(stack_size)
    @top_index = -1
  end

  def pop
    return nil if empty? # Precondition stack should not be empty
    last_element = @store[@top_index]
    @store[@top_index] = nil
    top_index_minus_minus!
    last_element
  end

  def push(element)
    return nil if full?
    top_index_plus_plus! # increase top_index to 0 at initial
    @store[@top_index] = element
    @store
  end

  def empty?
    (@store - [nil]).length == 0
  end

  def top
    @store.last
  end

  private

  def full?
    @top_index == @size - 1
  end

  def top_index_plus_plus!
    @top_index +=1
  end

  def top_index_minus_minus!
    @top_index -= 1
  end
end

stack = Stack.new(2)
stack.push(1)
 # => [1]
stack.push(2)
 # => [2]
stack.push(3)
 # => nil
stack.pop
 # => [1, nil]
stack.size
 # => 2
stack.empty?
 # => false
