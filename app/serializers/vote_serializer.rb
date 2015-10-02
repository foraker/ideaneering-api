class VoteSerializer < ActiveModel::Serializer
  attributes :id
  has_one :idea
  has_one :user
end
