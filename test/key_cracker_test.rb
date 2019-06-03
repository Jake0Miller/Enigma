require './test/test_helper'

class KeyCrackerTest < Minitest::Test
  def setup
    @cracker = KeyCracker.new
  end

  def test_find_key
    actual = @cracker.find_key("hello world end", "vjqtbeaweqihssi", "291018")
    assert_equal "08304", actual
  end
  # 8 2 3 4
  # 08304

  def test_get_key_array
    actual = @cracker.get_key_array("hello world end", "vjqtbeaweqihssi", "291018")
    assert_equal [8, 2, 3, 4], actual
  end
end
