class User < ActiveRecord::Base
  has_many :access_tokens, dependent: :destroy
  has_many :ideas

  validates :email, :name, presence: true

  def self.from_omniauth(access_token)
    data = access_token.info

    User.where(email: data[:email]).first_or_initialize.tap do |u|
      u.name      = data[:name]
      u.image     = data[:image]
      u.oauth_uid = access_info.uid
      u.save
    end
  end

  def access_token
    access_tokens.active.first
  end
end
