module ProteinTranslation

open System
open System.Collections.Generic

// Define the codon to protein map
let codonProteinMap = dict [
    "AUG", "Methionine"
    "UUU", "Phenylalanine"; "UUC", "Phenylalanine"
    "UUA", "Leucine"; "UUG", "Leucine"
    "UCU", "Serine"; "UCC", "Serine"; "UCA", "Serine"; "UCG", "Serine"
    "UAU", "Tyrosine"; "UAC", "Tyrosine"
    "UGU", "Cysteine"; "UGC", "Cysteine"
    "UGG", "Tryptophan"
    "UAA", "STOP"; "UAG", "STOP"; "UGA", "STOP"
]

// Function to translate a strand to proteins
let proteins (strand: string): string list =
    let rec helper codons acc =
        match codons with
        | [] -> acc
        | codon :: tail ->
            match codonProteinMap.TryGetValue(codon) with
            | (true, "STOP") -> acc
            | (true, protein) -> helper tail (protein :: acc)
            | _ -> raise (ArgumentException("Invalid codon."))
    
    strand
    |> Seq.chunkBySize 3
    |> Seq.map (fun arr -> String.Concat(arr))
    |> Seq.toList
    |> fun codons -> helper codons []
    |> List.rev

// Example usage
// let exampleStrand = "AUGUUUUAA"
// let result = proteins exampleStrand
// printfn "%A" result
