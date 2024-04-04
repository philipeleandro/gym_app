# frozen_string_literal: true

class RemoveStatusIdFromMuscleExercise < ActiveRecord::Migration[7.1]
  def change
    remove_column :muscle_exercises, :status_id, :integer
  end
end
