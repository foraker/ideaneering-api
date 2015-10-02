class User < ActiveRecord::Base
  has_many :access_tokens, dependent: :destroy

  validates :email, presence: true
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }
  validates :username, presence: true

  def self.find_or_create_from_oauth(oauth)
    attributes = {
      email:     oauth.email,
      oauth_uid: oauth.id.to_s,
      name:      oauth.login
    }

    where(oauth_uid: attributes[:oauth_uid]).first_or_initialize.tap do |u|
      u.email = attributes[:email]
      u.name  = attributes[:name]
      u.save
    end
  end

  def self.from_omniauth(access_token)
    data = access_token.info

    User.where(email: data[:email]).create_with(
      name:      data[:name],
      image:     data[:image],
      oauth_uid: access_info.uid
    ).first_or_create
  end

  def access_token
    access_tokens.active.first
  end
end
