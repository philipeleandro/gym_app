# frozen_string_literal: true

class CreateMuscleExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :muscle_exercises do |t|
      t.integer :repetition
      t.integer :set
      t.string :observation
      t.references :muscle, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
