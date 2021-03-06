require 'elasticsearch/model'


class User < ApplicationRecord
  # has_secure_password
  include ActiveModel::Validations

  has_friendship

  has_one :profile_data, dependent: :destroy
  after_create :create_profile_data

  has_one_attached :profile_photo, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone_number
  validates_presence_of :email, uniqueness: { case_sensitive: false }
  validates :password, :length => { :minimum => 5 }, allow_nil: true
  validates :profile_photo, file_content_type: { allow: ['image/jpeg', 'image/png'] }
  validates :photos, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  private
  def create_profile_data
    ProfileData.create(user_id: self.id)
  end
end
