class AddStatusToExercise < ActiveRecord::Migration[7.1]
  def up
    add_column :exercises, :status_id, :integer
  end

  def down
    remove_column :exercises, :status_id
  end
end
