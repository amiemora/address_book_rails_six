ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

#Use Spec DSL - Domain specific language
# HELPS make them readable to clients
require "minitest/spec"

#helpers
require "capybara/rails"
require "mocha/minitest"

# Need to require any folder inside our support folder
Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new(color: true),
  ENV,
  Minitest.backtrace_filter
)

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all
  # (using factory bot instead)

  #Minitest with the Spec
  extend Minitest::Spec::DSL

  # Add more helper methods to be used by all tests here...
end

# Need to integrate Capybara with Integration Tests
class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include AuthenticationMacros
  before(:each) { reset_login } # We want to run this mehod before each test
  include FactoryBot::Syntax::Methods
end
