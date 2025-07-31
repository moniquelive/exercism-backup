using System;
using System.Linq;
using System.Text.RegularExpressions;

public static class PigLatin {
    public static string Translate(string phrase) {
        string Rules(string word) {
            Match r1 = Regex.Match(word, @"^([aeiou]|xr|yt|ay)");
            if (r1.Success)
                return word + "ay";

            Match r3 = Regex.Match(word, @"^([bcdfghjklmnpqrstvwxyz]*qu)");
            if (r3.Success) {
                string match = r3.Groups[1].Value;
                return word.Substring(match.Length) + match + "ay";
            }

            Match r4 = Regex.Match(word, @"^([bcdfghjklmnpqrstvwxyz]+)y");
            if (r4.Success) {
                string match = r4.Groups[1].Value;
                return word.Substring(match.Length) + match + "ay";
            }

            Match r2 = Regex.Match(word, @"^[bcdfghjklmnpqrstvwxyz]+");
            if (r2.Success) {
                string match = r2.Groups[0].Value;
                return word.Substring(match.Length) + match + "ay";
            }
            return word;
        }
        return string.Join(" ", phrase.Split(' ').Select(Rules));
    }
}