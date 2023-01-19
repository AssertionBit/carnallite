require "log"

require "./setup"
require "./libraries"
require "./server"

module Carnallite
  VERSION = "0.0.0"

  Log.for("carnallite").info {"Starting Carnallite of version: #{VERSION}"}
end
