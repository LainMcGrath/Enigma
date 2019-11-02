class Enigma

  attr_reader :character_set, :offset, :key_generator

  def initialize
    @character_set = ("a".."z").to_a << " "
    @offset = Offset.new
    @key_generator = KeyGenerator.new
  end

  def shift_amount
    offset = @offset.offset_amount
    key = @key_generator.random_key_offsets
    shift = key.merge(offset) do |key, offset_value, key_value|
      offset_value + key_value
    end
    shift
  end
end
