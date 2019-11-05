require './lib/shiftable'

class Encrypted
  include Shiftable

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
