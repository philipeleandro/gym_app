FactoryBot.define do
  factory :exercise do
    name { "MyString" }
    repetition { 1 }
    set { 1 }
    observation { "MyString" }
    muscle { nil }
  end
end
