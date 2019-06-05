require './test/test_helper'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_make_date
    assert_equal Date.today.strftime('%d%m%y'), @enigma.make_date
  end

  def test_encrypt
    expected = {encryption: "!keder ohulw!",
                key: "02715",
                date: "040895"}
    actual = @enigma.encrypt("!hello world!", "02715", "040895")

    assert_equal expected, actual

    expected = "!vjp be ceqhossh"
    actual = @enigma.encrypt("!hello world end", "13291", "040895")[:encryption]
    assert_equal expected, actual
  end

  def test_decrypt
    expected = {decryption: "hello world",
                key: "02715",
                date: "040895"}
    actual = @enigma.decrypt("keder ohulw", "02715", "040895")

    assert_equal expected, actual
  end

  def test_encrypt_decrypt_without_date
    Enigma.any_instance.stubs(:make_date).returns("040895")
    expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}
    encrypted = @enigma.encrypt("hello world", "02715")

    assert_equal expected, encrypted

    expected = {decryption: "hello world",
                key: "02715",
                date: "040895"}
    decrypted = @enigma.decrypt(encrypted[:encryption], "02715")

    assert_equal expected, decrypted
  end

  def test_encrypt_decrypt_without_date_or_key
    Enigma.any_instance.stubs(:key_generator).returns "02715"
    Enigma.any_instance.stubs(:make_date).returns("040895")
    expected = {encryption: "keder ohulw",
                key: @enigma.key_generator,
                date: @enigma.make_date}
    encrypted = @enigma.encrypt("hello world")

    assert_equal expected, encrypted

    expected = {decryption: "hello world",
                key: @enigma.key_generator,
                date: @enigma.make_date}
    decrypted = @enigma.decrypt(encrypted[:encryption], "02715")

    assert_equal expected, decrypted
  end

  def test_crack
    Enigma.any_instance.stubs(:make_date).returns("040895")
    actual = @enigma.crack("vjp be ceqhossh")
    assert_equal "hello world end", actual[:decryption]
    assert ["13291", "40564"].include?(actual[:key])
    assert_equal "040895", actual[:date]
  end

  def test_key_generator
    assert_equal 5, @enigma.key_generator.length
  end
end
