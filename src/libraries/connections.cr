require "./basics"

module Carnallite
  module Libraries
    # Mapping of all awailable connections to library provider. It providing something similar to REST api mapping, but
    #   with more configuration required and provided. By default requiring the request string endpoint which must
    #   return package or something like that on required package name *(see more at specs)*. But could request more at
    #   if information provided. For developers of private servers and registries there is full covered API of class and
    #   how-to guide!
    #
    # Version: 0.0.0
    class ConnectionMapping; end

    # Connect to crystalshards.org and get all mapping
    #
    # Connect to primary shards web site and get all required information about them. Emits in way of reading original
    #   site content and wrapping it in ConnectionMapping instance. Doesn't contains API emmiting, but works out like
    #   primary search case *(because it is already the centalization of shards searching)*.
    #
    # Returns instancieted ConnectionMapping object with maps to all required postions.
    def connect_shards(); end

    # Connect to github.com and search for required projects
    #
    # Connects to github by official API and searches the projects that marked as crystal containing languages.
    #   Searching happaning by name first, after by description and only in last position by README file, which is not
    #   good practice.
    #
    # Returns instance of ConnectionMapping with GitHub routing
    def connect_github(); end

    # Connect to gitlab.com via access token, hidden in system.
    #
    # Connects to gitlab global istance first and creates mapping of all projects. You may enable private instances to
    #   index, but please make sure to mark all .env files first! For full guide of marking the private instances *(or*
    #   *peronal)* in documentation!
    #
    # Returns instance of ConnectionMapping working with GitLab
    def connect_gitlab(); end

    # Planned: 0.5
    # def connect_bitbucket(); end
    # def connect_private_server(token : String, mapping : ConnectionMapping); end
    # def connect_private_server(login : String, password : String, mapping : ConnectionMapping); end
  end
end
