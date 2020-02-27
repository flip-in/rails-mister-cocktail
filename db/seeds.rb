# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding the db with a few drinks..."

Ingredient.create(name: “vodka”)
Ingredient.create(name: “tomato juice”)
Ingredient.create(name: “mint leaves”)
Cocktail.create(name: “Mohito”)
Cocktail.create(name: “Bloody Marry”)
Cocktail.create(name: “Margarita”)
Dose.create(description: “6 leaves”, cocktail_id: 1, ingredient_id: 3)
Dose.create(description: “90ml”, cocktail_id: 2, ingredient_id: 2)
Dose.create(description: “30ml”, cocktail_id: 2, ingredient_id: 1)

puts "...done!"