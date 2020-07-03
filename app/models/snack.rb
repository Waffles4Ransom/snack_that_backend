class Snack < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  validates :name, :description, :origin, :categories, presence: true
  validates :image, format: { with: /\.(png|jpg)\Z/i, message: "URL is invalid, please try again" } 
  
  scope :most_recent, ->{order(created_at: :desc)}

end
