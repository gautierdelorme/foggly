class DataReport < ApplicationRecord
  belongs_to :user

  validates :user, :name, :body, presence: true

  delegate :name, to: :user, prefix: true

  scope :by_name, -> { order(:name) }
  scope :accessible_by, ->(_) { all }
end
