package Luhn;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

use strict;
use warnings;

sub is_luhn_valid ($number) {
    my $s = $number =~ s/\s+//gr;
    return 0 if length($s) <= 1 or $s =~ /\D/;
    
    my @digits = reverse split //, $s;
    my $sum = 0;
    
    for my $i (0..$#digits) {
        my $digit = 0 + $digits[$i];  # Convert to number
        if ($i % 2 == 1) {
            $digit *= 2;
            $digit -= 9 if $digit > 9;
        }
        $sum += $digit;
    }
    
    return $sum % 10 == 0;
}

1;