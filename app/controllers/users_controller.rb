# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'Usuário cadastrado com sucesso!'
    else
      flash.now[:alert] = 'Erro ao cadastrar usuário'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to users_path, notice: 'Usuário deletado com sucesso!'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
