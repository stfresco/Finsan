class CreateAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :accounts do |t|
      t.string :bank
      t.string :account_type
      t.references :user, null: false, foreign_key: true
    
      t.timestamps
    end
  end
end
