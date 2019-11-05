module Shiftable


  def character_set
    ("a".."z").to_a << " "
  end

  def a_shift
    @offset_amount[0] + @shift_keys[0]
  end

  def b_shift
    @offset_amount[1] + @shift_keys[1]
  end

  def c_shift
    @offset_amount[2] + @shift_keys[2]
  end

  def d_shift
    @offset_amount[3] + @shift_keys[3]
  end

  def shift(index)
    if index % 4 == 0
      a_shift
    elsif index % 4 == 1
      b_shift
    elsif index % 4 == 2
      c_shift
    elsif index % 4 == 3
      d_shift
    end
  end

  def in_alphabet?(letter)
    character_set.include?(letter)
  end

  def alphabet_index(letter)
    character_set.find_index(letter)
  end

  def rotate_alphabet(total_shift)
    character_set.rotate(total_shift)
  end

  def random_key_sets(key)
    a = ((key[0] + key[1]).to_i)
    b = ((key[1] + key[2]).to_i)
    c = ((key[2] + key[3]).to_i)
    d = ((key[3] + key[4]).to_i)
    key_sets = [a, b, c, d]
  end
end
