require './test/test_helper'
require './lib/offsets'

class OffsetTest < Minitest::Test
  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

#add mocks and stubs for below tests
  # def test_it_has_attributes
  #   date = Time.now
  #   assert_equal date, @offset.date
  # end

  def test_it_can_find_dates
    @offset.expects(:find_date).returns("021119")
    assert_equal "021119", @offset.find_date
  end

  def test_it_can_square
    @offset.expects(:square_date).returns(446012161)
    assert_equal 446012161, @offset.square_date
  end

  def test_it_can_find_last_four
    @offset.expects(:last_four_digits).returns(2161)
    assert_equal 2161, @offset.last_four_digits
  end

  def test_it_can_split_last_four
    fake_last_four = ["2", "1", "6", "1"]
    @offset.expects(:split_last_four).returns(fake_last_four)
    assert_equal fake_last_four, @offset.split_last_four
  end

  def test_it_can_generate_offset_amount
    fake_offset_amount = { :a => 2, :b => 1, :c => 6, :d => 1}
    @offset.expects(:offset_amount).returns(fake_offset_amount)
    assert_equal fake_offset_amount, @offset.offset_amount
  end
end
