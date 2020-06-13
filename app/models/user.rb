class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :snacks, through: :reviews

  validates :name, presence: true
  validates :username, uniqueness: true, presence: true
end
