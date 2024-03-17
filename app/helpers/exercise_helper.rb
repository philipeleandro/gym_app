# frozen_string_literal: true

module ExerciseHelper
  def exercices_by_muscle(muscle_id)
    Exercise.exercises_by_muscle(muscle_id)
  end
end
