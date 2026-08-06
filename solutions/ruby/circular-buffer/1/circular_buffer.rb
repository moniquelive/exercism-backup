# frozen_string_literal: true

# class CircularBuffer
class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(capacity) = (@capacity = capacity
                              clear)

  def clear = @buffer = []
  def write(val) = @buffer.size == @capacity ? raise(BufferFullException) : @buffer << val
  def write!(val) = @buffer.size == @capacity ? (read && write(val)) : write(val)
  def read = @buffer.empty? ? raise(BufferEmptyException) : @buffer.shift
end
