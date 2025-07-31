#
# Array extension
#
class Array
  def keep
    map { |e| yield(e) && e || nil }.compact
  end

  def discard
    map { |e| !yield(e) && e || nil }.compact
  end
end