# frozen_string_literal: true

class TrainingPlansController < ApplicationController
  before_action :find_user, only: [:user_plans_list]

  def user_plans_list
    @training_plans = @user.training_plans
  end

  def new
    @training_plan = TrainingPlan.new
  end

  def create
    @training_plan = TrainingPlan.new(training_plan_params)

    if @training_plan.save
      redirect_to user_training_plans_path(params[:user_id]), notice: 'Ficha criada com sucesso!'
    else
      flash.now[:alert] = 'Erro ao cadastrar a ficha!'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def training_plan_params
    params.permit(:name, :user_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
