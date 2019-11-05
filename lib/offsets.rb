require 'Date'

class Offset

  attr_reader :date

  def initialize(date)
    @date = date
  end

  def square_date
    @date.to_i ** 2
  end

  def last_four_digits
     square_date % 10000
  end

  def split_last_four
   [last_four_digits.to_s][0].split("")
 end

 def offset_amount
  a = split_last_four[0].to_i
  b = split_last_four[1].to_i
  c = split_last_four[2].to_i
  d = split_last_four[3].to_i
  offest = [ a, b, c, d ]
 end
end
