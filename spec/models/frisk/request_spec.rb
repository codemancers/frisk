require 'spec_helper'

describe Frisk::Request do
  let(:params) do
    {
      api_host_url: 'www.example.com',
      method: :get,
      resource: 'posts'
    }
  end
  let(:request) { Request.new(params)  }
  describe "#send!" do
    
  end
end
