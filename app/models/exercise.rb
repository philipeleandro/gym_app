# frozen_string_literal: true

class Exercise < ApplicationRecord
  enum muscle_id: { 'Peito' => 1,
                    'Costas' => 2,
                    'Bíceps' => 3,
                    'Tríceps' => 4,
                    'Trapézio' => 5,
                    'Ombro' => 6,
                    'Glúteo' => 7,
                    'Abdômen' => 8,
                    'Perna' => 9 }

  has_many :muscle_exercises, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :exercises_by_muscle, ->(muscle_id) { where('muscle_id = ?', muscle_id) }
end
