require './lib/constants'

class KeyCracker
  def self.find_key(decryption, cipher, date)
    date_shift = ((date.to_i)**2).to_s[-4..-1]
    keys = self.get_key_array(decryption, cipher, date_shift)
    self.gen_key(keys)
  end

  def self.get_key_array(decryption, cipher, date_shift)
    cipher[0..3].map.with_index do |char, i|
      (REV[char] - REV[decryption[i]] - date_shift[i].to_i) % LENGTH
    end
  end

  def self.gen_key(keys)
    keys = self.make_key_arrays(keys)
    keys = self.reduce_keys(keys)
    keys[1..3].each_with_object(keys.first.sample) do |key_arr,str|
      str << key_arr.find {|key| key[0] == str[-1]}[-1]
    end
  end

  def self.make_key_arrays(keys)
    keys.map do |key|
      (0..4).each_with_object([]) do |num, arr|
        this_num = key + num * LENGTH
        arr << this_num.to_s.rjust(2,"0") if this_num < 100
      end
    end
  end

  def self.reduce_keys(keys)
    keys[1] = keys[1].map.find_all do |key_a|
      keys[2].any?{|key| key[0] == key_a[1]} &&
      keys[0].any?{|key| key[1] == key_a[0]}
    end
    keys[2] = keys[2].map.find_all do |key_a|
      keys[3].any?{|key| key[0] == key_a[1]} &&
      keys[1].any?{|key| key[1] == key_a[0]}
    end
    keys[0] = keys[0].map.find_all do |key_a|
      keys[1].any? {|key_b| key_b[0] == key_a[1]}
    end
    keys[3] = keys[3].map.find_all do |key_a|
      keys[2].any? {|key_b| key_b[1] == key_a[0]}
    end
    keys
  end
end
