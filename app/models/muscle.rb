# frozen_string_literal: true

class Muscle < ApplicationRecord
  has_many :muscle_exercises

  belongs_to :muscle_group

  validates :name, presence: true, uniqueness: true
end
