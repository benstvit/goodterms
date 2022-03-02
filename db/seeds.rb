require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Loan.destroy_all
Item.destroy_all

val = User.new(email: 'val@val.com', password: 'valval', first_name: 'Valentine', last_name: 'Bodart', location: 'Brussels')
henry = User.new(email: 'henry@henry.com', password: 'henryhenry', first_name: 'Henry', last_name: 'BlackBurn', location: 'Brussels')
ben = User.new(email: 'ben@ben.com', password: 'henryhenry', first_name: 'Benjamin', last_name: 'Saint Viteux', location: 'Brussels')
val.save!
henry.save!
ben.save!

# item = Item.new(item_name: 'Raclette Machine', description: 'Perfect state', img_url: 'https://m.media-amazon.com/images/I/81lhDunJDdL._AC_SX425_.jpg'),
# loans = [
#   { loan_date: Date.today,
#     return_date: Date.today + 5 },
#   { loan_date: Date.today,
#     return_date: Date.today + 5 },
#   { loan_date: Date.today,
#     return_date: Date.today + 5 },
#   { loan_date: Date.today,
#     return_date: Date.today + 5 }
# ]

# loans.each do |loan|
#   Loan.new(loan)
#   loan.item = item
# end
10.times do
 item = Item.new(item_name: Faker::Book.title, description: "A #{Faker::Book.genre} book", user: User.all.sample)
 item.save!
end

puts 'Done!'
