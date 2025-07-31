# frozen_string_literal: true

class BeerSong
  def self.recite(from, count)
    bottles = ->(n) { n.zero? ? "no more bottles" : (n > 1 ? "#{n} bottles" : "#{n} bottle") }

    from.downto(from-count+1).map do |n|
      n.zero? ?
        "No more bottles of beer on the wall, no more bottles of beer.\n"+
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      : "#{bottles.(n)} of beer on the wall, #{bottles.(n)} of beer.\n".capitalize +
        "Take #{ n > 1 ? "one" : "it" } down and pass it around, #{bottles.(n-1)} of beer on the wall.\n"
    end.join("\n")
  end
end

