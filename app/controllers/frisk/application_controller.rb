module Frisk
  class ApplicationController < ActionController::Base
    rescue_from ActionController::ParameterMissing do |e|
      render json: e.message, status: :bad_request
    end
  end
end
