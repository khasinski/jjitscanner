source "https://rubygems.org"

ruby "3.1.2"

gem "dotenv-rails", require: "dotenv/rails-now"

gem "rails", github: "rails/rails", branch: "main"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.6"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

gem "fast_jsonparser"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem "sidekiq"
gem "faraday"

# Cron Jobs
gem "whenever", require: false

# Analytics panel
gem "blazer"

group :development, :test do
  gem "debug"
  gem "rspec-rails"
  gem "pry"
end

group :development do
  gem "rufo"
  gem "net-ssh", "7.0.0.beta1" # https://stackoverflow.com/questions/72068406/capistrano-fail-to-deploy-rails-app-due-to-incompatibility-with-openssl-3-0
  gem "capistrano", "~> 3.17", require: false
  gem "capistrano-rails", "~> 1.6", require: false
  gem "capistrano-rvm"
  gem "capistrano-bundler"
  gem "capistrano3-puma"
  gem "capistrano-dotenv-tasks", require: false
end
