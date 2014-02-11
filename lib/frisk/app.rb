require 'sinatra'
require 'frisk/http_client'
require 'sinatra/assetpack'
require 'coffee-script'

module Frisk
  class App < ::Sinatra::Application
    set :root, File.expand_path(File.dirname(__FILE__) + "/../../app")
    set :static, true
    set :views, Proc.new { "#{root}/views" }
    set :show_exceptions, false

    register ::Sinatra::AssetPack

    assets {
      serve '/js',     from: 'assets/javascripts'
      serve '/css',    from: 'assets/stylesheets'

      js :app, 'js/app.js', [
        '/js/angular.min.js',
        '/js/frisk.js'
      ]

      css :app, 'css/app.css', [
        '/css/frisk.css'
      ]
    }

    before do
      content_type :json
    end

    get '/' do
      content_type :html
      erb :index
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
