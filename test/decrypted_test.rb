require './test/test_helper'
require './lib/decrypted'
require './lib/offsets'
require './lib/key_generator'
require './lib/shiftable'

class DecryptedTest < Minitest::Test

  def setup
    @decrypt = Decrypted.new
  end

  def test_it_exists
    assert_instance_of Decrypted, @decrypt
  end

  def test_it_has_attributes
    placeholder = ["a", "b", "c", "d", "e", "f",
                    "g", "h", "i", "j", "k", "l",
                    "m", "n", "o", "p", "q", "r",
                    "s", "t", "u", "v", "w",
                    "x", "y", "z", " "]
    assert_equal placeholder, @decrypt.character_set
    assert_instance_of Offset, @decrypt.offset
    assert_instance_of KeyGenerator, @decrypt.key_generator
  end

#the below tests fail because they
  def test_it_can_create_shift_amounts
    offset_amount = 41119
    key = 48763

    assert_equal 23, @decrypt.a_shift
    assert_equal 23, @decrypt.b_shift
    assert_equal 23, @decrypt.c_shift
    assert_equal 23, @decrypt.d_shift
  end

  def test_it_is_in_alphabet
    assert_equal true, @decrypt.in_alphabet?("l")
    assert_equal false, @decrypt.in_alphabet?("!")
  end

  def test_it_can_find_alphabet_index
    assert_equal 1, @decrypt.alphabet_index("b")
    assert_equal 26, @decrypt.alphabet_index(" ")
  end

  def test_it_can_rotate_alphabet
      placeholder = [ "h", "i", "j", "k", "l", "m",
                      "n", "o", "p", "q", "r", "s",
                      "t", "u", "v", "w", "x", "y",
                      "z", " ", "a", "b", "c", "d",
                      "e", "f", "g"]
    assert_equal placeholder, @decrypt.rotate_alphabet(7)
  end

  def test_it_can_decrypt_a_message
    assert_equal "hello!", @decrypt.decrypt_message("kbtfr!")
  end
end
