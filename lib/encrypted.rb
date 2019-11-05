require './lib/shiftable'
require './lib/offsets'

class Encrypted
  include Shiftable

  attr_reader :offset_amount, :shift_keys, :offset

  def initialize(key, date)
    @offset = Offset.new(date)
    @offset_amount = @offset.offset_amount
    @shift_keys = random_key_sets(key)
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
