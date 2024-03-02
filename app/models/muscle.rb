# frozen_string_literal: true

class Muscle < ApplicationRecord
  has_many :muscle_exercises

  validates :name, presence: true, uniqueness: true
end
