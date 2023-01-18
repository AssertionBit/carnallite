require "http"

module Carnallite
  module Server

    # Hook for handling all incoming HTTP requests for working with basic requests.
    #
    # Class provides grouping methods which actually invokes other tools to work in single threading model with stream
    # design pattern. Rework the class in need of JSON routing
    #
    # Version: 0.0.0
    class ServerHook
      include HTTP::Handler

      property routes : Hash(String, Proc)

      def initialize
        @routes = Hash(String, Proc)
      end

      def self.add_route(route : String, method : String, &block : HTTP::Context -> Nil )
        @routes["#{method}:#{route}"] = block
      end

      private def route_item(ctx : HTTP::Context ); end

      def call(context)
        route_item context
      end
   end

   # Get instanciented HTTP::Server with ready to use configurations
   #
   # Returns configured instance of HTTP::Server that works as Language Server
   def self.get : HTTP::Server
    return HTTP::Server.new ([
      ServerHook.new
      # ToDo: Error hook
      # ToDo: Looging hook
      # ToDo: TCP hook
    ])
   end
  end
end
