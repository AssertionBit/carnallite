require "./server/package"

module Carnallite
  module Server
    VERSION = "0.0.0"

    def self.info
      printf "Loading Server files\n"
      printf "-----------------------\n"
      printf "Server is responsilbe for LSP functionality, all incomming messages comming here\n"
      printf "Version: #{VERSION}\n"
      puts
    end
  end
end
