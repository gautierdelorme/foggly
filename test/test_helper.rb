require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def permit(current_context, record, action)
    Pundit.authorize(current_context, record, action)
  rescue Pundit::NotAuthorizedError
    false
  end

  def assert_permit(user, record, action)
    msg = "User #{user.inspect} should be permitted to #{action} #{record}, but isn't permitted."
    assert permit(user, record, action), msg
  end

  def refute_permit(user, record, action)
    msg = "User #{user.inspect} should NOT be permitted to #{action} #{record}, but is permitted."
    refute permit(user, record, action), msg
  end

  def before_setup
    Bullet.start_request
    super if defined?(super)
  end

  def after_teardown
    super if defined?(super)
    Bullet.end_request
  end
end
