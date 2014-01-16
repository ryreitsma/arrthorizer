module Arrthorizer
  # Make it possible to specify the context that Arrthorizer can evaluate from inside the controller:
  #
  # class MyController
  #   to_prepare_context do |c| # yields a ControllerContextBuilder since this is a Rails controller
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
  #   to_prepare_context do |c|
  #     c.defaults do
  #       params
  #     end
  #   end
  # end
  #
  # In non-Rails environments:
  #
  # class MySomething
  #   to_prepare_context do |c|
  #     c.defaults do
  #       { bookcase: Cms::Bookcase.find(params[:id]) }
  #     end
  #
  #     if params[:action] == :edit
  #       c.defaults.merge { author: User.find(params[:author_id] }
  #     end
  #   end
  # end

  class Context < OpenStruct
    def self.from_hash(hash)
      hash.is_a?(Context) ? hash : self.new(hash)
    end

    def merge(hash)
      h = to_hash.merge(hash.to_hash)

      self.class.from_hash(h)
    end

    def to_hash
      marshal_dump
    end
  end
end
