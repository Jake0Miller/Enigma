class KeyCracker
  def find_key(decryption, ciphertext, date)
    date_shift = ((date.to_i)**2).to_s[-4..-1]
    key = ciphertext[0..3].split('').map.with_index do |char, i|
      char.ord - decryption[i].ord - date_shift[i].to_i
    end
    key
  end
end
