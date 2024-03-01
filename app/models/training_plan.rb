# frozen_string_literal: true

class TrainingPlan < ApplicationRecord
  has_many :muscle_groups, dependent: :destroy

  belongs_to :user

  validates :name, :user, presence: true
end
