# frozen_string_literal: true

# class Bst
class Bst
  include Enumerable

  attr_reader :data, :left, :right

  def initialize(data) = @data = data

  def insert(value)
    if value > data
      right ? right.insert(value) : @right = Bst.new(value)
    else
      left ? left.insert(value) : @left = Bst.new(value)
    end
  end

  def each
    return enum_for(:each) unless block_given?

    left&.each { yield _1 }
    yield data
    right&.each { yield _1 }
  end
end
