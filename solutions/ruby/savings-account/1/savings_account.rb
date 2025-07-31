# frozen_string_literal: true

# SavingsAccount module
module SavingsAccount
  def self.interest_rate(balance)
    if balance.negative? then -3.213
    elsif balance < 1000 then 0.5
    elsif balance >= 1000 && balance < 5000 then 1.621
    elsif balance >= 5000 then 2.475
    elsif balance.zero? then 0
    end
  end

  def self.annual_balance_update(balance)
    balance * (1 + interest_rate(balance).abs / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      years += 1
    end
    years
  end
end
