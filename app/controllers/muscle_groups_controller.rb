# frozen_string_literal: true

class MuscleGroupsController < ApplicationController
  before_action :find_traning_plan, only: %i[user_muscle_group_list create destroy]

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
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    ::MuscleGroups::Destroy.new(params[:muscle_group_id]).run!
    redirect_to user_muscle_group_list_path(@training_plan), notice: 'Grupo muscular excluído com sucesso!'
  rescue => e
    redirect_to user_muscle_group_list_path(@training_plan), alert: e.message
  end

  private

  def muscle_group_params
    params.permit(:name, :training_plan_id)
  end

  def find_traning_plan
    @training_plan = TrainingPlan.find(params[:training_plan_id])
  end
end
