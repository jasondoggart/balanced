# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

budget = Budget.create(name: "Doggart Budget")

income = budget.categories.create(name: "Income")
expenses = budget.categories.create(name: "Expenses")

pay1 = income.line_items.create(name: "Pay Number 1")
pay2 = income.line_items.create(name: "Pay Number 2")

groceries = expenses.line_items.create(name: "Groceries")

mortgage = expenses.line_items.create(name: "Mortgage")
