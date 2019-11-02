require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'Date'
require './lib/key_generator'

class KeysTest < Minitest::Test
  def setup
    @keys = KeyGenerator.new
    @random_key = "11504"
  end

  def test_it_exists
    assert_instance_of KeyGenerator, @keys
  end

  def test_it_can_generate_random_key
    assert_equal @random_key.length, @keys.generate_random_key.length
  end

  def test_it_can_slice_random_keys
    assert_equal ["1", "1", "5", "0", "4"].length, @keys.slice_random_key.length
  end

  def test_it_can_create_offset
    placeholder = {
                  :a =>"11",
                  :b => "15",
                  :c => "50",
                  :d => "04"
                  }
    assert_equal placeholder, @keys.random_key_offsets
  end
end
