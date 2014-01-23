require 'frisk/http_client'
require 'frisk/errors'

module Frisk
  class RequestsController < ApplicationController
    def create
      response = HttpClient.new(api_host_url).request!(request_params)
      render json: response, status: :ok
    rescue HttpRequestError => e
      render json: e.message, status: :internal_server_error
    end

    private

      def api_host_url
        params.require(:api_host_url)
      end

      def request_params
        params
          .tap{|x| x.require(:method)}
          .tap{|x| x.require(:resource)}
          .permit(:method, :resource, :body, :headers)
          .symbolize_keys
      end
  end
end
