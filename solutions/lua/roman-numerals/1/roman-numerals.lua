ROMAN_NUMERALS_MAP = {
  { 1000, 'M' }, { 900, 'CM' }, { 500, 'D' }, { 400, 'CD' }, { 100, 'C' }, { 90, 'XC' },
  { 50,   'L' }, { 40, 'XL' }, { 10, 'X' }, { 9, 'IX' }, { 5, 'V' }, { 4, 'IV' }, { 1, 'I' }
}

local function to_roman(n)
  if n < 1 then return '' end
  local k, v = nil, nil
  for _, t in ipairs(ROMAN_NUMERALS_MAP) do
    if n >= t[1] then
      k, v = table.unpack(t)
      break
    end
  end
  return v .. to_roman(n - k)
end

return { to_roman = to_roman }
