ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails/capybara"
require "minitest/reporters"

Minitest::Reporters.use!


Apartment::Tenant.drop('blue') rescue nil
Apartment::Tenant.create('blue')
Apartment::Tenant.switch!('blue')

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Do not use transaction when running selenium tests
  self.use_transactional_fixtures = false
end

# Since we are using Apartment gem, we need to tell Capybara to connect our testing tenant URL + port number
Capybara.server_port = 5000
Capybara.always_include_port = true
Capybara.app_host = "http://blue.lvh.me"
