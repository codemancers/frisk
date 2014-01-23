require 'faraday'
require 'faraday_middleware'
require 'frisk/errors'

module Frisk
  class HttpClient
    def initialize(api_host_url)
      @connection = Faraday.new(url: api_host_url) do |conn|
        conn.response :raise_error
        conn.response :json
        conn.adapter Faraday.default_adapter
      end
    end

    def request!(params)
      @connection
        .run_request(params[:method].to_sym, params[:resource],
                     params[:body], params[:headers])
    rescue Exception => e
      raise Frisk::HttpRequestError, e.message
    end
  end
end
