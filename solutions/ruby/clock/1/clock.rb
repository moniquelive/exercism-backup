# frozen_string_literal: true

# Clock class
class Clock
  attr_reader :hour, :minute

  def initialize(clock)
    total = clock.fetch(:hour, 0) * 60 + clock.fetch(:minute, 0)
    hour_from_minutes(total)
    minute_from_minutes(total)
  end

  def +(other)
    hour_from_minutes(in_minutes + other.in_minutes)
    minute_from_minutes(in_minutes + other.in_minutes)
    self
  end

  def -(other)
    hour_from_minutes(in_minutes - other.in_minutes)
    minute_from_minutes(in_minutes - other.in_minutes)
    self
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  def to_s
    format('%<hour>02d:%<minute>02d', hour: hour, minute: minute)
  end

  #---------------------------------------------------------------------------

  protected

  #---------------------------------------------------------------------------

  def in_minutes
    hour * 60 + minute
  end

  def hour_from_minutes(total)
    @hour = (total / 60) % 24
  end

  def minute_from_minutes(total)
    @minute = (total % 60) % 60
  end
end
