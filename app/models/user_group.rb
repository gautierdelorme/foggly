class UserGroup < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  belongs_to :user

  validates :user, :name, :description, presence: true

  scope :by_name, -> { order('lower(name)') }
end
