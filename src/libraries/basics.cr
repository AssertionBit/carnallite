# License MIT, Author: AssertionBit
require "log"

module Carnallite
  module Libraries

    # Basic language item
    #
    # Provides all basic required items to work with. Contains some meta data like `full_path` or `is_external` which
    #   are required for working with some more advanced tools. BasicItem is item which contains most of metadata, that
    #   is what would You think is single unit: name, docs, path. It doesn't dependends on high-level things, like
    #   module or other object, which comes from it.
    #
    # ### Example
    #
    # ```crystal
    # require "caranllite/libraries/basics"
    #
    # struct MyObject < BasicItem
    #   # Implementing of something usefull...
    # end
    # ```
    #
    # Version 0.0.0
    abstract struct BasicItem

      # Name of item, which is representing, By default is "unknown", but should be overriden in initialize method. Must
      #   be exatcly as in sources!
      property name : String = "unknown"

      # NOTE: This part could be automated, but is it will be better to leave on centralized docs loaded?
      #
      # Short docs that appears at first string. Will appear as first string on hover and should be placed manually!
      property short_docs : String = ""

      # Full documentation of item. Resulted at some code expansion or something like that. No parsing provided, just
      #   full string of content without '#' symbol.
      property documentation : String = ""

      # Full path of the the item. This path is loading as File System path that appears as external or not. For
      #   non-external projects, on which user is working, full path is "$PROJECT_ROOT/...". This helps with full
      #   navigation around workspace.
      property full_path : String = ""

      # Markup that project is users workspace or external dependency. Difference in update method, which will reload
      #   them in different time and with different delay.
      property is_external : Bool = false

      # Is private actually helps to show or not in different contexts. Dont get's item to be lost and helps with
      #   working requiring on current module/file/class/etc.
      property is_private : Bool = false
    end

    # WARNING: Still some thoughs on it, so no values for a while
    struct Value < BasicItem; end

    # Method - struct that represents method item. It a little dynamic, so changes appears different from the passed
    #   params. Here is the short description:
    #
    # ```crystal
    # require "carnallite/libraries/basics"
    #
    # # Example
    # def example_method(param : String)
    #   return 42
    # end
    #
    # # Will be this one
    # method = Method( name: "example_method",
    #                  short_docs: "Example",
    #                  documentation: "",
    #                  full_path: "example_method",
    #                  is_external: false,
    #                  is_overloaded: false,
    #                  is_private: false,
    #                  overloads: nil,
    #                  params: {:param => Value.new "param", "Std::String"},
    #                  inherited_values: nil,
    #                  returns: Value.new "42", "Std::Int32")
    #
    # # ----------------------------------------------------------------------------------------------------------------
    #
    # # Lets overload method
    # def example_method()
    #   return -42
    # end
    #
    # # Here is the same value, but like that for more visual undertanding
    # method = Method( name: "example_method",
    #                  short_docs: "Example",
    #                  documentation: "",
    #                  full_path: "example_method",
    #                  is_external: false,
    #                  is_overloaded: true,
    #                  is_private: false,
    #                  overloads: [
    #                     Method( name: "example_method",
    #                             short_docs: "Example",
    #                             documentation: "",
    #                             full_path: "example_method",
    #                             is_external: false,
    #                             is_overloaded: false,
    #                             is_private: false,
    #                             overloads: nil,
    #                             params: {:param => Value.new "param", "Std::String"},
    #                             inherited_values: nil,
    #                             returns: Value.new "42", "Std::Int32"),
    #                     Method( name: "example_method",
    #                             short_docs: "Example",
    #                             documentation: "",
    #                             full_path: "example_method",
    #                             is_external: false,
    #                             is_overloaded: false,
    #                             is_private: false,
    #                             overloads: nil,
    #                             params: {},
    #                             inherited_values: nil,
    #                             returns: Value.new "-42", "Std::Int32")
    #                  ],
    #                  params: nil,
    #                  inherited_values: nil,
    #                  returns: nil)
    #
    # # This thing will generate such structure
    #
    # ```
    #
    # Structure is presented in such way for grouping of same interfaces, without double searches and other things, that
    #   may appear during work. Get the object, and work with it, all is ok.
    #
    struct Method < BasicItem

      # Mark that method is overloaded or not. Defines some behaviour moments that helps with work of Language Server.
      #   Value is provided as boolean and accepted at parsing stadia and some runtime moments.
      property is_overloaded : Bool = false

      # All overloads of function, contains array of overaloads.
      #
      # Example of contained value:
      #
      # ```crystal
      # [
      #  Method(name: "example_method",
      #         short_docs: "Example",
      #         documentation: "",
      #         ull_path: "example_method",
      #         is_external: false,
      #         is_overloaded: false,
      #         is_private: false,
      #         overloads: nil,
      #         params: {:param => Value.new "param", "Std::String"},
      #         inherited_values: nil,
      #          returns: Value.new "42", "Std::Int32"),
      # ]
      # ```
      #
      # Overloads are not appearing if the `is_overloaded` flag is not setted. Remember to check this first!
      property overloads : Array(Method) | Nil = nil

      # List of params as Hash of K, V. Name of value is Symbol and Value is information about the method.
      #
      # ```crystal
      # params = {:example => Value.new "example", "Std::String" }
      # ```
      property params : Hash(Symbol, Value) | Nil

      # List of values that used inside of method. Will be given when Server require inner content of method.
      property inherited_values : Array(Value) | Nil = nil

      # Value that function returns. If nil presented, but method is provided then will return Value with reference to
      #   Nil type.
      property returns : Value | Nil = nil

      def initialize(@name : String,
                     @short_docs : String = "",
                     @documentation : String = "",
                     @full_path : String = "",
                     @is_external : Bool = false,
                     @is_overloaded : Bool = false,
                     @is_private : Bool = false,
                     @overaloads : Array(Method) | Nil = nil,
                     @params : Hash(Symbol, String) | Nil = nil,
                     @inherited_values : Array(Value) | Nil = nil,
                     @returns : Value | Nil = nil)
        if overloads; end
      end
    end

    # Crystal single class representation
    struct Class < BasicItem
      def initialize(@name = String); end
    end

    struct Module < BasicItem
      property classes : Array(Class)

      def initialize(@name : String, @classes : Array(Class)); end
    end

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
      class Library
        property name : String = "unknown"
        property version : String = "-0.0.0"
        property lib_type : Symbol = :default
        # property inherited_modules : Array(Module)

        def initialize(@name : String, @lib_type : Symbol) # Default one
          Log.for("carnallite.libraries").info { "Loading library #{@name} which is #{@lib_type} using 'latest' version..." }
          lib_path = Path.new("lib", @name)
          if !Dir.exists?(lib_path)
            Log.warn { "Library #{@name} not downloaded! Emmiting download hook!" }
          end
        end

        def initialize(@name : String, @lib_type : Symbol, @version : String) # This is more advanced version, but still ok
          Log.info { "Loading library #{@name} which is #{@lib_type} using 'latest' version..." }
          lib_path = Path.new("lib", @name)

          if !Dir.exists?(lib_path)
            Log.warn { "Library #{@name} not downloaded! Emmiting download hook!" }
          end
        end

        # Dump cache to cache folder of user upon session.
        #
        # Dumping of current state of library and loading of this state upon libraries indexing
        #
        # Returns nothing
        def self.dump_cache(); end

        #
        def load_from_cache(name : String) : Library; end
      end
  end
end
