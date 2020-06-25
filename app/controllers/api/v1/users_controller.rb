class Api::V1::UsersController < Api::ApplicationController

  skip_before_action :authenticate_request, only: :create

  def index
    users = User.all
    render json: users.to_json, status: :ok
  end

  # Show user, check friendship
  def show
    user = User.find_by_id(params[:id])
    if user
      json_response(user, :ok)
    else
      json_response({error: "User not found"}, :not_found)
    end
  end

  def update

    @current_user.update(user_params)
    if @current_user.save
      json_response(@current_user, :ok)
    else
      json_response(@current_user.errors, :ok)
    end

  end

  def create

    user = User.new(user_params)
    if user.save
      command = AuthenticateUser(user.email, user.password).call
      auth_token = command.result

      response = {
          message: Message.account_created,
          auth_token: auth_token
      }

      json_response(response, :created)
    else
      json_response(user.errors, :bad_request)
    end
  end

  private

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :middle_name,
      :email,
      :password,
      :password_confirmation,
      :phone_number
    )
  end
end
