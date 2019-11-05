require './test/test_helper'
require './lib/decrypted'
require './lib/offsets'
require './lib/key_generator'
require './lib/shiftable'

class DecryptedTest < Minitest::Test

  def setup
    @decrypt = Decrypted.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Decrypted, @decrypt
  end

  def test_it_has_attributes
    assert_instance_of Offset, @decrypt.offset
    assert_equal [1, 0, 2, 5], @decrypt.offset_amount
    assert_equal [2, 27, 71, 15], @decrypt.shift_keys
  end
end
