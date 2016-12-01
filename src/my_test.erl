%% @author David
%% @doc @todo Add description to 'my_test'.

-module('my_test').
-import(io,[format/1]).
-import(list_common, [create_number_beam/2]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).
-export([fac/1]).
-export([tail_recursive_fib/1]).
-export([tail_fac/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================
fac(N) when N == 0 -> 1;
fac(N) when N > 0 -> N*fac(N - 1).

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

tail_recursive_fib(N) ->
    tail_recursive_fib(N, 0, 1, []).
tail_recursive_fib(0, _Current, _Next, Fibs) ->
    lists:reverse(Fibs);
tail_recursive_fib(N, Current, Next, Fibs) -> 
    tail_recursive_fib(N - 1, Next, Current + Next, [Current|Fibs]).

tail_fac(N) -> tail_fac(N,1).
tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1,N*Acc).