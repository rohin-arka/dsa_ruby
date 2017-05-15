require './stack/contiguos_stack_implementation'

def balance_bracket(string)
  stack = Stack.new(string.length-1)
  string.each_char do |s|
    if s == ']' && stack.top != '['
     return false
     break
    elsif s == '['
     stack.push(s)
   elsif s == ']' && stack.top == '['
     stack.pop
   end
  end
  stack.empty?
end
puts balance_bracket('[][][][]')
puts balance_bracket('[][][[]')
puts balance_bracket('[][][[[][][][][]][[][][][][][]]]]')
puts balance_bracket('[][')
