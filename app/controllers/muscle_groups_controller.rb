# frozen_string_literal: true

class MuscleGroupsController < ApplicationController
  before_action :find_traning_plan, only: [:user_muscle_group_list, :create]

  def user_muscle_group_list
    @muscle_groups = @training_plan.muscle_groups
  end

  def new
    @muscle_group = MuscleGroup.new
  end

  def create
    @muscle_group = MuscleGroup.new(muscle_group_params)

    if @muscle_group.save
      redirect_to user_muscle_group_list_path(@training_plan), notice: 'Grupo muscular criado com sucesso!'
    else
      flash.now[:alert] = 'Erro ao cadastrar grupo muscular!'
      render :new
    end
  end

  private

  def muscle_group_params
    params.permit(:name, :day, :training_plan_id)
  end

  def find_traning_plan
    @training_plan = TrainingPlan.find(params[:training_plan_id])
  end
end
