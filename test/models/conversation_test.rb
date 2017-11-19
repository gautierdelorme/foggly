require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  setup do
    @conversation = conversations('one')
  end

  test 'valid' do
    assert @conversation.valid?
  end

  test 'invalid without user' do
    refute Conversation.new(participant: users('bob')).valid?
  end

  test 'invalid without participant' do
    refute Conversation.new(user: users('bob')).valid?
  end

  test 'invalid when similar already exists' do
    refute Conversation.new(user: users('bob'), participant: users('alice')).valid?
  end

  test '#similar' do
    assert @conversation.similar == @conversation
    assert Conversation.new(user: users('bob'), participant: users('alice')).similar == @conversation
  end

  test '#already_exist?' do
    assert @conversation.already_exist?
    refute Conversation.new(user: users('alice'), participant: users('alice')).already_exist?
  end

  test 'participant_not' do
    assert @conversation.participant_not(@conversation.user) == @conversation.participant
    assert @conversation.participant_not(@conversation.participant) == @conversation.user
  end
end
