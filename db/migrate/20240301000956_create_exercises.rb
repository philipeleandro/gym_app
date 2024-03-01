# frozen_string_literal: true

class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :repetition
      t.integer :set
      t.string :observation
      t.references :muscle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
