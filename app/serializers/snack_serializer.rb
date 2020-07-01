class SnackSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :origin, :image, :categories
  has_many :reviews
  has_many :users
end
