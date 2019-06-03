class KeyCracker
  def find_key(decryption, ciphertext, date)
    key = get_key_array(decryption, ciphertext, date)
    key
  end

  def get_key_array(decryption, ciphertext, date)
    date_shift = ((date.to_i)**2).to_s[-4..-1]
    ciphertext[0..3].split('').map.with_index do |char, i|
      char.ord - decryption[i].ord - date_shift[i].to_i
    end
  end
end
