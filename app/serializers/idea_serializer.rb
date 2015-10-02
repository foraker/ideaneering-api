class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_one :user
  has_many :comments
  has_many :votes
end
