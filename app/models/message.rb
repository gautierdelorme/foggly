class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation, touch: true

  validates :user, :conversation, :body, presence: true

  scope :unread_by, ->(user) { where(conversation: user.conversations).where.not(user: user, read: true) }

  delegate :name, to: :user, prefix: true
end
