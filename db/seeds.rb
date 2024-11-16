# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user1 = User.create!(
  name: "Juan",
  last_name: "Pérez",
  email: "user@example.com",
  password: "password123",
  phone: "123456789"
)

account1 = Account.create!(bank: "Banco A", account_type: "Checking", user_id: user1.id, currency: "USD")

Balance.create!(account_id: account1.id, total_amount: 1000, status: "active")

transaction1 = Transaction.create!(
  category: "Groceries",
  amount: 150,
  date: Date.today,
  method: "Credit Card",
  description: "Compra de alimentos",
  account_id: account1.id
)

transaction2 = Transaction.create!(
  category: "Rent",
  amount: 800,
  date: Date.today - 5,
  method: "Bank Transfer",
  description: "Pago de alquiler",
  account_id: account1.id
)

goal1 = Goal.create!(
  title: "Viaje a Europa",
  description: "Ahorrar para un viaje de vacaciones",
  status: "in_progress",
  start_date: Date.today,
  finish_date: Date.today + 6.months,
  user_id: user1.id
)

milestone1 = Milestone.create!(goal_id: goal1.id, amount: 500)

MilestoneTransaction.create!(milestones_id: milestone1.id, transactions_id: transaction1.id)
MilestoneTransaction.create!(milestones_id: milestone1.id, transactions_id: transaction2.id)
