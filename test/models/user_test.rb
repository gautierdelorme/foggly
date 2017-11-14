require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid' do
    assert users('bob').valid?
  end

  test 'invalid without email' do
    refute User.new(name: 'bob').valid?
  end

  test 'invalid without name' do
    refute User.new(email: 'bob@test.com').valid?
  end

  test '#conversations' do
    assert users('alice').conversations == conversations('one', 'three')
  end
end
