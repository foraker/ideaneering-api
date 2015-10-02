Rails.application.config.middleware.use OmniAuth::Builder do
  unless ENV["GOOGLE_CLIENT_ID"] && ENV["GOOGLE_CLIENT_SECRET"]
    raise 'Please set ENV["GOOGLE_CLIENT_ID"] and ENV["GOOGLE_CLIENT_SECRET"]'
  end

  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
