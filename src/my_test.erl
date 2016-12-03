%% @author David
%% @doc @todo Add description to 'my_test'.

-module('my_test').
-import(io,[format/1]).
-import(list_common, [create_number_beam/2]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).
-export([tail_recursive_fib/1]).
-export([tail_fac/1]).
-export([countM/1, countP/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

% io:write([N]),
countM(0) -> [0];
countM(N) when N > 0 -> [N|countM(N - 1)].

countP(0) -> [0];
countP(N) when N > 0 -> countPD(N, -1).

countPD(N, X) when X >= N -> [];
countPD(N, X) when X < N -> [X + 1|countPD(N, X + 1)].




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