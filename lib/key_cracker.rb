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
        arr << this_num if this_num < 100
      end
    end

    
    # require 'pry'; binding.pry
    # until ans.length == 5
    #   ans = keys.first.to_s.rjust(2,"0")
    #   keys[1..3].each do |key|
    #     while key[0] != ans[-1]
    #       key += 27
    #       if key > 99
    #         ans = ""
    #       end
    #     end
    #   end
    # end
    # keys[1..3].each_with_object(keys.first.to_s.rjust(2,"0")) do |key, str|
    #   str << self.modify_key(key.to_s.rjust(2,"0"), key, str)
    # end
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
