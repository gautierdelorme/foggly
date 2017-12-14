require 'test_helper'

class DataReportTest < ActiveSupport::TestCase
  test 'valid' do
    assert data_reports(:one).valid?
  end

  test 'invalid without user' do
    refute DataReport.new(name: 'test', body: 'test').valid?
  end

  test 'invalid without name' do
    refute DataReport.new(user: users(:alice), body: 'test').valid?
  end

  test 'invalid without body' do
    refute DataReport.new(user: users(:alice), name: 'test').valid?
  end
end
