#!/usr/bin/env ruby
# frozen_string_literal: true

# class BankAccount
class BankAccount
  def initialize(balance = 0) = (@balance = balance
                                 @open = false)

  def balance = (raise ArgumentError unless @open

                 @balance)

  def open = (raise ArgumentError if @open

              @open = true)

  def close = (raise ArgumentError unless @open

               initialize)

  def deposit(amt) = (raise ArgumentError if !@open || amt.negative?

                      @balance += amt)

  def withdraw(amt) = (raise ArgumentError if !@open || amt.negative? || (@balance - amt).negative?

                       @balance -= amt)
end
