class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :location, :profile_photo, :created_at
  has_many :reviews
  has_many :snacks
end
