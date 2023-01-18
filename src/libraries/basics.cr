# License MIT, Author: AssertionBit

module Carnallite
  module Libraries

      # Basic library class. Provides full methods signatures, documentation and examples that possibly could be used.
      #   Also contains methods for reloading data. Contains such data:
      #
      # * Meta data
      # * Dependencies
      # * Developer dependencies
      # * Targets
      # * Included files structure / Library structure
      # * All inherited targets:
      #   * Constants
      #   * Classes
      #   * Functions
      #   * Modules
      #
      # Version: 0.0
      class BasicLibrary

        # Load library on specific version of required library/language. Method just accepts
        #
        # On version methods works like getting pre-instancietted object of class. Almoast similar to the switch-case
        # variant but instead provides much simpler way of loading data.
        #
        # Method gets infromation from build-in json objects that goes *with Сarnallite server*. You may override them,
        # but please make sure to hold the configurations properly!
        #
        # ### Example
        #
        # ```crystal
        # require "carnallite/libraries"
        #
        # class MyLib < BasicLibrary
        #   def on_version(ver : String)
        #     switch ver
        #       case "0.0.0": return MyLib { "authors" => ..., "ver" => ..., "structure" => ... }
        #       default: raise LibraryNotSupportedException("Library Not supported!")
        #     end
        #   end
        # end
        #
        # lib_ref = MyLib.new
        # lib_ref.on_version("0.0.0") # => { ... }
        # lib_ref.on_version("0.0.1") # => LibraryNotSupportedException(...)
        # ```
        #
        # Returns instancietted version of library on specific version
        def on_version(ver : String); end
      end
  end
end
