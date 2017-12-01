require 'test_helper'

class DataSourceTest < ActiveSupport::TestCase
  test 'valid' do
    assert data_sources('one').valid?
  end

  test 'invalid without user' do
    refute DataSource.new(name: 'test', description: 'test', base_url: 'test').valid?
  end

  test 'invalid without name' do
    refute DataSource.new(user: users('alice'), description: 'test', base_url: 'test').valid?
  end

  test 'invalid without description' do
    refute DataSource.new(user: users('alice'), name: 'test', base_url: 'test').valid?
  end

  test 'valid without base url' do
    assert DataSource.new(user: users('alice'), name: 'test', description: 'test').valid?
  end
end
