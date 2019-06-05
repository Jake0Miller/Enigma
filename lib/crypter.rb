require './modules/get_new_char.rb'
require './lib/constants'

class Crypter
  include GetNewChar

  def crypt(message, key, date, enc_or_decrypt)
    shift = shifter(key, date)
    i = 0
    message.downcase.split('').each_with_object("") do |char, str|
      i += 1 if ALPHABET.values.include?(char)
      str << get_new_char(char, shift[(i-1) % 4], enc_or_decrypt)
    end
  end

  def shifter(key, date)
    date_shift = ((date.to_i)**2).to_s[-4..-1]
    (0..3).each_with_object([]) do |num,arr|
      arr << (key[num..num+1].to_i + date_shift[num].to_i)
    end
  end
end
