require './lib/shiftable'
require './lib/offsets'

class Decrypted
  include Shiftable

  attr_reader :offset, :offset_amount, :shift_keys
  def initialize(key, date)
    @offset = Offset.new(date)
    @offset_amount = @offset.offset_amount
    @shift_keys = random_key_sets(key)
  end

  def decrypt_message(message)
    message_setup = message.downcase.split("")
    decrypted = []

    message_setup.each_with_index do |letter, index|
      if in_alphabet?(letter)
        total_shift = shift(index)
        original_letter = rotate_alphabet(-total_shift)[alphabet_index(letter)]
        decrypted << original_letter
      else
        decrypted << letter
      end
    end
    decrypted.join("")
  end
end
