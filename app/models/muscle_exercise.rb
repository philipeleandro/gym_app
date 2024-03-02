# frozen_string_literal: true

class MuscleExercise < ApplicationRecord
  belongs_to :muscle
  belongs_to :exercise

  validates :set, :repetition, presence: true
end
