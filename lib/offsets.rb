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
    date = find_date.to_i
    date * date
  end

  def last_four_digits
    full_number = square_date
    last_four = full_number % 10000
  end

  def split_last_four
   last_four = last_four_digits
   last_four_numbers = []
   last_four_numbers << last_four.to_s
   last_four_numbers[0].split("")
 end

end
