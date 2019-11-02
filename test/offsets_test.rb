require 'minitest/autorun'
require 'minitest/pride'
require 'Date'
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
    assert_equal "021119", @offset.find_date
  end

  def test_it_can_square
    assert_equal 446012161, @offset.square_date
  end

  def test_it_can_find_last_four
    assert_equal 2161, @offset.last_four_digits
  end

  def test_it_can_split_last_four
    assert_equal ["2", "1", "6", "1"], @offset.split_last_four
  end

  def test_it_can_generate_offset_amount
    placeholder = {
                  :a => 2,
                  :b => 1,
                  :c => 6,
                  :d => 1
                  }
    assert_equal placeholder, @offset.offset_amount
  end
end
