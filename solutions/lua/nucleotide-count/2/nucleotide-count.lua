return {
  new = function(self, sequence)
    local c = { A = 0, C = 0, G = 0, T = 0 }
    sequence:gsub('.', function(n) c[n] = (c[n] or error('Invalid Sequence')) + 1 end)
    return setmetatable({ nucleotideCounts = c }, { __index = self })
  end,
  count = function(self, nucleotide)
    return self.nucleotideCounts[nucleotide] or error('Invalid Nucleotide')
  end
}
