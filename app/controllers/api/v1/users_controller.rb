class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: %i[show update destroy]

  def index
    @users = User.select(:id, :name)
    render json: { users: @users }, status: :ok
  end

  def show
    render json: { user: @user }, status: :ok
  end

  def update
    if @user.update(user_params)
      render nothing: true, status: :ok
    else
      render json: { errors: @user.errors.full_message }, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.delete
      render nothing: true, status: :ok
    else
      render json: { errors: @user.errors.full_message }, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
