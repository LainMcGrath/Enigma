require './test/test_help'
require './lib/key_generator'

class KeysTest < Minitest::Test
  def setup
    @keys = KeyGenerator.new
  end

  def test_it_exists
    assert_instance_of KeyGenerator, @keys
  end

  def test_it_can_generate_random_key
    @keys.expects(:generated_key).returns("68325")
    assert_equal "68325", @keys.generated_key
  end

  def test_it_can_slice_random_keys
    @keys.expects(:slice_random_key).returns(["68", "83", "32", "25"])
    assert_equal ["68", "83", "32", "25"], @keys.slice_random_key
  end

  def test_it_can_create_offset
    fake_key_set = {:a =>11,:b => 15, :c => 50, :d => 04}
    @keys.expects(:random_key_sets).returns(fake_key_set)
    assert_equal fake_key_set, @keys.random_key_sets
  end
end
