module Brackets
  def self.paired?(str)
    stack = []
    str.each_char do |ch|
      stack << ')' if ch == '('
      stack << ']' if ch == '['
      stack << '}' if ch == '{'
      return false if ')]}'.include?(ch) && stack.pop != ch
    end
    stack.empty?
  end
end
