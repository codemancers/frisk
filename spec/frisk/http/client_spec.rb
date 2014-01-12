require 'spec_helper'
require 'frisk/http/client'

describe Frisk::Http::Client do
  let(:api_host_url) { 'http://example.org' }
  let(:client) { Frisk::Http::Client.new(api_host_url) }

  describe "#request" do
    let(:parameters) { [ :get, 'posts', {key: :val}, {header: 'value'}] }

    it "should trigger faraday's run_request with params" do
      Faraday::Connection.any_instance
        .should_receive(:run_request)
        .with(*parameters)
      client.request(*parameters)
    end

    context "when body and headers are not passed" do
      let(:parameters) { [ :get, 'posts' ] }

      it "should trigger faraday's run_request with nil body and headers" do
        Faraday::Connection.any_instance
          .should_receive(:run_request)
          .with(*parameters, nil, nil)
        client.request(*parameters)
      end
    end
  end
end
