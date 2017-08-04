puts "Enter number 1"
num1 = gets.chomp.to_f
puts "Enter number 2"
num2 = gets.chomp.to_f

puts "Would you like to multiply, subtract, divide or add?"
operator = gets.chomp
if operator == "multiply"
  total = num1 * num2
elsif operator == "subtract"
  total = num1 - num2
elsif operator == "divide"
  total = num1 / num2
elsif operator == "add"
  total = num1 + num2
else
  puts "Sorry, I don't understant"
end

puts total
