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
end
