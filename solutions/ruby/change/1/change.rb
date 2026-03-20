# frozen_string_literal: true

# module Change
module Change
  class NegativeTargetError < StandardError; end
  class ImpossibleCombinationError < StandardError; end

  def self.generate(coins, target)
    raise NegativeTargetError if target.negative?

    changes = [[]] + Array.new(target)
    1.upto(target) do |amount|
      changes[amount] = coins
                        .take_while { _1 <= amount }
                        .filter_map { |coin| (change = changes[amount - coin]) && change + [coin] }
                        .min_by { [_1.length, _1] }
    end
    changes[target] || raise(ImpossibleCombinationError)
  end
end
