class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :snacks, through: :reviews

  validates :name, presence: true
  validates :username, uniqueness: true, presence: true
  validates :profile_photo, format: { with: /\.(png|jpg)\Z/i, message: "URL is invalid, please try again" } 

end
