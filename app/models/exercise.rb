# frozen_string_literal: true

class Exercise < ApplicationRecord
  has_many :muscles, dependent: :destroy

  belongs_to :muscle

  validates :name, :repetition, :set, presence: true
end
