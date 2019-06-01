require './modules/shifter'

class Crypter
  extend Shifter
  
  @alphabet = ("a".."z").to_a << " "

  def self.crypt(message, key, date, encrypt)
    shift = shifter(key, date)
    message.downcase.split('').each_with_index do |char,i|
      if char != ' '
        message[i] = @alphabet[(char.ord-97 + encrypt*shift[i % 4]) % 27]
      else
        message[i] = @alphabet[encrypt*shift[i % 4] % 27 - 1]
      end
    end
    if encrypt > 0
      {encryption: message, key: key, date: date}
    else
      {decryption: message, key: key, date: date}
    end
  end
end
