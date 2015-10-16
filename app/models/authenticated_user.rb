require 'google/api_client'

class AuthenticatedUser
  attr_accessor :user

  def initialize(authorization_code)
    @authorization_code = authorization_code
  end

  def perform
    override_ssl_cert

    find_or_create_user
  end

  def success?
    user.present? && user.persisted?
  end

  private

  def override_ssl_cert
    ENV['SSL_CERT_FILE'] = Rails.root.join('config', 'cacert.pem').to_s
  end

  def find_or_create_user
    User.find_or_create_from_oauth(user_data)
  end

  def user_data
    fetched_user_data(token['access_token'])
  end

  def token
    google_client.authorization.fetch_access_token!
  end

  # Giving up on using API here. Must be better way, but this works.
  # Returns hash with:
  #   id, email, verified_email, name, given_name, family_name, link, picture,
  #   gender, hd
  def fetched_user_data(token)
    JSON.parse(URI.parse(
      "https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=#{token}"
    ).read).with_indifferent_access
  end

  def google_client
    @google_client ||= Google::APIClient.new(
      application_name: 'Ideanearing - Rails API',
      application_version: 1
    ).tap do |client|
      client.authorization.client_id     = ENV['GOOGLE_CLIENT_ID']
      client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
      client.authorization.grant_type    = 'authorization_code'
      client.authorization.code          = @authorization_code
      client.authorization.redirect_uri  = 'http://localhost:4200'
      client.authorization.scope         = 'userinfo.email,userinfo.profile'
    end
  end

end
