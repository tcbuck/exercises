shoppingList = [
  "chips",
  "coke",
  "cheddar",
  "brie",
  "water", alcohol = [
    "Tooheys Old",
    "Rum",
    "Gin",
    "Tequila"
  ]
]

chosenCheese = shoppingList[2]
listCount = (shoppingList.length + alcohol.length) - 1

puts "My chosen cheese is #{chosenCheese}"

puts "Your shopping list has #{listCount} items in it"

puts "What would you like to add to the list"
last = gets.chomp
shoppingList.push(last)
print shoppingList
