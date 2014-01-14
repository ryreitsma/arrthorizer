module Arrthorizer
  class ContextBuilder
    ConfigurationError = Class.new(Arrthorizer::ArrthorizerException)

    def initialize(&block)
      unless block_given?
        raise ConfigurationError, "No builder block provided to ContextBuilder.new"
      end

      yield self
    end

    def build
      Arrthorizer::Context.new
    end
  end
end
