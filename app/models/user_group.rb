class UserGroup < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :data_source_accesses, dependent: :destroy
  has_many :users, through: :memberships
  has_many :data_sources, through: :data_source_accesses
  belongs_to :user

  validates :user, :name, :description, presence: true

  scope :by_name, -> { order('lower(name)') }
end
