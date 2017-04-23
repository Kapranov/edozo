ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

require "shrine/storage/memory"

Shrine.storages = {
  cache: Shrine::Storage::Memory.new,
  store: Shrine::Storage::Memory.new,
}

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all
  setup do
    image = File.open("test/fixtures/files/tapir.jpg")
    Shrine.storages[:store].upload(image, "tapir.jpg")
  end

  teardown do
    Shrine.storages.values.each(&:clear!)
  end
end
