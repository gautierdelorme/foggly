require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
  end

  test 'should get index' do
    get conversations_url
    assert_response :success
  end

  test 'should create conversation' do
    assert_difference('Conversation.count') do
      post conversations_url, params: {
        conversation: {
          user_id: users(:alice).id,
          participant_id: users(:alice).id
        }
      }
    end

    assert_redirected_to conversation_url(Conversation.last)
  end

  test 'should show conversation' do
    get conversation_url conversations(:one)
    assert_response :success
  end
end
