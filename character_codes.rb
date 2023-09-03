# Parse the command-line arguments
if ARGV.length != 1
  puts "Usage: ruby character_codes.rb <encoding>"
  puts "Supported encodings: ascii, extended_ascii, unicode"
  exit
end

encoding = ARGV[0]

# Print the character table and codes for the specified encoding
case encoding
when "ascii"
  start_code = 0
  end_code = 127
when "extended_ascii"
  start_code = 128
  end_code = 255
when "unicode"
  start_code = 0
  end_code = 65535
else
  puts "Unsupported encoding: #{encoding}"
  puts "Supported encodings: ascii, extended_ascii, unicode"
  exit
end

puts "#{encoding.capitalize} Character Table and Codes:"
puts "--------------------------------"
(start_code..end_code).each do |i|
  if i % 16 == 0
    print "\n"
  end
  begin
    print "#{i.chr(Encoding::UTF_8)} (#{i.to_s(16).upcase.rjust(4, '0')})\t"
  rescue RangeError
    # Skip over surrogate codepoints
  end
end
puts "\n--------------------------------"
