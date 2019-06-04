require './modules/alphabet_generator'

class KeyCracker
  extend AlphabetGenerator

  @alphabet = alphabet_generator
  @rev = @alphabet.invert
  @length = @alphabet.length

  def self.find_key(decryption, cipher, date)
    date_shift = ((date.to_i)**2).to_s[-4..-1]
    keys = self.get_key_array(decryption, cipher, date_shift)
    self.gen_key(keys)
  end

  def self.get_key_array(decryption, cipher, date_shift)
    cipher[0..3].map.with_index do |char, i|
      (@rev[char] - @rev[decryption[i]] - date_shift[i].to_i) % @length
    end
  end

  def self.gen_key(keys)
    keys = keys.map do |key|
      (0..4).each_with_object([]) do |num, arr|
        this_num = key + num * @length
        arr << this_num.to_s.rjust(2,"0") if this_num < 100
      end
    end

    keys = self.reduce_keys(keys)
    keys = self.reduce_keys(keys)
    keys[1..3].each_with_object(keys.first.sample) do |key_arr,str|
      str << key_arr.find {|key| key[0] == str[-1]}[-1]
    end
  end

  def self.reduce_keys(keys)
    keys.map.with_index do |key_arr,i|
      if i < 3
        key_arr.find_all do |key|
          keys[i+1].map{|key| key[0]}.include?(key[-1])
        end
      else
        key_arr.find_all do |key|
          keys[i-1].map{|key| key[-1]}.include?(key[0])
        end
      end
    end
  end
end
