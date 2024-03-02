class ExerciseGroup < ApplicationRecord
  belongs_to :muscle_exercise
  belongs_to :muscle_group
end
