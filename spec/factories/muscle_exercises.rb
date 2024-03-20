# frozen_string_literal: true

FactoryBot.define do
  factory :muscle_exercise do
    repetition { 1 }
    set { 1 }
    observation { 'MyString' }
    status_id { 1 }
    exercise { nil }
  end
end
