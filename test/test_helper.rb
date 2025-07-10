ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def login_as(user)
      session = user.sessions.create!
      Current.session = session
      request_cookie_jar.signed[:session_id] = {value: session.id, httponly: true, same_site: :lax}
    end

    def logout
      Current.session = nil
      request_cookie_jar.delete(:session_id)
    end

    private

    def request_cookie_jar
      ActionDispatch::Request.new(Rails.application.env_config).cookie_jar
    end
  end
end
