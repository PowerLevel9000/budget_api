class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { user:, massage: 'user created successfuly' }, status: :created
    else
      render json: { error: user.errors, massage: 'Somthing went Wrong' }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(name: params[:name])
    if user
      render json: { user:, message: 'Login successful' }
    else
      render json: { error: 'Invalid username' }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: { user:, massage: 'user updated successfuly' }, status: :created
    else
      render json: { error: user.errors, massage: 'Somthing went Wrong' }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { massage: 'Account has been deleted see you soon' }, status: :created
    else
      render json: { error: user.errors, massage: 'Somthing went Wrong' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
