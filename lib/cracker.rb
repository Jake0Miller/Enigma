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
    decryption = decrypt_message(ciphertext.reverse)
    key = KeyCracker.find_key(cipher_chars(decryption), cipher_chars(ciphertext), date)
    {decryption: decryption, key: key, date: date}
  end

  def decrypt_message(cipher)
    shift = shifter(cipher)
    i = 0
    cipher.downcase.split('').map do |char|
      i += 1 if @alphabet.include?(char)
      get_new_char(char, shift[(i-1) % 4], -1)
    end.join.reverse
  end

  def shifter(cipher)
    i = 0
    "dne ".split('').map do |char|
      i += 1 until @alphabet.include?(cipher[i])
      i += 1
      if char == ' '
        (cipher[i-1].ord - char.ord + 17) % 27
      else
        (cipher[i-1].ord - char.ord) % 27
      end
    end
  end

  def cipher_chars(cipher)
    cipher.split('').find_all {|ch| @alphabet.include? ch}
  end
end
