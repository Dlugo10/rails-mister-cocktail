# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts 'Cleaning DB'
Ingredient.destroy_all

puts 'Populating DB'

filepath = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

drinks_list= open(filepath).read
drinks = JSON.parse(drinks_list)

drinks["drinks"].each do |drink|
  drink_name = drink["strIngredient1"]
  new_ingredient = Ingredient.create(name: drink_name)

  puts "#{new_ingredient.name} created"
end


Cocktail.create(name: 'Pisco')
