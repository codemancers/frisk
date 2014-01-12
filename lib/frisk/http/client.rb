require 'faraday'
require 'faraday_middleware'

module Frisk::Http
  class Client
    def initialize(api_host_url)
      @connection = Faraday.new(url: api_host_url) do |conn|
        conn.request :url_encoded
        conn.response :raise_error
        conn.response :json
        conn.adapter Faraday.default_adapter
      end
    end

    def request(method, resource, body = nil, headers = nil)
      @connection.run_request(method, resource, body, headers)
    end
  end
end
