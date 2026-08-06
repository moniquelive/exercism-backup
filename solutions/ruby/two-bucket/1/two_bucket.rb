class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(bucket_one_size, bucket_two_size, goal, start_bucket)
    @bucket_one_size = bucket_one_size
    @bucket_two_size = bucket_two_size
    @goal = goal
    @start_bucket = start_bucket
    solve!
  end

  private

  def solve!
    one, two = @start_bucket == 'one' ? [@bucket_one_size, 0] : [0, @bucket_two_size]

    queue = [[one, two, 1]]
    visited = { [one, two] => true }

    until queue.empty?
      one, two, moves = queue.shift

      if one == @goal || two == @goal
        @moves = moves
        @goal_bucket = one == @goal ? 'one' : 'two'
        @other_bucket = one == @goal ? two : one
        return
      end

      next_states(one, two).each do |n_one, n_two|
        next if visited[[n_one, n_two]] || invalid_state?(n_one, n_two)

        visited[[n_one, n_two]] = true
        queue << [n_one, n_two, moves + 1]
      end
    end

    raise ArgumentError, 'Unreachable goal with given starting bucket'
  end

  def next_states(one, two)
    pour_to_two = [one, @bucket_two_size - two].min
    pour_to_one = [two, @bucket_one_size - one].min
    [
      [@bucket_one_size, two], # fill one
      [one, @bucket_two_size],           # fill two
      [0, two],                          # empty one
      [one, 0],                          # empty two
      [one - pour_to_two, two + pour_to_two], # pour one -> two
      [one + pour_to_one, two - pour_to_one]  # pour two -> one
    ].reject { |n_one, n_two| n_one == one && n_two == two }
  end

  def invalid_state?(one, two)
    return true if @start_bucket == 'one' && one.zero? && two == @bucket_two_size
    return true if @start_bucket == 'two' && two.zero? && one == @bucket_one_size

    false
  end
end
