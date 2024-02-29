class MuscleGroup < ApplicationRecord
  belongs_to :training_plan

  validates :name, presence: :true
end
