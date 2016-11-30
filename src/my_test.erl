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
%% ---
-export([double/1]).
-export([fac/1]).
-export([listExample/6]).
-export([tail_recursive_fib/1]).
-export([list_create/1]).
-export([list_V/2]).

%% ====================================================================
%% Internal functions
%% ====================================================================
average(X) -> sum(X) / len(X).

fac(N) when N == 0 -> 1;
fac(N) when N > 0 -> N*fac(N - 1).

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

len([_|T]) -> 1 + len(T);
len([]) -> 0.

create_positive_number_beam(0) -> [];
create_positive_number_beam(N) when N > 0 -> create_positive_number_beam(N+1) ++ [N].

create_negative_number_beam(0) -> [];
create_negative_number_beam(N) when N < 0 -> create_negative_number_beam(N+1) -- [N].

create_number_beam(F, T) when F < T -> create_number_beam(F, T) ++ [F+1].

%% ------------------
double(X) -> 2 * X.

listExample(A, B, C, D, E, F) -> [A, B, C, D, E, F].

tail_recursive_fib(N) ->
    tail_recursive_fib(N, 0, 1, []).

tail_recursive_fib(0, _Current, _Next, Fibs) ->
    lists:reverse(Fibs);
tail_recursive_fib(N, Current, Next, Fibs) -> 
    tail_recursive_fib(N - 1, Next, Current + Next, [Current|Fibs]).

list_create(0)->[];
list_create(N) when N > 0 -> list_create(N-1) ++ [N].

list_V(0, 0)->[];
list_V(N, M) when N > 0, N < 101 -> add(M) ++ [M].

add(N) -> N + N.