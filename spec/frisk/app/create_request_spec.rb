require 'spec_helper'
require 'frisk/app'

describe "Create Request" do
  let(:params) do
    {
      api_host_url: 'www.example.com',
      method: :get,
      resource: 'posts'
    }
  end

  context "when http request is successful" do
    let(:http_response) { 'response'  }

    before do
      client = double('HttpClient')
      Frisk::HttpClient.should_receive(:new)
      .with('www.example.com')
      .and_return(client)
      client.should_receive(:request!)
      .with(method: :get, resource: 'posts', body: nil, headers: nil)
      .and_return(http_response)
    end

    it "should render a json containing response data" do
      post '/requests', params
      expect(last_response.body).to eq(http_response)
      expect(last_response.status).to eq(200)
    end
  end

  context "when http requests fails" do
    before do
      client = double('HttpClient')
      Frisk::HttpClient.should_receive(:new)
      .and_return(client)
      client.should_receive(:request!)
      .and_raise(Frisk::HttpRequestError, 'error message')
    end

    it "should render a json containing error message" do
      post '/requests', params
      expect(last_response.body).to eq('error message')
      expect(last_response.status).to eq(500)
    end
  end
end
