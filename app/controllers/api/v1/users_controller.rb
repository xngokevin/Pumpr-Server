class Api::V1::UsersController < Api::ApplicationController

  def index
    users = User.all
    render json: users.to_json, status: :ok
  end

  def show
  end

  def create
  end
end
