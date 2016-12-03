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
-export([tail_fac/1, headX/1]).
-export([countM/1, countP/1, countPX/1, multiples_in_shell/1]).

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

countPX(0) -> [0];
countPX(N) when N > 0 -> countPDX(N, 1).

countPDX(_, X) when X > 100 -> [];
countPDX(N, X) when X =< 100 -> io:fwrite("~w", [X]), [N * X |countPDX(N, X + 1)].

multiples_in_shell(0) -> [0];
multiples_in_shell(N) when N > 0 -> multiples_in_shell_ext(N, 1).

multiples_in_shell_ext(_, X) when X > 100 -> 0;
multiples_in_shell_ext(N, X) when X =< 100 -> io:fwrite("\nMultiples for ~w : ~w", [X, N * X]), multiples_in_shell_ext(N, X + 1).

headX(List) when 1 < size(List) -> io:fwrite("\n~w" + [List]), headX(tl(List)).

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