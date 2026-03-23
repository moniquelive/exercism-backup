# frozen_string_literal: true

# class Deque
class Deque < Array
  def delete(value) = if (ndx = index { |v| v == value }) then delete_at(ndx) end
end
