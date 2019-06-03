class Crypter
  def initialize(alphabet)
    @alphabet = alphabet
    @length = alphabet.length
  end

  def encrypt(message, key, date)
    {encryption: crypt(message, key, date, 1), key: key, date: date}
  end

  def decrypt(message, key, date)
    {decryption: crypt(message, key, date, -1), key: key, date: date}
  end

  def crypt(message, key, date, enc_or_decrypt)
    shift = shifter(key, date)
    message.downcase.split('').map.with_index do |char,i|
      if !@alphabet.include?(char)
        char
      elsif char != ' '
        @alphabet[(char.ord-97 + enc_or_decrypt*shift[i % 4]) % @length]
      else
        @alphabet[enc_or_decrypt*shift[i % 4] % @length - 1]
      end
    end.join
  end

  def shifter(key, date)
    date_shift = ((date.to_i)**2).to_s[-4..-1]
    (0..3).each_with_object([]) do |num,arr|
      arr << (key[num..num+1].to_i + date_shift[num].to_i)
    end
  end
end
