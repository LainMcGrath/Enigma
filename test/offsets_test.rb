require './test/test_helper'
require './lib/offsets'

class OffsetTest < Minitest::Test
  # def setup
  #   @offset = Offset.new
  # end

  def test_it_exists
    offset = Offset.new(151119)
    assert_instance_of Offset, offset
  end

# add mocks and stubs for below tests
  def test_it_has_attributes
    offset = Offset.new(151119)
    assert_instance_of Integer, offset.date
    offset.expects(:date).returns(151119)
    assert_equal 151119, offset.date
  end

  def test_it_can_square
    offset = Offset.new(151119)
    assert_instance_of Integer, offset.square_date
    offset.expects(:square_date).returns(22836952161)
    assert_equal 22836952161, offset.square_date
  end

  def test_it_can_find_last_four
    offset = Offset.new(151119)
    offset.expects(:last_four_digits).returns(2161)
    assert_equal 2161, offset.last_four_digits
  end

  def test_it_can_split_last_four
    offset = Offset.new(151119)
    assert_instance_of Array, offset.split_last_four
    offset.expects(:split_last_four).returns(["2", "1", "6", "1"])
    assert_equal ["2", "1", "6", "1"], offset.split_last_four
  end

  def test_it_can_generate_offset_amount
    offset = Offset.new(151119)
    assert_instance_of Array, offset.offset_amount
    offset.expects(:offset_amount).returns([2,1,6,1])
    assert_equal [2,1,6,1], offset.offset_amount
  end
end
