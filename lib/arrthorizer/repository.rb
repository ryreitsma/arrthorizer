module Arrthorizer
  class Repository
    NotFound = Class.new(ArrthorizerException)

    def initialize(options = {})
      if options.fetch(:raise_on_missing) { true }
        missing_handler = method(:raise_on_missing)
      else
        missing_handler = method(:safely_handle_missing)
      end

      @storage = Hash.new &missing_handler
    end

    def add(privilege)
      storage[privilege.name] = privilege
    end

    def get(key)
      if key.respond_to? :name
        storage[key.name]
      else
        storage[key]
      end
    end

    private
    attr_reader :storage

    def safely_handle_missing(hash, key)
      nil
    end

    def raise_on_missing(hash, key)
      raise NotFound, "Could not find value for #{key.inspect}"
    end
  end
end
