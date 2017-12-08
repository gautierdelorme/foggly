module Foggly
  class RestClient
    class << self
      delegate_missing_to :Faraday
    end
  end
end
