# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Reseteamos las secuencias a 1

puts "Eliminando MilestoneTransaction"
MilestoneTransaction.destroy_all
puts "Milestone"
Milestone.destroy_all
puts "Eliminando Mytransaction"
MyTransaction.destroy_all
puts "Eliminando goal"
Goal.destroy_all
puts "Eliminando Balance"
Balance.destroy_all
puts "Eliminando Account"
Account.destroy_all
puts "Eliminando Users"
User.destroy_all

ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.reset_pk_sequence!(table)
end

user1 = User.create!(
  name: "Juan",
  last_name: "Pérez",
  email: "user@example.com",
  password: "password123",
  phone: "123456789",
  date_birth: Date.new(1987, 6, 13)
)

account1 = Account.create!(
  bank: "BANCO A",
  account_type: "Checking",
  user_id: user1.id,
  currency: "USD"
)

# Balance.create!(
#   account_id: account1.id,
#   total_amount: 1000,
#   status: "active"
# )
mytransaction1 = MyTransaction.create!(
  category: "Sueldo",
  amount: 3000,
  date: Date.today,
  method: "Credit Card",
  description: "Sueldo del mes",
  account_id: account1.id,
  mytransaction_type: "Ingreso"
)

mytransaction2 = MyTransaction.create!(
  category: "Groceries",
  amount: 2300,
  date: Date.today,
  method: "Credit Card",
  description: "Compra de alimentos",
  account_id: account1.id,
  mytransaction_type: "Egreso"
)

mytransaction3 = MyTransaction.create!(
  category: "Rent",
  amount: 300,
  date: Date.today - 5,
  method: "Bank Transfer",
  description: "Pago de alquiler",
  account_id: account1.id,
  mytransaction_type: "Egreso"
)

goal1 = Goal.create!(
  title: "Viaje a Europa",
  description: "Ahorrar para un viaje de vacaciones",
  status: "in_progress",
  start_date: Date.today,
  finish_date: Date.today + 6.months,
  amount: 10_000,
  user_id: user1.id
)

# milestone1 = Milestone.create!(
#   goal_id: goal1.id,
#   amount: 500
# )

# MilestoneTransaction.create!(
#   milestone_id: milestone1.id,
#   my_transaction_id: mytransaction1.id
# )

# MilestoneTransaction.create!(
#   milestone_id: milestone1.id,
#   my_transaction_id: mytransaction2.id
# )
