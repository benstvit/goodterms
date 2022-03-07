
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
Loan.destroy_all
Item.destroy_all
User.destroy_all

# val = User.new(email: 'val@val.com', password: 'valval', first_name: 'Valentine', last_name: 'Bodart', location: 'Brussels', photo: 'data:image/jpeg;base64,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')
# henry = User.new(email: 'henry@henry.com', password: 'henryhenry', first_name: 'Henry', last_name: 'BlackBurn', location: 'Brussels', photo: 'data:image/jpeg;base64,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')
# ben = User.new(email: 'ben@ben.com', password: 'henryhenry', first_name: 'Benjamin', last_name: 'Saint Viteux', location: 'Brussels', photo: 'data:image/jpeg;base64,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')
# val.save!
# henry.save!
# ben.save!

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
# 10.times do
#  item = Item.new(item_name: Faker::Book.title, description: "A #{Faker::Book.genre} book", user: User.all.sample)
#  item.save!
# end


# puts 'Done!'
