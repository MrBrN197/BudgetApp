# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

mark = User.create!(name: 'dave', email: 'dave@test.com', password: 'dave123')

entertainment = mark.categories.create!(name: 'Entertainment', icon: 'tv')
record = mark.records.create!(name: 'McDonalds', ammount: 3.79)

CategoryRecord.create!(category: entertainment, record: record)