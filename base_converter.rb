# Parse the command-line arguments
if ARGV.length != 2
  puts "Usage: ruby base_conversion.rb <number> <base>"
  puts "Supported bases: binary, octal, decimal, hexadecimal"
  exit
end

number = ARGV[0]
base = ARGV[1]

# Convert the number to decimal
case base
when "binary"
  decimal = number.to_i(2)
when "octal"
  decimal = number.to_i(8)
when "decimal"
  decimal = number.to_i(10)
when "hexadecimal"
  decimal = number.to_i(16)
else
  puts "Unsupported base: #{base}"
  puts "Supported bases: binary, octal, decimal, hexadecimal"
  exit
end

# Convert the decimal number to binary, octal, and hexadecimal
binary = decimal.to_s(2)
octal = decimal.to_s(8)
hexadecimal = decimal.to_s(16).upcase  # Use uppercase letters for hexadecimal digits

# Print the results
puts "Number: #{number}"
puts "Base: #{base}"
puts "--------------------------------"
puts "Binary: #{binary}"
puts "Octal: #{octal}"
puts "Decimal: #{decimal}"
puts "Hexadecimal: #{hexadecimal}"
