require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @message = messages(:one)
    sign_in users(:alice)
  end

  test 'should create message' do
    assert_difference('Message.count') do
      post conversation_messages_url(@message.conversation), params: {
        message: {
          body: @message.body,
          conversation_id: @message.conversation_id,
          read: @message.read,
          user_id: @message.user_id
        }
      }
    end

    assert_redirected_to @message.conversation
  end
end
