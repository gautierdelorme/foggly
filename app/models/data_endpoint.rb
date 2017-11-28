class DataEndpoint < ApplicationRecord
  METHOD_TYPES = %w[GET POST].freeze

  belongs_to :data_source
  belongs_to :user

  validates :user, :data_source, :name, :description, :method, :path, presence: true
  validates :method, inclusion: { in: METHOD_TYPES, message: '%{value} is not a valid method' }

  scope :by_name, -> { order('lower(name)') }
end
