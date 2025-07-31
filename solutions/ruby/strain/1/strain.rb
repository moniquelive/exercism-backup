#!/usr/bin/env ruby

class Array
  def keep(&block)
    return self.map{|e| block.call(e) ? e : nil }.compact if block_given?
    self
  end

  def discard(&block)
    return self.map{|e| !block.call(e) ? e : nil }.compact if block_given?
    self
  end
end