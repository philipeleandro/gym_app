# frozen_string_literal: true

class User < ApplicationRecord
  has_many :training_plans, dependent: :destroy

  validates :name, presence: true
end
