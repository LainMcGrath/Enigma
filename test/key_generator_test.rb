require './test/test_helper'
require './lib/key_generator'

class KeysTest < Minitest::Test
  def setup
    @keys = KeyGenerator.new
  end

  def test_it_exists
    assert_instance_of KeyGenerator, @keys
  end

  def test_it_can_generate_random_key
    assert_instance_of Integer, @keys.generated_key

  end

 def test_it_can_slice_random_keys
   key = KeyGenerator.new
   assert_instance_of Array, key.slice_random_key

   key.expects(:slice_random_key).returns(["6", "8", "3", "2", "5"])
   assert_equal ["6", "8", "3", "2", "5"], key.slice_random_key
 end
end
