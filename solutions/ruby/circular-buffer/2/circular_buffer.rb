# frozen_string_literal: true

# class CircularBuffer
class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(capacity) = (@capacity = capacity
                              @buffer = [])

  def full? = @buffer.size == @capacity
  def clear = @buffer.clear
  def read = @buffer.empty? ? raise(BufferEmptyException) : @buffer.shift
  def write(val) = full? ? raise(BufferFullException) : @buffer << val

  def write!(val) = (read if full?
                     write(val))
end
