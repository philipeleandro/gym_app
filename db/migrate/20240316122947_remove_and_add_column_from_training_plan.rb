# frozen_string_literal: true

class RemoveAndAddColumnFromTrainingPlan < ActiveRecord::Migration[7.1]
  def change
    add_column :muscle_exercises, :status_id, :integer
  end
end
