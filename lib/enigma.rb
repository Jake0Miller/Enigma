require './lib/crypter'
require './lib/cracker'
require './modules/date_formatter'
require './modules/alphabet_generator'

class Enigma
  include DateFormatter
  include AlphabetGenerator

  def initialize
    @crypter = Crypter.new(alphabet_generator)
    @cracker = Cracker.new(alphabet_generator)
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
