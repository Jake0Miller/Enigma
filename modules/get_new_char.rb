module GetNewChar
  def get_new_char(char, i, enc_or_decrypt = 0)
    if !@alphabet.values.include?(char)
      char
    elsif char != ' '
      @alphabet[(char.ord-97 + enc_or_decrypt*i) % @length]
    else
      @alphabet[(enc_or_decrypt*i - 1) % @length]
    end
  end
end
