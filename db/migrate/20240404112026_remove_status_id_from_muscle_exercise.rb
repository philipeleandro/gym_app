class RemoveStatusIdFromMuscleExercise < ActiveRecord::Migration[7.1]
  def change
    remove_column :muscle_exercises, :status_id, :integer
  end
end
