# frozen_string_literal: true

class CreateTrainingPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :training_plans do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
