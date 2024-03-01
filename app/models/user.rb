# frozen_string_literal: true

class User < ApplicationRecord
  has_many :training_plans

  validates :name, presence: true
end
