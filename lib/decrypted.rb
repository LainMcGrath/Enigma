require './lib/shiftable'

class Decrypted
  include Shiftable

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
