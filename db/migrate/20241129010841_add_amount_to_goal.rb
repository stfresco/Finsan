class AddAmountToGoal < ActiveRecord::Migration[7.2]
  def change
    add_column :goals, :amount, :float
  end
end
