require './lib/crypter'
require './modules/date_maker'

class Enigma
  include DateMaker

  def encrypt(message, key = rand(99999).to_s.rjust(5,"0"), date = make_date)
    Crypter.crypt(message, key, date, 1)
  end

  def decrypt(ciphertext, key, date = make_date)
    Crypter.crypt(ciphertext, key, date, -1)
  end
end
