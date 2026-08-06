# frozen_string_literal: true

# class Game
class Game
  class BowlingError < StandardError; end

  def initialize = @rolls = []

  def roll(pins)
    raise BowlingError if !(0..10).cover?(pins) || complete?

    validate_roll!(pins)
    @rolls << pins
  end

  def score
    raise BowlingError unless complete?

    index = 0
    10.times.sum do
      if strike?(index)
        frame = @rolls[index, 3].sum
        index += 1
      else
        frame = @rolls[index, 2].sum
        frame += @rolls[index + 2] if frame == 10
        index += 2
      end
      frame
    end
  end

  private

  def strike?(index) = @rolls[index] == 10

  def validate_roll!(pins)
    tenth, first_nine_done = tenth_start
    return validate_regular_frame!(tenth, pins) unless first_nine_done

    validate_tenth_frame!(tenth, pins)
  end

  def validate_regular_frame!(frame_start, pins)
    first = @rolls[frame_start]
    raise BowlingError if first && first + pins > 10
  end

  def validate_tenth_frame!(tenth, pins)
    first, second = @rolls[tenth, 2]
    return unless first

    if first == 10
      raise BowlingError if second && second != 10 && second + pins > 10

      return
    end

    if second.nil?
      raise BowlingError if first + pins > 10

      return
    end

    raise BowlingError unless first + second == 10
  end

  def complete?
    tenth, first_nine_done = tenth_start
    return false unless first_nine_done

    first, second, third = @rolls[tenth, 3]
    return false unless first
    return !(second.nil? || third.nil?) if first == 10
    return false unless second

    first + second < 10 || !third.nil?
  end

  def tenth_start
    index = 0
    9.times do
      return [index, false] unless @rolls[index]

      if strike?(index)
        index += 1
      else
        return [index, false] unless @rolls[index + 1]

        index += 2
      end
    end
    [index, true]
  end
end
