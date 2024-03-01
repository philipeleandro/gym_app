# frozen_string_literal: true

class MuscleGroup < ApplicationRecord
  has_many :muscles

  belongs_to :training_plan

  validates :name, presence: true
end
