class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :last_name, :phone_number, :photos


  def photos
    self.object.photos.map do | photo |
      {
          id: photo.id,
          filename: photo.filename,
          content_type: photo.content_type,
          created_at: photo.created_at,
          small_image: rails_representation_url(photo.variant(resize: "150x150").processed, only_path: true),
          medium_image: rails_representation_url(photo.variant(resize: "400x400").processed, only_path: true),
          large_image: rails_blob_path(photo, only_path: true)
      }
    end
  end
end
