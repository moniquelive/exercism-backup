# frozen_string_literal: true

Element = Struct.new(:datum, :next)

# class SimpleLinkedList
class SimpleLinkedList < Array
  def initialize(values = []) = super(values.map { Element.new(_1) })
  def to_a = reverse_each.map(&:datum)
end
