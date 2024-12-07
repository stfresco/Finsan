class CreateBalances < ActiveRecord::Migration[7.2]
  def change
    create_table :balances do |t|
      t.float :total_amount
      t.boolean :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
