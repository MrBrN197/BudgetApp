# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

mike = User.create!(name: 'mike', email: 'mike@test.com', password: 'mike123')
dave = User.create!(name: 'dave', email: 'dave@test.com', password: 'dave123')

entertainment = mike.categories.create!(name: 'Entertainment', icon: 'tv')
shopping = dave.categories.create!(name: 'Shopping', icon: 'basket')
record = mike.records.create!(name: 'McDonalds', ammount: 3.79)

CategoriesRecord.create!(category: entertainment, record: record)