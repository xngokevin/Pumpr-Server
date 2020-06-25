class Api::V1::PhotosController < Api::ApplicationController
  def create

    @current_user.photos.attach(params[:image])

    if @current_user.errors
      json_response @current_user.errors, :bad_request
    else
      json_response UserSerializer.new(@current_user).photos, :ok
    end
  end

  def show
    json_response UserSerializer.new(@current_user).photos, :ok
  end

  def update

  end

  def destroy

    photo = @current_user.photos.find(params[:id].to_i)
    if photo
      photo.purge
    end
    json_response UserSerializer.new(@current_user).photos, :ok
  end

end
