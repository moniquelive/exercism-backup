# ArmstrongNumbers class
class ArmstrongNumbers
  def self.include?(n)
    s = n.to_s
    l = s.length
    n == s.chars.collect { |d| d.to_i ** l }.sum
  end
end
