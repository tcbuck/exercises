require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

#ask location
puts "Are you in Canberra, Melbourne or Sydney? "
loc = gets.chomp.capitalize
if loc == "Canberra"
  link = "act/act/canberra"
elsif loc == "Sydney"
  link = "nsw/sydney/sydney"
elsif loc == "Melbourne"
  link = "vic/melbourne/melbourne"
else
  puts "I don't know where you are!"
end

# ask for gender and store
puts "Are you a boy or a girl?"
gender = gets.chomp

#scrape the weather page
location_link = "http://www.weatherzone.com.au/#{link}"

page = HTTParty.get(location_link)

parse_page = Nokogiri::HTML(page)

weather = []
a = parse_page.css(".tempnow")
#a = parse_page.css(".top_left").css(".summary_now").css(".tempnow")
  b = a.text

puts "The weather is #{b}"


#print results
current_temp = b.to_i

if current_temp > 50
  puts "Get outta there!"
elsif current_temp > 40
  puts "Wear sunscreen! Otherwise you'll be a sunburnt #{gender}"
elsif current_temp > 25
  puts "Wear your swimmers! Time for the beach, you lucky #{gender}"
elsif current_temp > 15
  puts "Wear a jumper, otherwise you'll be a cold #{gender}"
elsif current_temp > -5
  puts "Rug up! Otherwise you'll be a cold #{gender}"
else
  puts "Error"
end
