require './test/test_helper'

class CrackerTest < MiniTest::Test
  def setup
    @cracker = Cracker.new(("a".."z").to_a << " ")
  end

  def test_it_exists
    assert_instance_of Cracker, @cracker
  end

  def test_crack
    skip
    expected = {decryption: "hello world end",
                key: "08304",
                date: "291018"}
    assert_equal expected, @cracker.crack("vjqtbeaweqihssi", "291018")
  end

  def test_crack_without_date
    skip
    Cracker.any_instance.stubs(:make_date).returns("040895")
    assert_equal 0, @cracker.crack("vjqtbeaweqihssi")
  end

  def test_decrypt
    actual = @cracker.decrypt("vjqtbeaweqihssi".reverse)
    assert_equal "hello world end", actual
  end

  def test_shifter
    assert_equal [5, 5, 14, 62], @cracker.shifter("vjqtbeaweqihssi".reverse)
  end
end
