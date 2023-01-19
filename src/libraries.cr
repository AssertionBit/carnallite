require "log"

require "./libraries/*"

module Carnallite

    # Support for libraries that required by the project. Provides loading of project libraries, developer tools and
    #   libraries and full build in support. Also gives ability to load libraries from github and shards community
    #   website. *For working of this enable the internet conenction or on first start run --offline feature*.
    #
    # ### Example usage
    # ```crystal
    # require "carnallite/libraries"
    #
    # include Carnallite::Libraries # For examples, don't do that
    #
    # # Group of build-in connections
    # connect_shards()
    # connect_github()
    # gitlab_connect_gitlab()
    # connect_bitbucket()
    #
    # # Enabling private servers
    # connect_private_server({my_private_token: "TOKEN"})
    # connect_private_server({user: "LOGIN", password: "PASSWORD", schema: JSON_SCHEMA})
    #
    # # For further work You need in enviroment of user, so pass that to them
    # require "carnallite/enviroment"
    # enviroment = Carnallite::Envirment.load()
    #
    # # Load all libraries
    # libs = LibraryCollector.new [
    #   load_build_in(enviroment)
    #   load_std(enviroment)
    #   load_shards(enviroment)
    #   load_project(enviroment)
    # ]
    # ```
    #
    # All of this steps will load workspace libraries and give to You watched libraries *(shards and project libs only)*.
    # Also will give to You already threaded options to work with. You *CAN* disable threading by configuring enviroment
    # but please make sure that other options are not awailable for system *(prefer productivity, instead of lazyness)*.
    module Libraries
      VERSION = "0.0.0"

      Log.debug { "Loading libraries module with version: #{VERSION}" }
    end
end
