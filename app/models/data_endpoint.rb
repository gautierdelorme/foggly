class DataEndpoint < ApplicationRecord
  METHOD_TYPES = %w[GET POST].freeze

  belongs_to :data_source, touch: true
  belongs_to :user
  has_many :data_requests, dependent: :destroy

  validates :user, :data_source, :name, :description, :method, :path, presence: true
  validates :method, inclusion: { in: METHOD_TYPES, message: '%{value} is not a valid method' }

  scope :by_name, -> { order('lower(name)') }

  delegate :base_url, to: :data_source

  def url
    base_url + path
  end
end
