require 'application_system_test_case'

class ConversationsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
  end

  test 'visiting the mailbox' do
    visit conversations_url
    assert_selector 'h1', text: 'Mailbox'
  end

  test 'visiting a conversation page' do
    visit conversation_url conversations('one')
    assert_selector 'p'
    assert_selector '.form-control.form-control-lg'
  end
end
