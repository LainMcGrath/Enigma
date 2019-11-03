class Encrypt

  attr_reader :character_set, :offset, :key_generator

  def initialize
    @character_set = ("a".."z").to_a << " "
    @offset = Offset.new
    @key_generator = KeyGenerator.new
  end

  def shift_amount
    offset = @offset.offset_amount
    key_gen = @key_generator.random_key_sets
    a = offset[0] + key_gen[0]
    b = offset[1] + key_gen[1]
    c = offset[2] + key_gen[2]
    d = offset[3] + key_gen[3]
    shifts = [a, b, c, d]
  end

  def shifted_ords
    shift_amount.map do |shift|
      if shift > 27
        shift % 27
      else
        shift
      end
    end
  end

  def rotate_shift_amount
    shift_amount.rotate!
  end

  def characters_to_ord
    @character_set.map { |letter| letter.ord }.rotate!
  end

  def message_encrypt(message, key)
    message_to_ord = message.downcase.chars.map { |letter| letter.ord }
    shifted_message = message_to_ord.map do |letter| letter + key )
    end
    joined_message = shifted_message.map { |letter| letter.chr }.join
  end
end
