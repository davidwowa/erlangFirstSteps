%% @author David
%% @doc @todo Add description to numbersX.


-module(numbersX).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).
-export([sum1/1, sum/1, sum_interval/2]).
-export([fib/1, fibX/1, fib_list/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% Aufgabe 2
%% *

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N-1) + fib(N-2).

fibX(List) -> fib(tl(List)).

fib_list(0) -> 0;
fib_list(1) -> 1;
fib_list(N) ->
    fib_list(N + 1, [1,0]).

fib_list(End, [H|_]=L) when length(L) == End -> H;
fib_list(End, [A,B|_]=L) ->
    fib_list(End, [A+B|L]).

%% *

sum1(N) when N > 1 -> N + sum1(1/(N - 1));
sum1(1) -> 1.

sum(N) when N > 1 -> N + sum(N - 1);
sum(1) -> 1.

sum_interval(N, M) when N < M -> N + sum_interval(N + 1, M);
sum_interval(N, M) when N == M -> N;
sum_interval(N, M) when N > M -> {error, "N > M"}.