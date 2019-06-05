require './test/test_helper'

class CrypterTest < MiniTest::Test
  def setup
    @crypter = Crypter.new
  end

  def test_it_exists
    assert_instance_of Crypter, @crypter
  end

  def test_shifter
    assert_equal [3, 27, 73, 20], @crypter.shifter("02715", "040895")
  end

  def test_crypt
    actual = @crypter.crypt("hello world", "02715", "040895", 1)
    assert_equal "keder ohulw", actual
  end

  def test_get_new_char
    assert_equal "b", @crypter.get_new_char("a", 1, 1)
  end
end
