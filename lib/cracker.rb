require './modules/date_formatter'
require './modules/get_new_char'

class Cracker
  include DateFormatter
  include GetNewChar

  def initialize(alphabet)
    @alphabet = alphabet
    @length = alphabet.length
  end

  def crack(ciphertext, date = make_date)
    decryption = decrypt(ciphertext.reverse)
    key = KeyCracker.find_key(decryption, ciphertext, date)
    {decryption: decryption, key: key, date: date}
  end

  def decrypt(ciphertext)
    shift = shifter(ciphertext)
    ciphertext.downcase.split('').map.with_index do |char,i|
      get_new_char(char, shift[i % 4], -1)
    end.join.reverse
  end

  def shifter(ciphertext)
    "dne ".split('').map.with_index do |char, i|
      if char == ' '
        (ciphertext[i].ord - char.ord + 17)
      else
        (ciphertext[i].ord - char.ord)
      end
    end
  end
end
