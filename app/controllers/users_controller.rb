class UsersController < ApplicationController

  def create
    user = user_builder.build

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: user
  end

  def update
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_builder
    @user_builder ||= Builders::User.new(user_params.to_h)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
