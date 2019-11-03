require './test/test_helper'
require './lib/key_generator'

class KeysTest < Minitest::Test
  def setup
    @keys = KeyGenerator.new
    # @gen_key = @keys.generated_key
  end

  def test_it_exists
    assert_instance_of KeyGenerator, @keys
  end

  def test_it_can_generate_random_key
    KeyGenerator.any_instance.stubs(:generated_key).returns("68325")
    assert_equal "68325", @keys.generated_key
  end

 def test_it_can_slice_random_keys
   # KeyGenerator.stubs(:slice_random_key).returns("68325")
   # keys = stub
   # keys.stubs(:generated_key).returns("68325")
   # @keys.expects(:slice_random_key).returns(["6", "8", "3", "2", "5"])
   # assert_equal ["6", "8", "3", "2", "5"], keys.slice_random_key
   assert_instance_of Array, @keys.slice_random_key
   assert_equal 5, @keys.slice_random_key.length

 end

  def test_it_can_create_random_key_sets
    # fake_key_set = {:a =>11,:b => 15, :c => 50, :d => 04}
    # @keys.stubs(:random_key_sets).returns(fake_key_set)
    assert_instance_of Hash, @keys.random_key_sets
    assert_equal 4, @keys.random_key_sets.length
  end
end
