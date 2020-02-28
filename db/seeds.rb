# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding the db with a few drinks..."

# Ingredient.create(name: 'vodka')
# Ingredient.create(name: 'tomato juice')
# Ingredient.create(name: 'mint leaves')
# Cocktail.create(name: 'Mohito')
# Cocktail.create(name: 'Bloody Marry')
# Cocktail.create(name: 'Margarita')
# Dose.create(description: '6 leaves', cocktail_id: 1, ingredient_id: 3)
# Dose.create(description: '90ml', cocktail_id: 2, ingredient_id: 2)
# Dose.create(description: '30ml', cocktail_id: 2, ingredient_id: 1)
require 'open-uri'
("a".."z").each do |letter|
  url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{letter}"
  puts "getting #{letter}"
  response = open(url).read
  cocktail_repo = JSON.parse(response)
  cocktails = cocktail_repo["drinks"]
  next if cocktails.nil?
  cocktails = cocktail_repo["drinks"].sample(1)
  cocktails.each do |cocktail|
    new_cocktail = Cocktail.new(name: cocktail['strDrink'])
    file = URI.open(cocktail['strDrinkThumb'])
    new_cocktail.photo.attach(io:file, filename: "#{new_cocktail.name}.jpg", content_type: 'image/jpg')
    new_cocktail.save
    i = 1
    loop do
      ingredient_name = cocktail["strIngredient#{i}"]
      ingredient_description = cocktail["strMeasure#{i}"]
      break if ingredient_name == nil
      new_ingredient = Ingredient.find_or_create_by(name: ingredient_name)
      Dose.create(cocktail: new_cocktail, ingredient: new_ingredient, description: ingredient_description)
      i += 1
      end
    end
  end

puts "...done!"