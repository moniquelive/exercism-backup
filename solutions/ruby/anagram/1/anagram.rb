# Anagram class
class Anagram
  def initialize(word)
    @word = word.downcase
    @sorted = @word.chars.sort.join
  end

  def match(words)
    words.keep_if do |w|
      wdown = w.downcase
      wdown != @word &&
        wdown.chars.sort.join == @sorted
    end
  end
end
