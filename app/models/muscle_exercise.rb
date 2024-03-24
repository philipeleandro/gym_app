# frozen_string_literal: true

class MuscleExercise < ApplicationRecord
  has_many :exercise_group, dependent: :destroy

  belongs_to :exercise
  accepts_nested_attributes_for :exercise_group

  validates :set, :repetition, presence: true
end
