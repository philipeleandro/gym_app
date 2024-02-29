class Muscle < ApplicationRecord
  belongs_to :muscle_group

  validates :name, presence: :true
end
