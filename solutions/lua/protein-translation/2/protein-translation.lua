local function translate_codon(codon)
  return ({
    ["AUG"] = "Methionine",
    ["UUU"] = "Phenylalanine", ["UUC"] = "Phenylalanine",
    ["UUA"] = "Leucine", ["UUG"] = "Leucine",
    ["UCU"] = "Serine", ["UCC"] = "Serine", ["UCA"] = "Serine", ["UCG"] = "Serine",
    ["UAU"] = "Tyrosine", ["UAC"] = "Tyrosine",
    ["UGU"] = "Cysteine", ["UGC"] = "Cysteine",
    ["UGG"] = "Tryptophan",
    ["UAA"] = "STOP", ["UAG"] = "STOP", ["UGA"] = "STOP"
  })[codon] or error()
end

local function translate_rna_strand(rna_strand)
  local ret = setmetatable({}, { __index = table })
  for codon in rna_strand:gmatch("...") do
    local trans = translate_codon(codon)
    if trans == 'STOP' then break end
    ret:insert(trans)
  end
  return ret
end

return { codon = translate_codon, rna_strand = translate_rna_strand }
