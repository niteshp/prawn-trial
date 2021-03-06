# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

order = Order.create!(order_number: "24601")
order.line_items.create!(name: "Settlers of Catan", unit_price: 29.95, quantity: 1)
order.line_items.create!(name: "Technodrome", unit_price: 24.99, quantity: 2)
order.line_items.create!(name: "RailsCasts Pro Subscription", unit_price: 9.00, quantity: 1)
order.line_items.create!(name: "Flux Capacitor", unit_price: 1955.00, quantity: 1)
order.line_items.create!(name: "TextMate 2", unit_price: 75.00, quantity: 3)