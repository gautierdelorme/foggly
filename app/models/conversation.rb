class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :participant, class_name: 'User'
  has_many :messages, dependent: :destroy

  validates :user, :participant, presence: true
  validate :user_participant_uniqueness, on: :create

  scope :between, lambda { |user, participant|
    where(user: user, participant: participant).or(where(user: participant, participant: user))
  }

  delegate :between, to: :class

  def user_participant_uniqueness
    return if errors.present? || !already_exist?
    errors.add :base, "A conversation already exists between #{user.name} and #{participant.name}."
  end

  def participant_not(current_user)
    user == current_user ? participant : user
  end

  def already_exist?
    between(user, participant).any?
  end

  def similar
    between(user, participant).first
  end
end
