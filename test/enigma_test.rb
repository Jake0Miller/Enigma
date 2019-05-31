require './test/test_helper'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt
    expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}
    actual = @enigma.encrypt("hello world", "02715", "040895")

    assert_equal expected, actual
  end

  def test_decrypt
    expected = {decryption: "hello world",
                key: "02715",
                date: "040895"}
    actual = @enigma.decrypt("keder ohulw", "02715", "040895")

    assert_equal expected, actual
  end

  def test_encrypt_without_date
    encrypted = @enigma.encrypt("hello world", "02715")
    decrypted = @enigma.decrypt(encrypted[:encryption], "02715")
    expected = {decryption: "hello world",
                key: "02715",
                date: Date.today}

    assert_equal expected, decrypted
  end
end
