class UserGroup < ApplicationRecord
  VISIBILITY_TYPES = %w[public private].freeze

  has_many :memberships, dependent: :destroy
  has_many :data_source_accesses, dependent: :destroy
  has_many :users, through: :memberships
  has_many :data_sources, through: :data_source_accesses
  belongs_to :user

  validates :user, :name, :description, :visibility, presence: true
  validates :visibility, inclusion: { in: VISIBILITY_TYPES, message: '%{value} is not a valid visibility' }

  scope :by_name, -> { order(:name) }
  scope :user, ->(user) { left_outer_joins(:memberships).where(user: user).references(:memberships) }
  scope :public_groups, -> { left_outer_joins(:memberships).where(visibility: 'public').references(:memberships) }
  scope :private_but_accessible_by, lambda { |user|
    left_outer_joins(:memberships).where(memberships: { user_group: user.user_groups })
  }
  scope :accessible_by, ->(user) { user(user).or(public_groups).or(private_but_accessible_by(user)).distinct }
end
