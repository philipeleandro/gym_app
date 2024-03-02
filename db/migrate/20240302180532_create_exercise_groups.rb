class CreateExerciseGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_groups do |t|
      t.references :muscle_exercise, null: false, foreign_key: true
      t.references :muscle_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
