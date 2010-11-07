require 'helper'

class TestSteamroller < Test::Unit::TestCase
  context "A steamrolled hash" do
    setup do
      @data = {"a" => {"b" => 3}, "c" => {"d" => 14}}
    end

    should "flatten out nicely" do
      @flattened = Steamroller.flatten(@data)
      assert_equal Hash["c.d"=>14, "a.b"=>3], @flattened
    end

    should "flatten out nicely with a | as the delimiter" do
      @flattened = Steamroller.flatten(@data, '|')
      assert_equal Hash["c|d"=>14, "a|b"=>3], @flattened
    end
  end
end
