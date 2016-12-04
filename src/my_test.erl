%% @author David
%% @doc @todo Add description to 'my_test'.

-module(my_test).
-import(io,[format/1]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([headX/1, prime/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

headX([]) -> [];
headX(List) -> io:fwrite("\n~w", [List]), headX(tl(List)).

prime(0) -> [0];
prime(N) when N > 0 -> prime_ext(N, 1).

prime_ext(N, X) when X >= N -> [];
prime_ext(N, X) when X < N -> [X + 1|prime_ext(N, X + 1)].