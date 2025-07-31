unit module SecretHandshake;

sub handshake($number) is export {
    my @events = ('wink', 'double blink', 'close your eyes', 'jump');
    my @result = @events.kv.map(-> $i, $event {
        $event if $number +& (1 +< $i);
    }).grep(*.defined);

    $number +& 16 ?? @result.reverse !! @result;
}