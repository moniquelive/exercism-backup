# ArmstrongNumbers class
class ArmstrongNumbers
  def self.include?(n)
    d = n.digits
    l = d.length
    n == d.collect { |d| d.to_i ** l }.sum
  end
end
