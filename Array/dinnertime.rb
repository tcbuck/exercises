require 'HTTParty'
require 'Nokogiri'

# gets user to input items in kitchen
ingredients = []

i = true
while i == true
  puts "What do you have in your fridge and pantry (print end to finish)"
  ingredient = gets.chomp
  if ingredient == "end"
    i = false
  end
  ingredients.push(ingredient)
end

# display back list
puts "Cool, it looks like you've got this at home!"
ingredients.delete("end")
a = ingredients.count
puts ingredients

# prestored recipe links in an array
recipe_list = ["http://www.taste.com.au/recipes/chicken-bstilla-pies/uGbryXOY?r=quickeasy/kj1r4Zny",
  "http://www.taste.com.au/recipes/beef-olive-spaghetti-bolognese/77f0654c-0c53-4f95-bc41-d864ae90426d?r=recipes/beefrecipes&c=ed77f9a0-ff56-40d0-b903-b24e86c38152/Beef%20recipes",
"http://www.taste.com.au/recipes/pappardelle-pumpkin-bacon-torn-bread/2318e227-1dc9-463f-94ee-e4c0ddf0778f?r=recipes/pastarecipes&c=9a361b5c-6b07-48cb-ba64-399b8627268c/Pasta%20recipes"]

#scraping title
def get_recipe_title(url)
  page = HTTParty.get(url)
  parse_page = Nokogiri::HTML(page)
  title = parse_page.css("h1")
  title_of_recipe = title.text
  puts title_of_recipe
end

# search for recipes
puts "Let me have a look at some recipes you can cook up tonight!"
puts ""
puts "Would you like?"
i = 0
while i < recipe_list.count
  print i + 1
  print ". "
  get_recipe_title(recipe_list[i])
  i += 1
end

# get input on which recipe user would like
choice = gets.chomp
choice_index = choice.to_i - 1
puts "Great choice!"

#comparing lists of recipe and fridge
need = []
got = []

#scraping ingredients into a list
def get_recipe_ingredient_list(url, ingredients, a, need, got)
  page = HTTParty.get(url)
  parse_page = Nokogiri::HTML(page)
  scraped_ingredient = []
  parse_page.css(".ingredient-description").map do |a|
    ing = a.text
    scraped_ingredient.push(ing)
  end

  for i in scraped_ingredient
    j = 0
    while j < a
      if i.downcase.include?(ingredients[j].downcase) == false
        need.push(i)
        j += 1
      else
        got.push(i)
        j += 1
      end
    end
  end
end

get_recipe_ingredient_list(recipe_list[choice_index], ingredients, a, need, got)
got.uniq
unique_list = need.uniq - got

#print info to screen.

puts "It looks like you already have:", got
puts ""
puts "So now you need to pick up:", unique_list
