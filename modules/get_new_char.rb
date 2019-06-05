module GetNewChar
  def get_new_char(char, i, enc_or_decrypt = 0)
    if !ALPHABET.values.include?(char)
      char
    else char != ' '
      ALPHABET[(REV[char] + enc_or_decrypt*i) % LENGTH]
    end
  end
end
