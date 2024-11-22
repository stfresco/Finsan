class AddMyTransactionTypeToMytransaction < ActiveRecord::Migration[7.2]
  def change
    add_column :my_transactions, :mytransaction_type, :string
  end
end
