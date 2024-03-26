module MuscleExercises
  class Create
    attr_accessor :exercise_group_params, :muscle_exercise_params

    def initialize(muscle_exercise_params = {}, exercise_group_params = {})
      @muscle_exercise_params = muscle_exercise_params
      @exercise_group_params = exercise_group_params
    end

    def run!
      begin
        parsed_response
      rescue => e
        raise StandardError.new "#{e.message} - Backtrace: #{e.backtrace[0..4]}"
      end
    end

    def creation_process!
      instanced_muscle_exercise = muscle_exercise
      instanced_exercise_group = exercise_group

      instanced_exercise_group.transaction do
        if instanced_muscle_exercise.save
          instanced_exercise_group.muscle_exercise_id = instanced_muscle_exercise.id

          instanced_muscle_exercise.transaction do
            raise StandardError.new 'Erro ao salvar ExerciseGroup' unless instanced_exercise_group.save
          rescue StandardError => e
            raise StandardError.new e.message
          end
        else
          raise StandardError.new 'Erro ao salvar MuscleExercise'
        end
      rescue StandardError => e
        raise StandardError.new e.message
      end

      true
    end

    def muscle_exercise
      MuscleExercise.new(muscle_exercise_params)
    end

    def exercise_group
      ExerciseGroup.new(exercise_group_params)
    end

    def training_plan
      MuscleGroup.find(exercise_group_params[:muscle_group_id]).training_plan
    end

    def parsed_response
      begin
        { success: creation_process!,
          training_plan_id: training_plan.id}
      rescue => e
        raise StandardError.new e.message
      end
    end
  end
end