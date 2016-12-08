%% @author David
%% @doc @todo Add description to prime.
-module(prime).
%% ====================================================================
%% API functions
%% ====================================================================
-export([get_prime_numbers/1]).
%% ====================================================================
%% Internal functions
%% ====================================================================

get_prime_numbers(N) when is_number(N) ->
	get_prime_numbers(N, tl(tl(list_common:create_positive_number_list(N)))).

get_prime_numbers(MAX, [HEAD|TAIL]) when HEAD * HEAD =< MAX ->
	[HEAD | get_prime_numbers(MAX, [R || R <- TAIL, (R rem HEAD) > 0])];
get_prime_numbers(_, TAIL) -> TAIL.