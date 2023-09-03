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
  if char == "("
    op_stack.push(char)
  elsif char == ")"
    num_stack.push(current_num.to_f)
    current_num = ""
    while op_stack[-1] != "("
      perform_operation(num_stack, op_stack)
    end
    op_stack.pop
  elsif operators.include?(char)
    num_stack.push(current_num.to_f)
    current_num = ""
    while op_stack.length > 0 && operators.index(op_stack[-1]) >= operators.index(char)
      perform_operation(num_stack, op_stack)
    end
    op_stack.push(char)
  else
    current_num += char
  end
end
num_stack.push(current_num.to_f)

# Perform any remaining operations
while op_stack.length > 0
  perform_operation(num_stack, op_stack)
end

puts "The result is: #{num_stack[0]}"
