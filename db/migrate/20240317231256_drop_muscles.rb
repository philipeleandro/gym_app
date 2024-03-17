class DropMuscles < ActiveRecord::Migration[7.1]
  def change
    remove_column :muscle_exercises, :muscle_id
    drop_table :muscles
  end
end
