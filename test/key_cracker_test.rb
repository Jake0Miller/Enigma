require './test/test_helper'

class KeyCrackerTest < Minitest::Test
  def test_find_key
    actual = KeyCracker.find_key("hello world end", "vjqtbeaweqihssi", "291018")
    assert_equal "08304", actual
  end

  def test_gen_key
    assert_equal "08304", KeyCracker.gen_key([8,2,3,4])
  end

  def test_get_key_array
    actual = KeyCracker.get_key_array("hello world end", "vjqtbeaweqihssi", "291018")
    assert_equal [8, 2, 3, 4], actual
  end

  def test_modify_key
    assert_equal "3", KeyCracker.modify_key("02",2,"08")
  end
end
