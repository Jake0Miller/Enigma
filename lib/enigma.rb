require './lib/crypter'
require './lib/cracker'
require './lib/constants'
require './modules/date_formatter'

ENCRYPT = 1
DECRYPT = -1

class Enigma
  include DateFormatter

  def initialize
    @crypter = Crypter.new
    @cracker = Cracker.new
  end

  def encrypt(message, key = key_generator, date = make_date)
    {encryption: @crypter.crypt(message, key, date, ENCRYPT), key: key, date: date}
  end

  def decrypt(ciphertext, key, date = make_date)
    {decryption: @crypter.crypt(ciphertext, key, date, DECRYPT), key: key, date: date}
  end

  def crack(ciphertext, date = make_date)
    @cracker.crack(ciphertext, date)
  end

  def key_generator
    rand(99999).to_s.rjust(5,"0")
  end
end
