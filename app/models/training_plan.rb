class TrainingPlan < ApplicationRecord
  has_many :muscle_groups

  belongs_to :user

  validates :name, :user, presence: true
end
