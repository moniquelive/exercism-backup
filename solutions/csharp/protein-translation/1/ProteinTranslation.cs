using System;
using System.Collections.Generic;
using System.Linq;

public static class ProteinTranslation
{
    private static readonly Dictionary<string, string> CodonProteinMap = new Dictionary<string, string>
    {
        {"AUG", "Methionine"},
        {"UUU", "Phenylalanine"}, {"UUC", "Phenylalanine"},
        {"UUA", "Leucine"}, {"UUG", "Leucine"},
        {"UCU", "Serine"}, {"UCC", "Serine"}, {"UCA", "Serine"}, {"UCG", "Serine"},
        {"UAU", "Tyrosine"}, {"UAC", "Tyrosine"},
        {"UGU", "Cysteine"}, {"UGC", "Cysteine"},
        {"UGG", "Tryptophan"},
        {"UAA", "STOP"}, {"UAG", "STOP"}, {"UGA", "STOP"}
    };

    public static List<string> Proteins(string strand)
    {
        var proteins = new List<string>();

        foreach (var codon in Enumerable.Range(0, strand.Length / 3).Select(x => strand.Substring(x * 3, 3)))
        {
            var protein = CodonProteinMap.FirstOrDefault(kvp => kvp.Key == codon).Value;

            if (string.IsNullOrEmpty(protein))
            {
                throw new ArgumentException("Invalid codon.");
            }

            if (protein == "STOP")
            {
                break;
            }

            proteins.Add(protein);
        }

        return proteins;
    }
}
