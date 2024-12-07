class CreateMilestones < ActiveRecord::Migration[7.2]
  def change
    create_table :milestones do |t|
      t.float :amount
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
