require './modules/date_formatter'

class Cracker
  include DateFormatter

  def initialize(alphabet)
    @alphabet = alphabet
    @length = alphabet.length
  end

  def crack(ciphertext, date = make_date)
    decryption = decrypt(ciphertext.reverse)
    key_cracker = KeyCracker.new
    key = key_cracker.find_key(decryption, ciphertext, date)
    {decryption: decryption, key: key, date: date}
  end

  def decrypt(ciphertext)
    shift = shifter(ciphertext)
    ciphertext.downcase.split('').map.with_index do |char,i|
      if !@alphabet.include?(char)
        char
      elsif char != ' '
        @alphabet[(char.ord-97 + -1*shift[i % 4]) % @length]
      else
        @alphabet[-1*shift[i % 4] % @length - 1]
      end
    end.join.reverse
  end

  def shifter(ciphertext)
    "dne ".split('').map.with_index do |char, i|
      if char == ' '
        (ciphertext[i].ord - char.ord - 10)
      else
        (ciphertext[i].ord - char.ord)
      end
    end
  end
end
