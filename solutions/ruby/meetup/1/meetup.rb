# frozen_string_literal: true

require 'date'

# class Meetup
class Meetup
  def initialize(month, year)
    @date = Date.new(year, month, 1)

    # rubocop:disable Style::RescueModifier
    @limit = Date.new(year, month, 31) rescue nil
    @limit = Date.new(year, month, 30) rescue nil unless @limit
    @limit = Date.new(year, month, 29) rescue nil unless @limit
    @limit = Date.new(year, month, 28) unless @limit
    # rubocop:enable Style::RescueModifier
  end

  def day(weekday, nth)
    wday = %i[sunday monday tuesday wednesday thursday friday saturday].index(weekday)
    n = 2 + (%i[second third fourth].index(nth) || -1)
    @date += 12 if nth == :teenth
    @limit.downto(@date) { |date| return date if date.wday == wday } if nth == :last
    @date.upto(@limit) do |date|
      next unless date.wday == wday
      return date if n == 1

      n -= 1
    end
  end
end
