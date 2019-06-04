require './test/test_helper'
require './modules/alphabet_generator'

class CrackerTest < MiniTest::Test
  include AlphabetGenerator

  def setup
    @cracker = Cracker.new(alphabet_generator)
  end

  def test_it_exists
    assert_instance_of Cracker, @cracker
  end

  def test_crack
    expected = {decryption: "!hello world end!",
                key: "08304",
                date: "291018"}
    assert_equal expected, @cracker.crack("!vjqtbeaweqihssi!", "291018")
  end

  def test_crack_without_date
    Cracker.any_instance.stubs(:make_date).returns("040895")
    actual = @cracker.crack("!vjp be ceqhossh")
    assert_equal "!hello world end", actual[:decryption]
    assert_equal "040895", actual[:date]
    assert ["13291", "40564"].include?(actual[:key])
  end

  def test_decrypt_message
    actual = @cracker.decrypt_message("!vjqtbeaweqihssi!".reverse)
    assert_equal "!hello world end!", actual
  end

  def test_shifter
    assert_equal [5, 5, 14, 8], @cracker.shifter("!vjqtbeaweqihssi!".reverse)
  end

  def test_cipher_chars
    assert_equal ["a", "b", "d"], @cracker.cipher_chars("!abd3")
  end
end
