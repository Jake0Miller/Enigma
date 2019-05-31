require 'date'

class Enigma
  def initialize
  end

  def encrypt(message, key = rand(99999).to_s.rjust(5,"0"), date = Date.today)
    if date.class != String
      date = date.to_s.split("-").reverse.each_with_object("") do |c,s|
        s << c[-2..-1]
      end
    end

    date_shift = ((date.to_i)**2).to_s[-4..-1]

    shift = []
    shift << key[0..1].to_i + date_shift[0].to_i
    shift << key[1..2].to_i + date_shift[1].to_i
    shift << key[2..3].to_i + date_shift[2].to_i
    shift << key[3..4].to_i + date_shift[3].to_i

    alphabet = ("a".."z").to_a << " "

    message.downcase.split('').each_with_index do |char,i|
      if char != ' '
        message[i] = alphabet[(char.ord-97 + shift[i % 4]) % 27]
      else
        message[i] = alphabet[shift[i % 4] % 27 - 1]
      end
    end

    {encryption: message, key: key, date: date}
  end

  def decrypt(ciphertext, key, date = Date.today)

    {decryption: ciphertext, key: key, date: date}
  end
end
