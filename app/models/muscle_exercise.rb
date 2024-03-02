# frozen_string_literal: true

class MuscleExercise < ApplicationRecord
  has_many :exercise_group

  belongs_to :muscle
  belongs_to :exercise

  validates :set, :repetition, presence: true
end
