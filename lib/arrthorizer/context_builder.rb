module Arrthorizer
  class ContextBuilder
    class ConfigurationError < Arrthorizer::ArrthorizerException; end

    def initialize(&block)
      unless block_given?
        raise ConfigurationError, "No builder block provided to ContextBuilder.new"
      end
    end
  end
end
