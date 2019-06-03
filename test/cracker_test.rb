require './test/test_helper'

class CrackerTest < MiniTest::Test
  def setup
    @cracker = Cracker.new(("a".."z").to_a << " ")
  end

  def test_it_exists
    assert_instance_of Cracker, @cracker
  end

  def test_crack
    expected = {decryption: "hello world end",
                key: "02715",
                date: "040895"}
    assert_equal expected, @cracker.crack("vjqtbeaweqihssi", "040895")
  end

  def test_decrypt
    actual = @cracker.decrypt("vjqtbeaweqihssi".reverse, [5, 5, 14, 62])
    assert_equal "hello world end", actual
  end

  def test_shifter
    assert_equal [18, -4, 12, 74], @cracker.shifter("vjqtbeaweqihssi")
  end
end
