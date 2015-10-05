class UserSerializer < ActiveModel::Serializer
  attributes :id, :image, :name
  has_many :ideas
  has_many :comments
  has_many :votes
end
