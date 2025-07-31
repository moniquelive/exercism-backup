# frozen_string_literal: true

# AssemblyLine class
class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    rate = [0, 1, 1, 1, 1, 0.9, 0.9, 0.9, 0.9, 0.8, 0.77][@speed]
    @speed * 221.0 * rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
