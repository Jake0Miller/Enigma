require './modules/date_formatter'
require './modules/get_new_char'
require './lib/constants'

class Cracker
  include DateFormatter
  include GetNewChar

  def crack(cipher, date = make_date)
    decrypt = decrypt_message(cipher.reverse)
    key = KeyCracker.find_key(cipher_chars(decrypt), cipher_chars(cipher), date)
    {decryption: decrypt, key: key, date: date}
  end

  def decrypt_message(cipher)
    shift = shifter(cipher)
    i = 0
    cipher.downcase.split('').map do |char|
      i += 1 if ALPHABET.values.include?(char)
      get_new_char(char, shift[(i-1) % 4], -1)
    end.join.reverse
  end

  def shifter(cipher)
    i = 0
    "dne ".split('').map do |char|
      i += 1 until ALPHABET.values.include?(cipher[i])
      i += 1
      (REV[cipher[i-1]] - REV[char]) % LENGTH
    end
  end

  def cipher_chars(cipher)
    cipher.split('').find_all {|ch| ALPHABET.values.include? ch}
  end
end
