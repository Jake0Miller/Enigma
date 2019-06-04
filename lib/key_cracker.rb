class KeyCracker
  def self.find_key(decryption, cipher, date)
    date_shift = ((date.to_i)**2).to_s[-4..-1]
    keys = self.get_key_array(decryption, cipher, date_shift)
    self.gen_key(keys)
  end

  def self.get_key_array(decryption, cipher, date_shift)
    cipher[0..3].map.with_index do |char, i|
      if char == ' '
        (char.ord - decryption[i].ord - 17 - date_shift[i].to_i) % 27
      else
        (char.ord - decryption[i].ord - date_shift[i].to_i) % 27
      end
    end
  end

  def self.gen_key(keys)
    keys[1..3].each_with_object((keys.first).to_s.rjust(2,"0")) do |key, str|
      str << self.modify_key(key.to_s.rjust(2,"0"), key, str)
    end
  end

  def self.modify_key(key_string, key, str)
    if key_string[0] > str[-1]
      key_string = (key%27).to_s.rjust(2,"0")
    elsif key_string[0] < str[-1]
      until key_string[0] == str[-1]
        key += 27
        key_string = key.to_s.rjust(2,"0")
      end
    end
    key_string[-1]
  end
end
