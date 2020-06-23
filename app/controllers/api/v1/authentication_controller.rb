class Api::V1::AuthenticationController < Api::ApplicationController

  skip_before_action :authenticate_request

  def create

    command = AuthenticateUser.call(
        params[:email],
        params[:password]
    )

    if command.success?
      json_response( { auth_token: command.result }, :ok)

    else
      json_response( { error: command.errors }, :unauthorized)
    end
  end
end