package KindergartenGarden;
use v5.40;
use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

sub plants ( $diagram, $student ) {
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
    );

    my @rows = split /\n/, $diagram;
    my $student_index = 2 * (index("ABCDEFGHIJKLMNOPQRSTUVWXYZ", substr($student, 0, 1)));

    my @result;
    for my $row (@rows) {
        push @result, $plants{substr($row, $student_index, 1)};
        push @result, $plants{substr($row, $student_index + 1, 1)};
    }

    return \@result;
}

1;