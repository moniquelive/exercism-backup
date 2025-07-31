proc abbreviate {input} {
    set input [regsub -all {[-_]+} $input " "] ;# Replace hyphens with spaces
    set words [split $input " "]
    set result ""

    foreach word $words {
        if {$word eq ""} {continue} ;# Skip empty words
        set acr [acronyms $word]
        append result [string range $acr 0 0]
    }
    return [string toupper $result]
}

proc acronyms {word} {
    regsub -all {[^A-Za-z0-9]} $word "" cleanedWord ;# Remove non-alphanumeric characters
    if {[string is upper $cleanedWord]} {
        return [string range $cleanedWord 0 0]
    } else {
        return [string toupper [string index $word 0]][string range $word 1 end]
    }
}
