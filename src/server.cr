require "log"

require "./server/package"

module Carnallite
  module Server
    VERSION = "0.0.0"

    ::Log.debug { "Loading server module with version: #{VERSION}" }
  end
end
