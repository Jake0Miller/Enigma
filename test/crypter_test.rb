require './test/test_helper'

class CrypterTest < MiniTest::Test
  def setup
    @crypter = Crypter.new
    @crypter.extend(Shifter)
  end

  def test_it_exists
    assert_instance_of Crypter, @crypter
  end

  def test_shifter
    assert_equal [3, 27, 73, 20], @crypter.shifter("02715", "040895")
  end

  def test_crypt
    expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}
    assert_equal expected, Crypter.crypt("hello world", "02715", "040895", 1)
  end
end
