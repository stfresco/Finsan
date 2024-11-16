class CreateMilestoneTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :milestone_transactions do |t|
      t.references :milestone, null: false, foreign_key: true
      t.references :transactions, null: false, foreign_key: true

      t.timestamps
    end
  end
end
