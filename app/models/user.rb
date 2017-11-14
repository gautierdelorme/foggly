class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :started_conversations, class_name: 'Conversation', foreign_key: 'user_id', dependent: :destroy
  has_many :participated_conversations, class_name: 'Conversation', foreign_key: 'participant_id', dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true

  def conversations
    started_conversations.or(participated_conversations)
  end
end
