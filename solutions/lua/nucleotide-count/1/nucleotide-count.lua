local DNA = {}

function DNA:new(sequence)
  assert(sequence:match('[^ACGT]') == nil, 'Invalid Sequence')
  local c = { A = 0, C = 0, G = 0, T = 0 }
  sequence:gsub('.', function(n) c[n] = c[n] + 1 end)
  return setmetatable({ nucleotideCounts = c }, { __index = self })
end

function DNA:count(nucleotide)
  assert(nucleotide:match('[ACGT]'), 'Invalid Nucleotide')
  return self.nucleotideCounts[nucleotide]
end

return DNA
