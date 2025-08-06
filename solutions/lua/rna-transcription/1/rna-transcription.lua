return function(dna)
  return dna:gsub(".", { A = 'U', C = 'G', G = 'C', T = 'A' })
end
