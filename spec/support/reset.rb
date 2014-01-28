module Arrthorizer
  module Rails
    module Resetter
      extend self

      def reset!
        Arrthorizer::Rails::ControllerAction.send(:repository).reset!

        Arrthorizer::Rails::Configuration.load
      end
    end
  end

  class Repository
    def reset!
      self.storage = Hash.new
    end
  end
end

RSpec.configure do |config|
  config.before :each do
    Arrthorizer::Rails::Resetter.reset!
  end
end

