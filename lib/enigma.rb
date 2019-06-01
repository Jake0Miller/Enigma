require './lib/crypter'
require './modules/date_maker'
require './modules/cracker'

class Enigma
  include DateMaker
  include Cracker

  def encrypt(message, key = rand(99999).to_s.rjust(5,"0"), date = make_date)
    Crypter.crypt(message, key, date, 1)
  end

  def decrypt(ciphertext, key, date = make_date)
    Crypter.crypt(ciphertext, key, date, -1)
  end

  def crack(ciphertext, date = make_date)
    
  end
end
