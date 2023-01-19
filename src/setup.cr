require "log"


module Carnallite

  # Configuration of Server and application at all.
  #
  # Class loads configuration depending on provided in config folder, which appers with system provided folders. Mostly
  #   uses system defined variables and a little extends them. Full list is presented in docs. Configurations loading
  #   from cofig folder, if local is not privided or passed at CLI.
  #
  # Class also setups enviroment for work with. All setups goes in native for operational system way, so all is
  #   configurations appears where they should.
  #
  # Version 0.0.0
  class Configuration
    def initialize; end
  end

  # Instance of configuration, use this when need some part of configuration
  CONFIGURATION = Configuration.new

  # Logging configurations also goes from here. To get the default logger, use constant provided by CONFIGURATION. It
  #   constant provides predefined
  Log.setup do |c|
    backend = ::Log::IOBackend.new
    c.bind "*", :trace, backend

    # [0]> This doesn't works? Why?
      # c.bind "carnallite", :trace, backend
      # c.bind "carnallite.*", :trace, backend
      # c.bind "server", :trace, backend

      # c.bind "carnallite.libraries.*", :trace, backend
      # c.bind "Carnallite::Libraries.Library", :trace, backend
    # [0]> End of buggy code
  end

end
