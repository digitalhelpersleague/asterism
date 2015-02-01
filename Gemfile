source 'https://rubygems.org'
source 'https://rails-assets.org'

gem 'rails', '~> 4.2.0.beta2'
gem 'pg'
gem 'sequel-rails', github: 'kressh/sequel-rails'
gem 'carrierwave'
gem 'carrierwave-sequel', require: 'carrierwave/sequel'

gem 'pry-rails'

gem 'devise'
gem 'cancan'
gem 'draper'
gem 'responders'
gem 'gon_responder'
gem 'gon', github: 'kressh/gon'
gem 'redispatcher', github: 'rambler-digital-solutions/redispatcher'
#, path: '../redispatcher'

gem 'premailer-rails'
gem 'autoprefixer-rails'
gem 'bourbon'

gem 'slim-rails'
gem 'sass-rails', '~> 5.0.0.beta1'
gem 'coffee-rails', '~> 4.0'
gem 'rabl-rails'

group :assets do
  gem 'execjs', platforms: :ruby
  gem 'uglifier', '>= 1.3.0'
end

gem 'hashie'
gem 'oj'

group :doc do
  gem 'sdoc', require: false
end

# gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Assets
gem 'jquery-rails'
gem 'rails-assets-lodash'
gem 'rails-assets-angular'
gem 'rails-assets-angular-animate'
gem 'rails-assets-angular-resource'
gem 'rails-assets-angular-sanitize'
# gem 'rails-assets-angular-bindonce'
gem 'rails-assets-bootstrap-sass-official'
gem 'rails-assets-moment'
gem 'rails-assets-angular-moment'
gem 'rails-assets-jquery-ui'
gem 'rails-assets-jsPlumb'

gem 'ng-rails-csrf'

group :production do
  gem 'unicorn'
end

group :development do
  gem 'thin'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rbenv', require: false
  gem 'slackistrano', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
  # gem 'rack-mini-profiler'
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner', require: false
  gem 'factory_girl_rails'
  gem 'codeclimate-test-reporter', require: false
  gem 'faker'
  gem 'rspec-collection_matchers'
  gem 'shoulda'
end

# Use debugger
# gem 'debugger', group: [:development, :test]
