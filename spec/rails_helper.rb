# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'sidekiq/testing'

ActiveRecord::Migration.maintain_test_schema!

Capybara.server_errors = [Exception]

RSpec.configure do |config|
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  Capybara.javascript_driver = ENV['DRIVER'].try(:to_sym) || :chrome

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation, except: %w{ar_internal_metadata}
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.after do
    ActionMailer::Base.deliveries.clear
  end
end
