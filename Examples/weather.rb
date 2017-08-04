print "What is the temperature today? "
current_temp = gets.chomp
current_temp = Integer(current_temp)

if current_temp > 50
  puts "Get outta there!"
elsif current_temp > 40
  puts "Wear sunscreen!"
elsif current_temp > 25
  puts "Wear your swimmers! Time for the beach"
elsif current_temp > 15
  puts "Wear a jumper"
else
  puts "Rug up!"
end
