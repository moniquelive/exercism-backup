Function Get-Acronym() {
    <#
    .SYNOPSIS
    Get the acronym of a phrase.

    .DESCRIPTION
    Given a phrase, return the string acronym of that phrase.
    "As Soon As Possible" => "ASAP"
    
    .PARAMETER Phrase
    The phrase to get the acronym from.
    
    .EXAMPLE
    Get-Acronym -Phrase "As Soon As Possible"
    #>
    [CmdletBinding()]
    Param (
        [string]$Phrase
    )
    # Replace "-" with " " and split the text into words
    $words = $Phrase.Replace("_", "").Replace("-", " ").Split(" ", [StringSplitOptions]::RemoveEmptyEntries)

    $acronym = foreach ($word in $words) {
        # Convert the first letter to uppercase
        $capitalFirst = $word.Substring(0,1).ToUpper() #+ $word.Substring(1)

        # If all letters are uppercase, take the first letter; otherwise, take the word
        if ($capitalFirst -cmatch '^[A-Z]+$') {
            $capitalFirst[0]
        } else {
            $capitalFirst
        }
    }

    # Concatenate the results, filtering for uppercase letters only
    -join ($acronym | ForEach-Object { $_ -replace '[^A-Z]', '' })
}

