require './test/test_helper'
require './lib/encrypted'
require './lib/offsets'
require './lib/key_generator'
require './lib/shiftable'

class EncryptedTest < Minitest::Test

  def setup
    @encrypt = Encrypted.new
  end

  def test_it_exists
    assert_instance_of Encrypted, @encrypt
  end

  def test_it_has_attributes
    placeholder = ["a", "b", "c", "d", "e", "f",
                    "g", "h", "i", "j", "k", "l",
                    "m", "n", "o", "p", "q", "r",
                    "s", "t", "u", "v", "w",
                    "x", "y", "z", " "]
    assert_equal placeholder, @encrypt.character_set
    assert_instance_of Offset, @encrypt.offset
    assert_instance_of KeyGenerator, @encrypt.key_generator
  end

#the below tests fail because they
  def test_it_can_create_shift_amounts
    offset_amount = 41119
    key = 48763

    assert_equal 23, @encrypt.a_shift
    assert_equal 23, @encrypt.b_shift
    assert_equal 23, @encrypt.c_shift
    assert_equal 23, @encrypt.d_shift
  end

  def test_it_is_in_alphabet
    assert_equal true, @encrypt.in_alphabet?("l")
    assert_equal false, @encrypt.in_alphabet?("!")
  end

  def test_it_can_find_alphabet_index
    assert_equal 1, @encrypt.alphabet_index("b")
    assert_equal 26, @encrypt.alphabet_index(" ")
  end

  def test_it_can_rotate_alphabet
      placeholder = [ "h", "i", "j", "k", "l", "m",
                      "n", "o", "p", "q", "r", "s",
                      "t", "u", "v", "w", "x", "y",
                      "z", " ", "a", "b", "c", "d",
                      "e", "f", "g"]
    assert_equal placeholder, @encrypt.rotate_alphabet(7)
  end

  def test_it_can_encrypt_a_message
    assert_equal "kbtfr!", @encrypt.encrypt_message("hello!")
  end
end
