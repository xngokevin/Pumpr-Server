class User < ApplicationRecord
  # has_secure_password

  has_friendship

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone_number
  validates_presence_of :email, uniqueness: { case_sensitive: false }
  validates :password, :length => { :minimum => 5 }, allow_nil: true

  has_many_attached :photos, dependent: :destroy
  validates :photos, length: { minimum: 0, maximum: 6 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
