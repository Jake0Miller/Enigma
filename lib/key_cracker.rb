class KeyCracker
  def find_key(decryption, ciphertext, date)
    keys = get_key_array(decryption, ciphertext, date)
    gen_key(keys)
  end

  def get_key_array(decryption, ciphertext, date)
    date_shift = ((date.to_i)**2).to_s[-4..-1]
    ciphertext[0..3].split('').map.with_index do |char, i|
      char.ord - decryption[i].ord - date_shift[i].to_i
    end
  end

  def gen_key(keys)
    keys[1..3].each_with_object(keys.first.to_s.rjust(2,"0")) do |key, str|
      str << modify_key(key.to_s.rjust(2,"0"), key, str)[-1]
    end
  end

  def modify_key(key_string, key, str)
    until key_string[0] == str[-1]
      if key_string[0] < str[-1]
        key += 27
        key_string = key.to_s.rjust(2,"0")
      else
        key_string = (key%27).to_s.rjust(2,"0")
      end
    end
    key_string
  end
end
