require 'date'

class Enigma
  def initialize
  end

  def encrypt(message, key = rand(99999), date = Date.today)

    return {encryption: message, key: key, date: date}
  end

  def decrypt(ciphertext, key, date = Date.today)
    
    return {decryption: ciphertext, key: key, date: date}
  end
end
