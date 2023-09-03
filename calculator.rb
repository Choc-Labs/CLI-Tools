input = ARGV[0]
operators = ["+", "-", "*", "/"]
num_stack = []
op_stack = []

# Helper function to perform an operation on the top two numbers in the num_stack
def perform_operation(num_stack, op_stack)
  num2 = num_stack.pop
  num1 = num_stack.pop
  operator = op_stack.pop

  case operator
  when "+"
    result = num1 + num2
  when "-"
    result = num1 - num2
  when "*"
    result = num1 * num2
  when "/"
    result = num1 / num2
  end

  num_stack.push(result)
end

# Parse the input string into numbers and operators
current_num = ""
input.each_char do |char|
  if operators.include?(char)
    num_stack.push(current_num.to_f)
    current_num = ""
    op_stack.push(char)
  else
    current_num += char
  end
end
num_stack.push(current_num.to_f)

# Perform the operations in order of precedence (*/ before +-)
while op_stack.length > 0
  if op_stack.include?("*") || op_stack.include?("/")
    perform_operation(num_stack, op_stack)
  else
    perform_operation(num_stack, op_stack)
  end
end

puts "The result is: #{num_stack[0]}"
