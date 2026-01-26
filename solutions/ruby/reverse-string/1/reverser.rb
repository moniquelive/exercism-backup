module Reverser
  def self.reverse(string)
    [].tap do |retval|
      string.length.times { retval << string[-it - 1] }
    end.join
  end
end
