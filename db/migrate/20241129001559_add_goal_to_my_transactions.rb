class AddGoalToMyTransactions < ActiveRecord::Migration[7.2]
  def change
    add_reference :my_transactions, :goal, null: true, foreign_key: true
  end
end
