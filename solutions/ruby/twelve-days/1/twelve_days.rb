# frozen_string_literal: true

# TwelveDays class
class TwelveDays
  def self.song
    ordinals = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)
    gifts = ["a Partridge in a Pear Tree", "two Turtle Doves", "three French Hens", "four Calling Birds", "five Gold Rings", "six Geese-a-Laying", "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing", "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming"]
    template = "On the %s day of Christmas my true love gave to me: %s."

    (0...12).map do |i|
      g = gifts[0..i].dup
      g.unshift("and " + g.shift) unless i.zero?
      template % [ordinals[i], g.reverse.join(", ")]
    end.join("\n\n") + "\n"
  end
end
