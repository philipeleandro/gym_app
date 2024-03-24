# frozen_string_literal: true

module MuscleGroupHelper
  def find_exercises(muscle_group_id)
    MuscleExercise.joins(:exercise_group)
                  .where(exercise_group: { muscle_group_id: muscle_group_id })
                  .order(:exercise_id)
  end
end
