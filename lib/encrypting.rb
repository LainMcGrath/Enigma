class Encrypting

  attr_reader :character_set, :offset, :key_generator

#probably need to refactor this
  def initialize
    @character_set = ("a".."z").to_a << " "
    @offset = Offset.new
    @offset_amount = @offset.offset_amount
    @key_generator = KeyGenerator.new
    @shift_keys = @key_generator.random_key_sets
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
    @character_set.include?(letter)
  end

  def alphabet_index(letter)
    @character_set.find_index(letter)
  end

  def rotate_alphabet(total_shift)
    @character_set.rotate(total_shift)
  end

  def encrypt_message(message)
    message_setup = message.downcase.split("")
    encrypted = []

    message_setup.each_with_index do |letter, index|
      if in_alphabet?(letter)
        total_shift = shift(index)
        new_letter = rotate_alphabet(total_shift)[alphabet_index(letter)]
        encrypted << new_letter
      else
        encrypted << letter
      end
    end
    encrypted.join("")
  end
end
