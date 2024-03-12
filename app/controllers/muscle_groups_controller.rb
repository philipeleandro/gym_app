# frozen_string_literal: true

class MuscleGroupsController < ApplicationController
  before_action :find_traning_plan, only: [:user_muscle_group_list]

  def user_muscle_group_list
    @muscle_groups = @training_plan.muscle_groups
  end

  private

  def muscle_group_params
    params.require(:muscle_group).permit(:name, :day, :training_plan_id)
  end

  def find_traning_plan
    @training_plan = TrainingPlan.find(params[:training_plans_id])
  end
end
