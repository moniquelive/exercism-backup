# frozen_string_literal: true

require 'date'

# class Meetup
class Meetup
  def initialize(month, year) = (@month = month
                                 @year = year)

  def day(weekday, nth)
    d = { first: 1, second: 8, third: 15, fourth: 22, last: -7, teenth: 13 }[nth]
    (Date.new(@year, @month, d)..).find { |date| date.public_send("#{weekday}?") }
  end
end
