require "./basics"


module Carnallite
  module Libraries
    # Crystal standart library. Contains reflections of all build-in types and method that loading on require. Also
    #   contains some additional tools, like anotation typing and other usefull things, thata possibly would be needed.
    #
    # Version: 0.0
    class StandartLib < Library

        # Load library on specific version of required library/language. Method just accepts version and returns what
        #   loaded.
        #
        # On version methods works like getting pre-instancietted object of class. Almoast similar to the switch-case
        #   variant but instead provides much simpler way of loading data.
        #
        # Method gets infromation from build-in json objects that goes *with Сarnallite server*. You may override them,
        # but please make sure to hold the configurations properly!
        #
        # ### Example
        #
        # ```crystal
        # require "carnallite/libraries"
        #
        # std_lib_0_1 = StandartLib.of_version "0.1"
        # ```
        #
        # Returns instancietted version of std library of specific version
        def of_version(ver : String); end
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
    class BuildInLib < Library; end
  end
end
