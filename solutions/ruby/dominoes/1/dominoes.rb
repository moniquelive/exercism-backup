# frozen_string_literal: true

# module Dominoes
module Dominoes
  def self.chain?(dominoes, chain = [])
    return chain.empty? || chain.first[0] == chain.last[1] if dominoes.empty?

    last = chain[-1]&.last
    dominoes.each_with_index.any? do |d, i|
      [d, d.reverse].any? do
        (last.nil? || _1[0] == last) && chain?(dominoes[0...i] + dominoes[i + 1..], chain + [_1])
      end
    end
  end
end
