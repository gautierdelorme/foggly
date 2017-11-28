require 'test_helper'

class DataEndpointTest < ActiveSupport::TestCase
  test 'valid' do
    assert data_endpoints('one').valid?
  end

  test 'invalid without user' do
    refute DataEndpoint.new(name: 'test', description: 'test', method: 'get', path: 'test').valid?
  end

  test 'invalid without name' do
    refute DataEndpoint.new(user: users('alice'), description: 'test', method: 'get', path: 'test').valid?
  end

  test 'invalid without description' do
    refute DataEndpoint.new(user: users('alice'), name: 'test', method: 'get', path: 'test').valid?
  end

  test 'invalid without path' do
    refute DataEndpoint.new(user: users('alice'), name: 'test', description: 'test', method: 'get').valid?
  end

  test 'invalid without method' do
    refute DataEndpoint.new(user: users('alice'), name: 'test', description: 'test', path: 'test').valid?
  end

  test 'invalid without correct method' do
    refute DataEndpoint.new(user: users('alice'), name: 'test', description: 'test', path: 'test', method: 'test').valid?
  end
end
