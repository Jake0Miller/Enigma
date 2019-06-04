require './lib/crypter'
require './lib/cracker'
require './modules/date_formatter'

class Enigma
  include DateFormatter

  def initialize
    @crypter = Crypter.new(("a".."z").to_a << " ")
    @cracker = Cracker.new(("a".."z").to_a << " ")
  end

  def encrypt(message, key = key_generator, date = make_date)
    @crypter.encrypt(message, key, date)
  end

  def decrypt(ciphertext, key, date = make_date)
    @crypter.decrypt(ciphertext, key, date)
  end

  def crack(ciphertext, date = make_date)
    @cracker.crack(ciphertext, date)
  end

  def key_generator
    rand(99999).to_s.rjust(5,"0")
  end
end
