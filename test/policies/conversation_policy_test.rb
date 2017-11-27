require 'test_helper'

class ConversationPolicyTest < ActiveSupport::TestCase
  setup do
    @user = users(:alice)
  end

  test 'can access owned conversation' do
    assert_permit @user, conversations(:three), :show?
  end

  test 'cannot access not owned conversation' do
    refute_permit @user, conversations(:two), :show?
  end

  test 'only return user conversations' do
    assert_equal @user.conversations, Pundit.policy_scope!(@user, Conversation).all
  end
end
