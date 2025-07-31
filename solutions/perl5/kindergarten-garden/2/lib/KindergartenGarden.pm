package KindergartenGarden;
use v5.40;
use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

sub plants ( $diagram, $student ) {
    state $plants = { C => 'clover', G => 'grass', R => 'radishes', V => 'violets' };
    my ($row1, $row2) = split /\n/, $diagram;
    my $idx = 2 * (ord(substr($student, 0, 1)) - ord('A'));
    [map { $plants->{$_} } map { substr($_, $idx, 2) =~ /(.)(.)/ } ($row1, $row2)]
}

1;