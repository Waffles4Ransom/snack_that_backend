class Snack < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, :description, :origin, :categories, presence: true
  
  scope :chrono_order, ->{order(:id)}

end
