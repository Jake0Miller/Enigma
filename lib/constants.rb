letters = ("a".."z").to_a << " "
index = 0
ALPHABET = letters.each_with_object(Hash.new) do |letter, hash|
  hash[index] = letter
  index += 1
end

REV = ALPHABET.invert
LENGTH = ALPHABET.length
