# frozen_string_literal: true

Element = Struct.new(:datum, :next)

# class SimpleLinkedList
class SimpleLinkedList < Array
  def initialize(values = [])
    super()
    Array(values).each { self << Element.new(_1) }
  end

  def to_a = reverse_each.map(&:datum)
end
