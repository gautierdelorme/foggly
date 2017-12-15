class DataReport < ApplicationRecord
  belongs_to :user

  validates :user, :name, :body, presence: true

  scope :by_name, -> { order(:name) }
  scope :accessible_by, ->(_) { all }

  delegate :name, to: :user, prefix: true
end
