require 'arrthorizer/rails'

class SomeController < ApplicationController
  to_prepare_context do end

  def some_action
  end
end
