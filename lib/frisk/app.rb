require 'sinatra'

module Frisk
  class App < Sintra::Application
    puts "================= #{ ENV['RACK_ENV'] } ==============="
  end
end
