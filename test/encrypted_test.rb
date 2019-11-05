require './test/test_helper'
require './lib/encrypted'
require './lib/offsets'
require './lib/key_generator'
require './lib/shiftable'

class EncryptedTest < Minitest::Test

  def setup
    @encrypt = Encrypted.new("02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encrypted, @encrypt
  end

  def test_it_has_attributes
    assert_instance_of Offset, @encrypt.offset
    assert_equal [1, 0, 2, 5], @encrypt.offset_amount
    assert_equal [2, 27, 71, 15], @encrypt.shift_keys
  end

  def test_it_can_encrypt
    assert_equal "keder ohulw", @encrypt.encrypt_message("Hello world")
  end
end
