class RemoveAndAddColumnFromTrainingPlan < ActiveRecord::Migration[7.1]
  def change
    remove_column :training_plans, :day
    add_column :muscle_exercises, :status_id, :integer
  end
end
