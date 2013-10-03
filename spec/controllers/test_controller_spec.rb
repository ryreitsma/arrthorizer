require 'spec_helper'

# TestController is part of the internal spec. This is actually an integration test
describe TestController do
  describe :test do
    include Rails.application.routes.url_helpers

    # Testing a context role that depends on context[:letmein]
    context "when I supply the correct 'letmein' param" do
      let(:params) { { letmein: true } }

      context "and the user has the right context_role" do
        before :each do
          PermissionFactory.allow_a(:letmeinner).to_use(:test)
        end

        it "succeeds" do
          get :test, params: params

          response.should be_success
        end
      end
    end

    context "when I do not supply the correct 'letmein' param" do
      let(:params) { { } }

      it "fails" do
        get :test, params: params

        response.should be_forbidden
      end
    end
  end
end
