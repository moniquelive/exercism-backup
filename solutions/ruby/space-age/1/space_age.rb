# frozen_string_literal: true

# SpaceAge class
class SpaceAge
  def initialize(age)
    on_earth = age / 31557600.0
    @results = {
      on_earth:   on_earth,
      on_mercury: on_earth / 0.2408467,
      on_venus:   on_earth / 0.61519726,
      on_mars:    on_earth / 1.8808158,
      on_jupiter: on_earth / 11.862615,
      on_saturn:  on_earth / 29.447498,
      on_uranus:  on_earth / 84.016846,
      on_neptune: on_earth / 164.79132,
    }
  end

  def method_missing(m, *args, &block)
    @results[m.to_sym] || "method #{m} missing"
  end
end
