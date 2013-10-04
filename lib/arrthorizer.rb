require "arrthorizer/version"

module Arrthorizer
  def self.configure(&block)
    self.tap(&block)
  end
end
