require 'spec_helper'

describe Frisk::RequestsController do
  routes { Frisk::Engine.routes }

  describe "POST request" do
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
        client = stub('HttpClient')
        Frisk::HttpClient.should_receive(:new)
          .with('www.example.com')
          .and_return(client)
        client.should_receive(:request!)
          .with(method: 'get', resource: 'posts')
          .and_return(http_response)
      end

      it "should render a json containing response data" do
        post :create, params
        expect(response.body).to eq(http_response)
        expect(response.status).to eq(200)
      end
    end

    context "when http requests fails" do
      before do
        client = stub('HttpClient')
        Frisk::HttpClient.should_receive(:new)
          .and_return(client)
        client.should_receive(:request!)
          .and_raise(Frisk::HttpRequestError, 'error message')
      end

      it "should render a json containing error message" do
        post :create, params
        expect(response.body).to eq('error message')
        expect(response.status).to eq(500)
      end
    end
  end
end
