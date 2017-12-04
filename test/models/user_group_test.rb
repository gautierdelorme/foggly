require 'test_helper'

class UserGroupTest < ActiveSupport::TestCase
  test 'valid' do
    assert user_groups('one').valid?
  end

  test 'invalid without user' do
    refute UserGroup.new(name: 'test', description: 'test').valid?
  end

  test 'invalid without name' do
    refute UserGroup.new(user: users('alice'), description: 'test').valid?
  end

  test 'invalid without description' do
    refute UserGroup.new(user: users('alice'), name: 'test').valid?
  end

  test 'invalid without correct visibility' do
    refute UserGroup.new(user: users('alice'), name: 'test', description: 'test', visibility: 'test').valid?
  end
end
