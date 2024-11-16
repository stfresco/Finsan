class CreateGoals < ActiveRecord::Migration[7.2]
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.string :status
      t.date :start_date
      t.date :finish_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
