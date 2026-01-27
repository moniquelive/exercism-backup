module EliudsEggs
  def self.egg_count(eggs)
    count = 0
    count += (eggs & 1) and eggs >>= 1 until eggs.zero?
    count
  end
end
