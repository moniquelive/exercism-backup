module Gigasecond exposing (add)

import Time


add : Time.Posix -> Time.Posix
add timestamp =
    let
        giga_in_ms =
            10 ^ (9 + 3)

        timestamp_in_ms =
            Time.posixToMillis timestamp

        sum_in_ms =
            timestamp_in_ms + giga_in_ms
    in
    Time.millisToPosix sum_in_ms
