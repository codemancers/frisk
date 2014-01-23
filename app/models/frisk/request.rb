require 'frisk/http_client'
require 'frisk/errors'
module Frisk
  class Request
    include ActiveModel::Validations
    attr_accessor :api_host_url, :method, :resource, :body, :headers
    validates :api_host_url, :method, :resource, presence: true

    def initialize(params)
      api_host_url = params[:api_host_url]
      method = params[:method]
      resource = params[:resource]
      body = params[:body]
      headers = params[:headers]
    end

    def send!
      raise Frisk::ValidationError if invalid?
      client = Frisk::HttpClient.new(api_host_url)
      client.request!(method, resource, body, headers)
    end
  end
end
