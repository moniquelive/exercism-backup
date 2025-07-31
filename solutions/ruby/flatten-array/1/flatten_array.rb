class FlattenArray
  def self.flatten(arr, acc=[])
    return acc if arr.empty?

    if arr.first.is_a? Enumerable
      self.flatten(arr.first, acc)
    elsif arr.first.nil?
      acc
    else
      acc << arr.first
    end

    self.flatten(arr[1..-1], acc)
  end
end
