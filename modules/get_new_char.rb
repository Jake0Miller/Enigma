module GetNewChar
  def get_new_char(char, i, enc_or_decrypt = 0)
    if !@alphabet.values.include?(char)
      char
    else char != ' '
      @alphabet[(@rev[char] + enc_or_decrypt*i) % @length]
    end
  end
end
