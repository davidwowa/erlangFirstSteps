%% @author David
%% @doc @todo Add description to 'my_test'.


-module('my_test').

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).
-export([average/1]).
-export([create_positive_number_beam/1]).
-export([create_negative_number_beam/1]).
-export([create_number_beam/2]).

%% ====================================================================
%% Internal functions
%% ====================================================================
average(X) -> sum(X) / len(X).

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

len([_|T]) -> 1 + len(T);
len([]) -> 0.

create_positive_number_beam(0) -> [];
create_positive_number_beam(N) when N > 0 -> create_positive_number_beam(N+1) ++ [N].

create_negative_number_beam(0) -> [];
create_negative_number_beam(N) when N < 0 -> create_negative_number_beam(N+1) -- [N].

create_number_beam(F, T) when F < T -> create_number_beam(F, T) ++ [F+1].