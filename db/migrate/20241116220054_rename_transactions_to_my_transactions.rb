class RenameTransactionsToMyTransactions < ActiveRecord::Migration[7.2]
  def change
    rename_table :transactions, :my_transactions
  end
end
