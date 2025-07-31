zebra_owner(Owner) :-
	houses(Hs),
	member(h(Owner,zebra,_,_,_), Hs).

water_drinker(Drinker) :-
	houses(Hs),
	member(h(Drinker,_,_,water,_), Hs).

houses(Houses) :-
	length(Houses, 5),                                            %  1
	member(h(english,_,_,_,red), Houses),                         %  2
	member(h(spanish,dog,_,_,_), Houses),                         %  3
	member(h(_,_,_,coffee,green), Houses),                        %  4
	member(h(ukrainian,_,_,tea,_), Houses),                       %  5
	adjacent(h(_,_,_,_,green), h(_,_,_,_,white), Houses),             %  6
	member(h(_,snake,winston,_,_), Houses),                       %  7
	member(h(_,_,kool,_,yellow), Houses),                         %  8
	Houses = [_,_,h(_,_,_,milk,_),_,_],                           %  9
	Houses = [h(norwegian,_,_,_,_)|_],                            % 10
	adjacent(h(_,fox,_,_,_), h(_,_,chesterfield,_,_), Houses),        % 11
	adjacent(h(_,_,kool,_,_), h(_,horse,_,_,_), Houses),              % 12
	member(h(_,_,lucky,juice,_), Houses),                         % 13
	member(h(japanese,_,kent,_,_), Houses),                       % 14
	adjacent(h(norwegian,_,_,_,_), h(_,_,_,_,blue), Houses),          % 15
	member(h(_,_,_,water,_), Houses),		% one of them drinks water
	member(h(_,zebra,_,_,_), Houses).		% one of them owns a zebra

adjacent(A, B, Ls) :- append(_, [A,B|_], Ls).
adjacent(A, B, Ls) :- append(_, [B,A|_], Ls).
