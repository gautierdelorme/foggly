class DataSource < ApplicationRecord
  belongs_to :user
  has_many :data_endpoints, dependent: :destroy

  validates :user, :name, :description, presence: true

  scope :by_name, -> { order('lower(name)') }
end
