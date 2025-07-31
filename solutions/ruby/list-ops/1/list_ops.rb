module ListOps
  def self.arrays(arr);            arr.size;                                       end
  def self.reverser(arr);          arr.reverse;                                    end
  def self.concatter(a, b);        a + b;                                          end
  def self.mapper(arr, &block);    arr.map(&block).to_a;                           end
  def self.filterer(arr, &block);  arr.filter(&block).to_a;                        end
  def self.sum_reducer(arr);       arr.sum;                                        end
  def self.factorial_reducer(arr); if arr.empty? then 1 else arr.reduce(&:*) end;  end
end