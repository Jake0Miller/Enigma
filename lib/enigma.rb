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
    ciphertext.reverse!
    shift = []
    desired = "dne ".split('')
    cipher = ciphertext[0..3].split('')
    desired.each_with_index do |char, i|
      shift[i] = cipher[i].ord - char.ord
    end
    shift

    alphabet = ("a".."z").to_a << " "
    ciphertext.downcase.split('').each_with_index do |char,i|
      if char != ' '
        ciphertext[i] = alphabet[(char.ord-97 + -1*shift[i % 4]) % 27]
      else
        ciphertext[i] = alphabet[-1*shift[i % 4] % 27 - 1]
      end
    end

    {decryption: ciphertext.reverse, key: "0", date: date}
  end

  def make_date
    Date.today.strftime('%d%m%y')
  end
end
