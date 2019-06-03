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
                key: "08304",
                date: "291018"}
    assert_equal expected, @cracker.crack("vjqtbeaweqihssi", "291018")
  end

  #date_shift 6 3 2 4
  #final_shift 14 5 5 8
  #pre_shift 8 2 3 4

  def test_decrypt
    actual = @cracker.decrypt("vjqtbeaweqihssi".reverse)
    assert_equal "hello world end", actual
  end

  def test_shifter
    assert_equal [5, 5, 14, 62], @cracker.shifter("vjqtbeaweqihssi".reverse)
  end
end
