# frozen_string_literal: true

class RemoveColumnsRepetitionSetObservationFromExercise < ActiveRecord::Migration[7.1]
  def change
    remove_column :exercises, :repetition, :integer
    remove_column :exercises, :set, :integer
    remove_column :exercises, :observation, :string
  end
end
