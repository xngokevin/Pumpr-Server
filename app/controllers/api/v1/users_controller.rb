class Api::V1::UsersController < ActionController::API
  def index
    users = User.all
    render json: users.to_json, status: :ok
  end

  def show
  end

  def create
  end

  def delete
  end
end
