module Alphametics
  def self.solve(puzzle)
    left_expr, right_expr = puzzle.split('==').map(&:strip)
    result_word = right_expr&.strip
    return {} if result_word.nil? || right_expr.include?('+')

    letters = puzzle.scan(/[A-Z]/).uniq
    return {} if letters.size > 10

    left_words = left_expr.split(' + ').map(&:strip)
    leading = (left_words + [result_word]).each_with_object({}) do |word, memo|
      memo[word[0]] = true if word.length > 1
    end

    assignments = {}
    used = {}
    solution = nil

    assign_digit = lambda do |ch, digit|
      assignments[ch] = digit
      used[digit] = true
    end

    unassign_digit = lambda do |ch, digit|
      assignments.delete(ch)
      used.delete(digit)
    end

    backtrack = nil
    assign_left = lambda do |left_letters, result_letter, sum, carry, col_idx, pos|
      if pos == left_letters.length
        total = sum + carry
        digit = total % 10
        next_carry = total / 10

        return digit.zero? && backtrack.call(col_idx + 1, next_carry) if result_letter.nil?

        if assignments.key?(result_letter)
          return assignments[result_letter] == digit && backtrack.call(col_idx + 1, next_carry)
        end

        return false if used[digit] || (digit.zero? && leading[result_letter])

        assign_digit.call(result_letter, digit)
        return true if backtrack.call(col_idx + 1, next_carry)

        unassign_digit.call(result_letter, digit)
        return false
      end

      ch = left_letters[pos]
      if assignments.key?(ch)
        return assign_left.call(left_letters,
                                result_letter,
                                sum + assignments[ch],
                                carry,
                                col_idx,
                                pos + 1)
      end

      10.times do |digit|
        next if used[digit] || digit.zero? && leading[ch]

        assign_digit.call(ch, digit)
        return true if assign_left.call(left_letters, result_letter, sum + digit, carry, col_idx, pos + 1)

        unassign_digit.call(ch, digit)
      end

      false
    end

    max_len = ([result_word.length] + left_words.map(&:length)).max
    columns = max_len.times.map { |idx| [left_words.map { |w| w[-1 - idx] }.compact, result_word[-1 - idx]] }
    backtrack = lambda do |col_idx, carry|
      if col_idx == columns.length
        return false unless carry.zero?

        solution = assignments.dup
        return true
      end

      left_letters, result_letter = columns[col_idx]
      assign_left.call(left_letters, result_letter, 0, carry, col_idx, 0)
    end

    backtrack.call(0, 0)
    solution || {}
  end
end
