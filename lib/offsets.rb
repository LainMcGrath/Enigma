require 'Date'

class Offset

  attr_reader :date

  def initialize
    @date = Time.now
  end

  def find_date
    day = @date.day.to_s.rjust(2, "0")
    month = @date.month.to_s.rjust(2, "0")
    year = @date.year.to_s[2..4]
    full_date = day + month + year
  end

  def square_date
    find_date.to_i ** 2
  end

  def last_four_digits
     square_date % 10000
  end

  def split_last_four
   last_four_numbers = []
   last_four_numbers << last_four_digits.to_s
   last_four_numbers[0].split("")
 end

 def offset_amount
   last_four = {}
   last_four[:a] = split_last_four[0].to_i
   last_four[:b] = split_last_four[1].to_i
   last_four[:c] = split_last_four[2].to_i
   last_four[:d] = split_last_four[3].to_i
   last_four
 end
end
