require "./basics"


module Carnallite
  module Libraries
    # Crystal standart library. Contains reflections of all build-in types and method that loading on require. Also
    #   contains some additional tools, like anotation typing and other usefull things, thata possibly would be needed.
    #
    # Version: 0.0
    class StandartLib < BasicLibrary
    end

    # Build-Ins that loading on start. Loads default library as it is.
    #
    # > **WARNING!**
    # > This library has version loading! See `on_version` method!
    #
    # ### On version 1.7.0:
    #
    # *
    #
    class BuildInLib < BasicLibrary; end
  end
end
