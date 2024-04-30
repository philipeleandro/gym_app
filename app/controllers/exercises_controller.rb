# frozen_string_literal: true

class ExercisesController < ApplicationController
  before_action :convert_status_id_to_int, only: [:create]

  def list_muscles_and_exercises
    CreateUser.perfom_async

    @muscles = Exercise.muscle_ids
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercises_params)

    if @exercise.save
      redirect_to list_muscles_and_exercises_path, notice: 'Exercício criado com sucesso!'
    else
      flash.now[:alert] = 'Erro ao cadastrar exercício'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])

    @exercise.destroy
    redirect_to list_muscles_and_exercises_path, notice: 'Exercício deletado com sucesso!'
  end

  private

  def exercises_params
    params.require(:exercise).permit(:name, :muscle_id)
  end

  def convert_status_id_to_int
    status_id = params.require(:exercise)[:muscle_id]

    return if status_id.blank?

    params[:exercise][:muscle_id] = status_id.to_i
  end
end
