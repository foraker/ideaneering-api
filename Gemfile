source 'https://rubygems.org'

gem 'rails', github: "rails/rails"
gem 'sprockets-rails', github: "rails/sprockets-rails"
gem 'sprockets', github: "rails/sprockets"
gem 'sass-rails', github: "rails/sass-rails"
gem 'arel', github: "rails/arel"
gem 'rack', github: "rack/rack"
gem 'pg'
gem 'active_model_serializers', '~> 0.10.0.rc2'
gem 'rack-cors'
# Using fork since it supports rack2
gem 'omniauth', github: 'twalpole/omniauth', branch: 'rack_master'
gem 'omniauth-google-oauth2'
gem 'google-api-client'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
