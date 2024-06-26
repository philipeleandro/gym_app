# frozen_string_literal: true

module MuscleGroups
  class Destroy
    attr_accessor :muscle_group_id

    def initialize(muscle_group_id)
      @muscle_group_id = muscle_group_id
    end

    def run!
      ActiveRecord::Base.transaction do
        begin
          muscle_exercises.destroy_all
          exercise_groups.delete_all
          muscle_group.delete
        rescue => e
          raise StandardError.new, e.message
        end
      rescue => e
        raise StandardError.new, e.message
      end
    end

    private

    def muscle_group
      MuscleGroup.find(muscle_group_id)
    end

    def exercise_groups
      ExerciseGroup.where(muscle_group_id: muscle_group_id)
    end

    def muscle_exercises
      MuscleExercise.joins(:exercise_group).where(exercise_group: { id: [exercise_groups.pluck(:id)] })
    end
  end
end
