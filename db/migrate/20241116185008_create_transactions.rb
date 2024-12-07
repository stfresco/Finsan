class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.string :category
      t.float :amount
      t.date :date
      t.string :method
      t.text :description
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
