module Arrthorizer
  # Make it possible to specify the context that Arrthorizer can evaluate from inside the controller:
  #
  # class MyController
  #   prepare_context do |c| # yields a ControllerContextBuilder since this is a Rails controller
  #     c.defaults do
  #       { bookcase: Cms::Bookcase.find(params[:id]) }
  #     end
  #
  #     c.for_action(:some_action) do
  #       c.defaults.merge({ bookcase: Cms::Book.find(params[:id]).bookcase })
  #     end
  #   end
  # end
  #
  # class MyController
  #   prepare_context do |c|
  #     c.defaults do
  #       params
  #     end
  #   end
  # end
  #
  # Pitfalls: Controller inheritance
  #
  # In non-Rails environments:
  #
  # class MySomething
  #   prepare_context do |c|
  #     c.defaults do
  #       { bookcase: Cms::Bookcase.find(params[:id]) }
  #     end
  #
  #     if params[:action] == :edit
  #       c.defaults.merge { author: User.find(params[:author_id] }
  #     end
  #   end
  # end

  class Context
    # class Builder that implements the above syntax
    #
    # It would be nice if the generated params would be a OpenStruct, to make Context Roles more readable.
  end
end
