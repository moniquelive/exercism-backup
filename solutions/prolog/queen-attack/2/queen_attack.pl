:- use_module(library(clpfd)).

%! create(+DimTuple)
%
% The create/1 predicate succeeds if the DimTuple contains valid chessboard
% dimensions, e.g. (8,8).
create((DimX, DimY)) :-
  [DimX, DimY] ins 1..7.

%! attack(+FromTuple, +ToTuple)
%
% The attack/2 predicate succeeds if a queen positioned on ToTuple is
% vulnerable to an attack by another queen positioned on FromTuple.
attack((FromX, FromY), (ToX, ToY)) :-
  FromX =:= ToX, !;
  FromY =:= ToY, !;
  abs(FromX-ToX) =:= abs(FromY-ToY).
