require 'helper'

class TestSteamroller < Test::Unit::TestCase
  context "A steamrolled hash" do
    setup do
      @data = {"a" => {"b" => 3}, "c" => {"d" => 14}}

      @flattened = Steamroller.flatten(@data)
    end
  
    should "flatten out nicely" do
      assert_equal Hash["c.d"=>14, "a.b"=>3], @flattened
    end
  end
end
