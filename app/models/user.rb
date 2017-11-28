class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :started_conversations, class_name: 'Conversation', foreign_key: 'user_id', dependent: :destroy
  has_many :participated_conversations, class_name: 'Conversation', foreign_key: 'participant_id', dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :user_groups, through: :memberships
  has_many :data_sources, dependent: :destroy
  has_many :data_endpoints, dependent: :destroy

  validates :name, presence: true

  scope :by_name, -> { order('lower(name)') }

  def conversations
    started_conversations.or(participated_conversations)
  end
end
