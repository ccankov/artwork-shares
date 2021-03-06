class UsersController < ApplicationController
  def index
    if(params[:query])
      users = User.where('username like ?', params[:query].to_s)
    else
      users = User.all
    end
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to user_url(user)
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :query)
  end
end
