require "spec_helper"

describe Arrthorizer::Rails::ControllerContextBuilder do
  let(:builder) { Arrthorizer::Rails::ControllerContextBuilder.new do end }

  describe :build_from_request do
    let(:request) { Rack::MockRequest.new(Rails.application.routes) }

    it "returns an Arrthorizer::Context" do
      builder.build_from_request(request).should be_an Arrthorizer::Context
    end
  end
end
