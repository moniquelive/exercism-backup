# frozen_string_literal: true

# SimpleCalculator class
class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < RuntimeError; end

  def self.calculate(first, second, oper)
    raise UnsupportedOperation if (op = ALLOWED_OPERATIONS.index(oper)).nil?
    raise ArgumentError unless first.is_a?(Numeric) &&
                               second.is_a?(Numeric) &&
                               oper.is_a?(String)
    return 'Division by zero is not allowed.' if second.zero? && oper == '/'

    ["#{first} + #{second} = #{first + second}",
     "#{first} / #{second} = #{first / second}",
     "#{first} * #{second} = #{first * second}"][op]
  end
end
