class AddReferencesToMilestoneTransactions < ActiveRecord::Migration[7.2]
  def change
    add_reference :milestone_transactions, :my_transaction, null: false, foreign_key: true
  end
end
