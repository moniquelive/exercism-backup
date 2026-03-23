# frozen_string_literal: true

# class Deque
class Deque < Array
  def delete(value) = index(value) && delete_at(index(value))
end
