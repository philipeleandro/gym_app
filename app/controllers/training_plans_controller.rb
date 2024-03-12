# frozen_string_literal: true

class TrainingPlansController < ApplicationController
  before_action :find_user, only: [:user_plans_list]

  def user_plans_list
    @training_plans = @user.training_plans
  end

  def new
    @training_plan = TrainingPlan.new
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
