class Cracker
  def initialize(alphabet)
    @alphabet = alphabet
    @length = alphabet.length
  end

  def crack(ciphertext, date)
    shift = shifter(ciphertext)
    date_shift = ((date.to_i)**2).to_s[-4..-1]
    key = []
    shift.reverse.each_with_index do |char, i|
      key << char - date_shift[i].to_i
    end
    #binding.pry
    {decryption: decrypt(ciphertext, shift), key: key, date: date}
  end

  def decrypt(ciphertext, shift)
    ciphertext.downcase.split('').map.with_index do |char,i|
      if char != ' '
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
