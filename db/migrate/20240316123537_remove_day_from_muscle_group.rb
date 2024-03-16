# frozen_string_literal: true

class RemoveDayFromMuscleGroup < ActiveRecord::Migration[7.1]
  def change
    remove_column :muscle_groups, :day
  end
end
