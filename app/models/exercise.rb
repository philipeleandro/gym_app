# frozen_string_literal: true

class Exercise < ApplicationRecord
  enum status_id: { 'peito' => 1,
                    'costas' => 2,
                    'bíceps' => 3,
                    'tríceps' => 4,
                    'trapézio' => 5,
                    'ombro' => 6,
                    'glúteo' => 7,
                    'abdômen' => 8 }

  has_many :muscle_exercises, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :exercises_by_muscle, ->(muscle_id) { where('status_id = ?', muscle_id) }
end
