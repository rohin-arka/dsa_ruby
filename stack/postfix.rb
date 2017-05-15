require './stack/contiguos_stack_implementation'

OPERATORS = { '+' => :+, '-' => :-, "*" => :*, '/' => :/ }

def post_fix(expression)
  stack = Stack.new
  expression.each_char do |c|
    operation = OPERATORS[c]
    if operation
      second_element = stack.pop
      first_element = stack.pop
      stack.push(first_element.send(operation, second_element))
    elsif c != ' '
      stack.push(c.to_i)
    end
  end
  stack.pop
end
# Note delimeter as a space can also be used
puts post_fix('23*54*+9-')
puts post_fix('473+8*16+*')
