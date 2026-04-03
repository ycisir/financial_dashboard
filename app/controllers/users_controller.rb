class UsersController < ApplicationController
	before_action :require_admin
	before_action :set_user, only: %i[update change_status]
  
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: { message: "User updated successfully" }
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def change_status
    @user.status = @user.active? ? "inactive" : "active"
    if @user.save
      render json: { message: "User status updated successfully", status: @user.status }
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :role, :status)
  end
end
