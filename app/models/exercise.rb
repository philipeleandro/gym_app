# frozen_string_literal: true

class Exercise < ApplicationRecord
  has_many :muscle_exercises, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
