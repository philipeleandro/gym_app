# frozen_string_literal: true

class RemoveMuscleGroupFromMuscle < ActiveRecord::Migration[7.1]
  def change
    remove_reference :muscles, :muscle_group, null: false, foreign_key: true
  end
end
