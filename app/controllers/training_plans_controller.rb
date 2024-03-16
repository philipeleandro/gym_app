# frozen_string_literal: true

class TrainingPlansController < ApplicationController
  before_action :find_user, only: [:user_plans_list]

  def user_plans_list
    @training_plans = @user.training_plans
  end

  def new
    @training_plan = TrainingPlan.new
  end

  def edit
    @training_plan = TrainingPlan.find_by(user_id: params[:user_id], id: params[:id])
  end

  def update
    @training_plan = TrainingPlan.find_by(user_id: params[:user_id], id: params[:id])

    if @training_plan.update(training_plan_params)
      redirect_to user_training_plans_path(params[:user_id]), notice: 'Ficha atualizada com sucesso!'
    else
      flash.now[:alert] = 'Erro ao atualizar a ficha!'
      render :edit, status: :unprocessable_entity
    end
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

  def destroy
    @training_plan = TrainingPlan.find(params[:id])

    @training_plan.destroy
    redirect_to users_path, notice: 'Ficha deletada com sucesso!'
  end

  private

  def training_plan_params
    params.permit(:name, :user_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
