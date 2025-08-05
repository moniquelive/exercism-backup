return function(pos)
  assert(pos.row >= 0 and pos.row <= 7 and pos.column >= 0 and pos.column <= 7)
  return {
    pos = pos,
    can_attack = function(other)
      return pos.column == other.pos.column or
          pos.row == other.pos.row or
          math.abs(pos.row - other.pos.row) == math.abs(pos.column - other.pos.column)
    end
  }
end
