# frozen_string_literal: true

# Clock class
class Clock
  def initialize(clock)
    @minutes = clock.fetch(:hour, 0) * 60 + clock.fetch(:minute, 0)
  end

  def +(other)
    @minutes += other.minutes
    self
  end

  def -(other)
    @minutes -= other.minutes
    self
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  def to_s
    format('%<hour>02d:%<minute>02d', hour: hour, minute: minute)
  end

  protected

  attr_reader :minutes

  def hour
    (minutes / 60) % 24
  end

  def minute
    (minutes % 60) % 60
  end
end
