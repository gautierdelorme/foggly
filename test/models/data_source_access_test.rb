require 'test_helper'

class DataSourceAccessTest < ActiveSupport::TestCase
  test 'valid' do
    assert data_source_accesses('one').valid?
  end

  test 'invalid without data source' do
    refute DataSourceAccess.new(user_group: user_groups('one')).valid?
  end

  test 'invalid without user group' do
    refute DataSourceAccess.new(data_source: data_sources('one')).valid?
  end
end
