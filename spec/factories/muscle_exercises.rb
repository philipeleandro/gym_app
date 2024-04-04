# frozen_string_literal: true

FactoryBot.define do
  factory :muscle_exercise do
    repetition { 1 }
    set { 1 }
    observation { 'MyString' }
    exercise { nil }
  end
end
