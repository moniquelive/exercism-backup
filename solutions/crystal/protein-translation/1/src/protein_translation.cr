module ProteinTranslation
  def self.proteins(strand : String) : Array(String)
    tbl = {
    %w{AUG}	=> "Methionine",
    %w{UUU UUC}	=> "Phenylalanine",
    %w{UUA UUG}	=> "Leucine",
    %w{UCU UCC UCA UCG}	=> "Serine",
    %w{UAU UAC}	=> "Tyrosine",
    %w{UGU UGC}	=> "Cysteine",
    %w{UGG}	=> "Tryptophan",
    %w{UAA UAG UGA}	=> "STOP",
    }
    strand.chars.each_slice(3).map{|arr| arr.join("")}.each_with_object([] of String) do |codon, obj|
      pair = tbl.select { |k, _| k.includes?(codon) }
      raise ArgumentError.new if pair.empty?
      v = pair.to_a.first.last
      break obj if v == "STOP"
      obj << v
    end
  end
end
