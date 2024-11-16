# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = User.create([
  { name: 'Juan', last_name: 'Pérez', phone: '1234567890', date_birth: '1990-01-01' },
  { name: 'Ana', last_name: 'García', phone: '0987654321', date_birth: '1985-05-15' }
])

users.each do |user|
  Account.create([
    { bank: 'BBVA', account_type: 'Checking', user_id: user.id, currency: 'USD' },
    { bank: 'Santander', account_type: 'Savings', user_id: user.id, currency: 'EUR' }
  ])
end

accounts = Account.all
accounts.each do |account|
  Transaction.create([
    { category: 'Food', amount: 50.0, date: '2024-11-01', method: 'Credit Card', description: 'Grocery shopping', account_id: account.id },
    { category: 'Transport', amount: 20.0, date: '2024-11-05', method: 'Cash', description: 'Taxi ride', account_id: account.id }
  ])
end

users.each do |user|
  goal = Goal.create(
    title: 'Save for Vacation',
    description: 'Saving money for a summer vacation',
    status: 'Active',
    start_date: '2024-01-01',
    finish_date: '2024-06-30',
    user_id: user.id
  )

  Milestone.create([
    { goal_id: goal.id, amount: 200 },
    { goal_id: goal.id, amount: 300 }
  ])
end

milestones = Milestone.all
transactions = Transaction.all

milestones.each do |milestone|
  MilestoneTransaction.create(milestones_id: milestone.id, transactions_id: transactions.sample.id)
end
