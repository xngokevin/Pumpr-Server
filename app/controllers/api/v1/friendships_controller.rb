class Api::V1::FriendshipsController < Api::ApplicationController


  def index
    render json: @current_user.friends,
           status: :ok
  end

  def blocked_friends
    # render json: @current_user.blocked_friends,
    #        status: :ok

    json_response(@current_user.blocked_friends, :ok)
  end

  def send_request

    requested_user = User.find_by_id(params[:id])
    if requested_user
      @current_user.friend_request(requested_user)
      render json: @current_user.pending_friends,
             status: :ok
    else
      render json: {  error: "User does not exist" },
             status: :not_found
    end

  end

  def decline_request

    requested_user = User.find_by_id(params[:id])
    if requested_user
      @current_user.decline_request(requested_user)
      render json: @current_user.friends,
             status: :ok
    else
      render json: {  error: "User does not exist" },
             status: :not_found
    end

  end


  def accept_request

    requested_user = User.find_by_id(params[:id])
    if requested_user
      @current_user.accept_request(requested_user)
      render json: @current_user.friends,
             status: :ok
    else
      render json: {  error: "User does not exist" },
             status: :not_found
    end
  end

  def remove_friend
    requested_user = User.find_by_id(params[:id])
    if requested_user
      @current_user.remove_friend(requested_user)
      render json: @current_user.friends,
             status: :ok
    else
      render json: {  error: "User does not exist" },
             status: :not_found
    end
  end

  def block_friend
    requested_user = User.find_by_id(params[:id])
    if requested_user
      @current_user.friend_request(requested_user)
      @current_user.block_friend(requested_user)
      render json: @current_user.blocked_friends,
             status: :ok
    else
      render json: {  error: "User does not exist" },
             status: :not_found
    end
  end


  def unblock_friend
    requested_user = User.find_by_id(params[:id])
    if requested_user
      @current_user.unblock_friend(requested_user)
      render json: @current_user.blocked_friends,
             status: :ok
    else
      render json: {  error: "User does not exist" },
             status: :not_found
    end
  end
end
