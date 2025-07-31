# frozen_string_literal: true

# TwoFer
class TwoFer
  class << self
    def two_fer(name = nil)
      return 'One for you, one for me.' if name.nil?

      "One for #{name}, one for me."
    end
  end
end
