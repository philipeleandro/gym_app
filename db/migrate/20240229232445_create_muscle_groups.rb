class CreateMuscleGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :muscle_groups do |t|
      t.string :name
      t.string :day
      t.references :training_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
