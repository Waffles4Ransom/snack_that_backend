class Review < ApplicationRecord
  belongs_to :user
  belongs_to :snack

  validates :rating, :content, presence: true
end
