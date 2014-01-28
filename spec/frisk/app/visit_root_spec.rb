require 'spec_helper'
require 'frisk/app'

describe "Visit root path" do
  before do
    get '/'
  end
  it "should load an html with angular app directive" do
    expect(last_response.content_type).to eq('text/html;charset=utf-8')
    expect(last_response.body).to include('ng-app')
  end
end
