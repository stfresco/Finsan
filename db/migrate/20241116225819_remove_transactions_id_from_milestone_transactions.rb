class RemoveTransactionsIdFromMilestoneTransactions < ActiveRecord::Migration[7.2]
  def change
    remove_column :milestone_transactions, :transactions_id
  end
end
