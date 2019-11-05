require './test/test_helper'
require './lib/encrypted'
require './lib/decrypted'
require './lib/enigma'
require './lib/offsets'
require './lib/key_generator'
require './lib/shiftable'


class ShiftableTest < Minitest::Test

  def setup
    @encrypt = Encrypted.new("02715", "040895")
    @decrypt = Decrypted.new("02715", "040895")
  end

  def test_it_can_create_character_set
    placeholder = ["a", "b", "c", "d", "e", "f", "g",
                    "h", "i", "j", "k", "l", "m", "n",
                    "o", "p", "q", "r", "s", "t", "u",
                    "v", "w", "x", "y", "z", " "]
    assert_equal placeholder, @encrypt.character_set
    assert_equal placeholder, @decrypt.character_set

  end

  def test_it_can_create_shift_amounts
    assert_equal 3, @encrypt.a_shift
    assert_equal 27, @encrypt.b_shift
    assert_equal 73, @encrypt.c_shift
    assert_equal 20, @encrypt.d_shift

    assert_equal 3, @decrypt.a_shift
    assert_equal 27, @decrypt.b_shift
    assert_equal 73, @decrypt.c_shift
    assert_equal 20, @decrypt.d_shift
  end

  def test_it_is_in_alphabet
    assert_equal true, @encrypt.in_alphabet?("l")
    assert_equal false, @encrypt.in_alphabet?("!")

    assert_equal true, @decrypt.in_alphabet?("l")
    assert_equal false, @decrypt.in_alphabet?("!")
  end

  def test_it_can_find_alphabet_index
    assert_equal 1, @encrypt.alphabet_index("b")
    assert_equal 26, @encrypt.alphabet_index(" ")

    assert_equal 1, @decrypt.alphabet_index("b")
    assert_equal 26, @decrypt.alphabet_index(" ")
  end

  def test_it_can_rotate_alphabet
    placeholder = [ "h", "i", "j", "k", "l", "m",
                    "n", "o", "p", "q", "r", "s",
                    "t", "u", "v", "w", "x", "y",
                    "z", " ", "a", "b", "c", "d",
                    "e", "f", "g"]
    assert_equal placeholder, @encrypt.rotate_alphabet(7)
    assert_equal placeholder, @decrypt.rotate_alphabet(7)
  end

  def test_it_can_encrypt_a_message
    assert_equal "keder!", @encrypt.encrypt_message("hello!")
    assert_equal "hello!", @decrypt.decrypt_message("keder!")
  end
end
