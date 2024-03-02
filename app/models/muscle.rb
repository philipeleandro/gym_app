# frozen_string_literal: true

class Muscle < ApplicationRecord
  belongs_to :muscle_group

  validates :name, presence: true, uniqueness: true
end
