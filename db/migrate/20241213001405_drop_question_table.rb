class DropQuestionTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :questions
  end
end
