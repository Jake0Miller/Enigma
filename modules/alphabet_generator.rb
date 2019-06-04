module AlphabetGenerator
  def alphabet_generator
    letters = ("a".."z").to_a << " "
    index = 0
    letters.each_with_object(Hash.new) do |letter, hash|
      hash[index] = letter
      index += 1
    end
  end
end
