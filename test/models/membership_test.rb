require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  test 'valid' do
    assert memberships('one').valid?
  end

  test 'invalid without user' do
    refute Membership.new(user_group: user_groups('one')).valid?
  end

  test 'invalid without user group' do
    refute Membership.new(user: users('alice')).valid?
  end
end
