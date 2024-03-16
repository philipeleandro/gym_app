class AddStatusToMuscle < ActiveRecord::Migration[7.1]
  def up
    add_column :muscles, :status_id, :integer
  end

  def down
    remove_column :muscles, :status_id
  end
end
