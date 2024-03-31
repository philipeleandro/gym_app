# frozen_string_literal: true

class AddRenameStatusIdInExercise < ActiveRecord::Migration[7.1]
  def self.up
    rename_column :exercises, :status_id, :muscle_id
  end

  def self.down
    rename_column :exercises, :muscle_id, :status_id
  end
end
