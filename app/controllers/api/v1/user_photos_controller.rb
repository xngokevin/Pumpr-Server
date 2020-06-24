class Api::V1::UserPhotosController < Api::ApplicationController
  def create
    puts user_params
    @current_user.photos.attach(params[:image])

    json_response @current_user, :ok
  end

  def show
    json_response rails_blob_url(@current_user.photos[0]), :ok
  end

  def update

  end

  def delete

  end


  private
  def user_params
    params.permit(
        :image
    )
  end
end
