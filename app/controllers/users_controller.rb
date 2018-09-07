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
  end

  def update
  end

  private

  def user_builder
    @user_builder ||= Builders::User.new(create_user_params.to_h)
  end

  def create_user_params
    params.require(:user).permit(:name, :email)
  end
end
