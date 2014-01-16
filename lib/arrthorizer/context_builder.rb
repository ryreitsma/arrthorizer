module Arrthorizer
  class ContextBuilder
    def build
      Arrthorizer::Context.new
    end

    def build_from_hash(hash)
      Arrthorizer::Context.from_hash(hash)
    end
  end
end
