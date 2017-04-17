class UsersController < ApplicationController
  def index
    render text: "I'm in the index action!"
  end

  def create
    render json: params
  end
end
