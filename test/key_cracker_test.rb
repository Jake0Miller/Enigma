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

#date_shift 6 3 2 4
#final_shift 14 5 5 8
#pre_shift 8 2 3 4
