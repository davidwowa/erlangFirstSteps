%% @author David
%% @doc @todo Add description to numbersX.


-module(numbersX).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).
-export([fib/1, fibX/1, fib_list/1]).
-export([sum/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% Aufgabe 2
%% *

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N-1) + fib(N-2).

fibX(List) -> fib(hd(List)).

fib_list(0) -> 0;
fib_list(1) -> 1;
fib_list(N) ->
    fib_list(N + 1, [1,0]).

fib_list(End, [H|_]=L) when length(L) == End -> H;
fib_list(End, [A,B|_]=L) ->
    fib_list(End, [A+B|L]).

%% * Simple sum calculating
sum(0.0) -> 0.0;
sum(N) when N > 0 -> 1.0/N + sum(N - 1.0).