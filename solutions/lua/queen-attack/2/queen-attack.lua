return function(pos)
  assert(pos.row >= 0 and pos.row <= 7 and pos.column >= 0 and pos.column <= 7)
  pos.can_attack = function(other)
    return pos.column == other.column or pos.row == other.row or
        math.abs(pos.row - other.row) == math.abs(pos.column - other.column)
  end
  return pos
end
