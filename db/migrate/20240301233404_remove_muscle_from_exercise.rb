# frozen_string_literal: true

class RemoveMuscleFromExercise < ActiveRecord::Migration[7.1]
  def change
    remove_reference :exercises, :muscle, null: false, foreign_key: true
  end
end
