require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'valid' do
    assert messages('one').valid?
  end

  test 'invalid without user' do
    refute Message.new(conversation: conversations('one'), body: 'test').valid?
  end

  test 'invalid without conversation' do
    refute Message.new(user: users('alice'), body: 'test').valid?
  end

  test 'invalid without body' do
    refute Message.new(conversation: conversations('one'), user: users('alice')).valid?
  end
end
