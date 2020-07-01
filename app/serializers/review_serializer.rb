class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :user_id, :username
  belongs_to :user
  belongs_to :snack

  def username
    object.user.username
  end 
end
