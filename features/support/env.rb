require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'cucumber/rails'
require 'database_cleaner'
require 'rspec'
require 'pry'
require 'open-uri'

ActionController::Base.allow_rescue = false

begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'

  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Capybara.register_driver :selenium do |app|
  Capybara::Driver::Selenium.new app, :browser => :firefox
end
