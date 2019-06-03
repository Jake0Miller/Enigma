require 'date'
require './lib/crypter'
require './lib/cracker'

class Enigma
  def encrypt(message, key = rand(99999).to_s.rjust(5,"0"), date = make_date)
    crypter = Crypter.new(("a".."z").to_a << " ")
    crypter.encrypt(message, key, date)
  end

  def decrypt(ciphertext, key, date = make_date)
    crypter = Crypter.new(("a".."z").to_a << " ")
    crypter.decrypt(ciphertext, key, date)
  end

  def crack(ciphertext, date = make_date)
    cracker = Cracker.new(("a".."z").to_a << " ")
    cracker.crack(ciphertext.reverse, date)
  end

  def make_date
    Date.today.strftime('%d%m%y')
  end
end
