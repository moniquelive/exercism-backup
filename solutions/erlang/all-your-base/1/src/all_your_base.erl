-module(all_your_base).

-export([rebase/3]).

rebase(_, InputBase, _) when InputBase < 2 -> {error, "input base must be >= 2"};
rebase(_, _, OutputBase) when OutputBase < 2 -> {error, "output base must be >= 2"};
rebase(Digits, InputBase, OutputBase) ->
    case lists:all(fun(X) -> X >= 0 andalso X < InputBase end, Digits) of
        false -> {error, "all digits must satisfy 0 <= d < input base"};
        true ->
            Decimal = to_int(Digits, InputBase, 0),
            case Decimal of
                0 -> {ok, [0]};
                _ -> {ok, to_base(Decimal, OutputBase, [])}
            end
    end.

to_int([], _, Acc) -> Acc;
to_int([D | T], B, Acc) -> to_int(T, B, Acc * B + D).

to_base(0, _, Acc) -> Acc;
to_base(N, B, Acc) -> to_base(N div B, B, [N rem B | Acc]).