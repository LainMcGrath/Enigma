require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/offsets'
require './lib/key_generator'


class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    placeholder = ["a", "b", "c", "d", "e", "f",
                    "g", "h", "i", "j", "k", "l",
                    "m", "n", "o", "p", "q", "r",
                    "s", "t", "u", "v", "w",
                    "x", "y", "z", " "]
    assert_equal placeholder, @enigma.character_set
    assert_instance_of Offset, @enigma.offset
    assert_instance_of KeyGenerator, @enigma.key_generator
  end

  # def test_it_can_calculate_shift_amount
  #   placeholder = {:a=>27, :b=>51, :c=>14, :d=>89}
  #   assert_equal placeholder, @enigma.shift_amount
  # end
end
