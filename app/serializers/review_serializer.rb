class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :user_id, :snack_id, :username, :snackname
  belongs_to :user
  belongs_to :snack

  def username
    object.user.username
  end 

  def snackname
    object.snack.name
  end 
end
