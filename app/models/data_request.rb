class DataRequest < ApplicationRecord
  belongs_to :data_endpoint
  belongs_to :user

  validates :user, :data_endpoint, :url, presence: true

  delegate :method, to: :data_endpoint

  def exec!
    update response: JSON.parse(Foggly::RestClient.send(method.downcase, url, params).body)
  end
end
