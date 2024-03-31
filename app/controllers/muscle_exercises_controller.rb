# frozen_string_literal: true

class MuscleExercisesController < ApplicationController
  def new
    @muscle_exercise = MuscleExercise.new
  end

  def create
    @muscle_exercise = MuscleExercise.new(muscle_exercise_params)

    begin
      response = ::MuscleExercises::Create.new(muscle_exercise_params, exercise_group_params).run!
      redirect_to user_muscle_group_list_path(response[:training_plan_id]),
                  notice: 'Exercício adicionado a ficha com sucesso!'
    rescue => e
      flash.now[:alert] = e.message
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @training_plan = find_training_plan(params[:muscle_group_id])
    @muscle_exercise = MuscleExercise.find(params[:id])

    @muscle_exercise.destroy
    redirect_to user_muscle_group_list_path(@training_plan.id), notice: 'Exercício deletado com sucesso!'
  end

  private

  def permmited_params
    params.require(:muscle_exercise).permit(:exercise_id, :set, :observation, :repetition, :muscle_exercise_id,
                                            exercise_group: [:muscle_group_id])
  end

  def muscle_exercise_params
    permmited_params.except(:exercise_group)
  end

  def exercise_group_params
    parse_params(permmited_params, :exercise_group)
  end
end
