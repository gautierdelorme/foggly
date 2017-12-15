class User < ApplicationRecord
  ROLES = %w[member admin].freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :started_conversations, class_name: 'Conversation', foreign_key: 'user_id', dependent: :destroy
  has_many :participated_conversations, class_name: 'Conversation', foreign_key: 'participant_id', dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :user_groups, through: :memberships
  has_many :data_sources, dependent: :destroy
  has_many :data_endpoints, dependent: :destroy
  has_many :data_requests, dependent: :destroy
  has_many :data_reports, dependent: :destroy

  validates :name, :role, presence: true
  validates :role, inclusion: { in: ROLES, message: '%{value} is not a valid role' }

  scope :by_name, -> { order('lower(name)') }

  def conversations
    started_conversations.or(participated_conversations)
  end

  def admin?
    role.to_sym == :admin
  end
end
