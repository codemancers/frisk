require 'sinatra'
require 'frisk/http_client'

module Frisk
  class App < ::Sinatra::Application
    set :root, File.expand_path(File.dirname(__FILE__) + "/../../app")
    set :static, true
    set :public_dir, Proc.new { "#{root}/assets" }
    set :views, Proc.new { "#{root}/views" }
    set :show_exceptions, false

    before do
      content_type :json
    end

    get '/' do
      content_type :html
      send_file settings.public_dir + '/index.html'
    end

    post '/requests' do
      begin
        HttpClient.new(params[:api_host_url]).request!(request_params)
      rescue HttpRequestError => e
        status 500
        e.message
      end
    end

    private

    def request_params
      {
        method: params[:method].to_sym,
        resource: params[:resource],
        body: params[:body],
        headers: params[:headers]
      }
    end
  end
end
