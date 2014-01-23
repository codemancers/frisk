require 'spec_helper'
require 'frisk/http_client'

describe Frisk::HttpClient do
  let(:api_host_url) { 'http://example.org' }
  let(:client) { Frisk::HttpClient.new(api_host_url) }

  describe "#request!" do
    let(:parameters) do
      {
        method: :get,
        resource: 'posts',
        body: {key: :val},
        headers: {header: 'value'}
      }
    end

    it "should trigger faraday's run_request with params" do
      Faraday::Connection.any_instance
        .should_receive(:run_request)
        .with(*parameters.values)
      client.request!(parameters)
    end

    context "when body and headers are not passed" do
      let(:parameters) do
        {
          method: :get,
          resource: 'posts'
        }
      end

      it "should trigger faraday's run_request with nil body and headers" do
        Faraday::Connection.any_instance
          .should_receive(:run_request)
          .with(*parameters.values, nil, nil)
        client.request!(parameters)
      end
    end
    context "when request raises an exception" do
      let(:parameters) { { method: :get, resource: 'posts' } }

      it "should raise HttpRequestError" do
        Faraday::Connection.any_instance
          .should_receive(:run_request)
          .with(*parameters.values, nil, nil)
          .and_raise(StandardError, 'shit happened')
        expect{client.request!(parameters)}
          .to raise_error(Frisk::HttpRequestError, 'shit happened')
      end
    end
  end
end
