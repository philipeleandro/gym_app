# frozen_string_literal: true

module ExerciseHelper
  def exercices_by_muscle(muscle_id)
    Exercise.exercises_by_muscle(muscle_id)
  end

  def separate_by_muscle
    ordered_muscles = []

    Exercise.muscle_ids.each do |_muscle_name, muscle_id|
      ordered_muscles << " -> #{Exercise.muscle_ids.key(muscle_id).upcase} "

      Exercise.where(muscle_id: muscle_id).each do |exercise|
        exercises_attributes = exercise.attributes.with_indifferent_access
        ordered_muscles << [exercises_attributes[:name], exercises_attributes[:id]]
      end
    end

    ordered_muscles
  end
end
