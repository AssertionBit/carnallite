require "spec"

require "./spec_helper.cr"

describe Carnallite::Libraries do
  describe "initialize" do
    it "Correctly loads libraries" do
      library = Carnallite::Libraries::Library.new "bisect", :default

      library.name.should eq("bisect")
      library.lib_type.should eq(:default)
    end
  end
end
