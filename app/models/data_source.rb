class DataSource < ApplicationRecord
  belongs_to :user
  has_many :data_endpoints, dependent: :destroy
  has_many :data_source_accesses, dependent: :destroy
  has_many :user_groups, through: :data_source_accesses

  validates :user, :name, :description, presence: true

  scope :by_name, -> { order('lower(name)') }
  scope :user, ->(user) { left_outer_joins(:data_source_accesses).where(user: user).references(:data_source_accesses) }
  scope :unrestricted, -> { left_outer_joins(:data_source_accesses).where(data_source_accesses: { id: nil }) }
  scope :restricted_but_accessible_by, lambda { |user|
    left_outer_joins(:data_source_accesses).where(data_source_accesses: { user_group: user.user_groups })
  }
  scope :accessible_by, ->(user) { user(user).or(unrestricted).or(restricted_but_accessible_by(user)) }
end
