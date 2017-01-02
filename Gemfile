source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'unicorn'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'haml'
gem 'turbolinks', '~> 5'
gem 'simple_form'

gem 'dotenv-rails', require: 'dotenv/rails-now'

group :production do
  gem 'mysql2'
end

group :development do
  # Style guides
  gem 'overcommit', require: false
  gem 'rubocop', require: false
  gem 'haml-lint', require: false
  gem 'reek', require: false

  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'chromedriver-helper' # This shouldn't really be necessary

  gem 'capistrano', '~> 3.6'
  gem 'capistrano3-env', '~> 0.1.0'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-unicorn-nginx', github: 'capistrano-plugins/capistrano-unicorn-nginx'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
end

gem 'tzinfo-data'
