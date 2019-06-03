require './test/test_helper'

class KeyCrackerTest < Minitest::Test
  def setup
    @cracker = KeyCracker.new("hello world end", "vjqtbeaweqihssi", "291018")
  end

  def test_find_key
    actual = @cracker.find_key
    assert_equal [8, 2, 3, 4], actual
  end
end
