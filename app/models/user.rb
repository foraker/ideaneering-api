class User < ActiveRecord::Base
  has_many :access_tokens, dependent: :destroy
  has_many :ideas
  has_many :comments
  has_many :votes

  validates :email, :name, presence: true

  def self.find_or_create_from_oauth(data)
    User.where(email: data[:email]).first_or_initialize.tap do |u|
      u.name      = data[:name]
      u.image     = data[:picture]
      u.oauth_uid = data[:id]
      u.save
    end
  end

  def access_token
    access_tokens.active.first
  end
end
