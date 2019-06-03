class KeyCracker
  def initialize(decryption, ciphertext, date)
    @decryption = decryption
    @ciphertext = ciphertext
    @date = date
  end

  def find_key
    date_shift = ((@date.to_i)**2).to_s[-4..-1]
    key = []
    @ciphertext[0..3].split('').each_with_index do |char, i|
      key << char.ord - @decryption[i].ord - date_shift[i].to_i
    end
    key
  end
end
