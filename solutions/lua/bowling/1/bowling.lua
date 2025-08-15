return function()
  local R = setmetatable({}, { __index = table })

  local function at(i) return R[i] or 0 end
  local function strike(i) return R[i] == 10 end
  local function need(i, n) return i + n - 1 <= #R end

  -- anda pelos frames 1..9 (valida soma ≤10 quando não for strike)
  local function jump9()
    local i, f = 1, 1
    while f <= 9 do
      if not need(i, 1) then return i, false end
      if strike(i) then
        i = i + 1
      else
        if not need(i, 2) then return i, false end
        assert(at(i) + at(i + 1) <= 10, ">10 no frame")
        i = i + 2
      end
      f = f + 1
    end
    return i, true -- i = início do 10º
  end

  -- valida e detecta término do 10º frame
  local function tenth_done(i)
    if not need(i, 1) then return false end
    local a, b, c = at(i), R[i + 1], R[i + 2]
    if a == 10 then
      if not (b and c) then return false end
      if b ~= 10 then assert(b + c <= 10, "fill do 10º >10") end
      return true
    elseif b and a + b == 10 then
      return c ~= nil
    elseif b and a + b < 10 then
      return true
    end
    assert(not b or a + b <= 10, ">10 no 10º")
    return false
  end

  local function completo()
    local i, ok9 = jump9()
    return ok9 and tenth_done(i)
  end

  local function pontuacao()
    local s, i = 0, 1
    for f = 1, 10 do
      if strike(i) then
        s = s + 10 + at(i + 1) + at(i + 2)
        i = i + 1
      else
        local a, b = at(i), at(i + 1)
        if f < 10 then assert(a + b <= 10, ">10 no frame") end
        s = s + (a + b == 10 and (10 + at(i + 2)) or (a + b))
        i = i + 2
      end
    end
    return s
  end

  local function valida(p)
    assert(p >= 0 and p <= 10, "pins 0..10")
    local i, ok9 = jump9()
    if not ok9 then
      -- ainda nos 1..9: se for a 2ª bola do frame, valida soma
      if need(i, 1) and not strike(i) and not need(i, 2) then assert(R[i] + p <= 10, "duas bolas >10") end
      return
    end
    -- 10º frame
    local a, b = R[i], R[i + 1]
    if not a then return end
    if a == 10 then
      if b and b ~= 10 then assert(b + p <= 10, "fill do 10º >10") end
      return
    end
    if not b then return assert(a + p <= 10, "duas bolas >10") end
    assert(a + b == 10, "jogo acabou")
  end

  return {
    roll  = function(p)
      valida(p)
      R:insert(p)
    end,
    score = function()
      assert(completo(), "jogo incompleto")
      return pontuacao()
    end
  }
end
