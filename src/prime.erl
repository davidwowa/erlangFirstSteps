%% @author David
%% @doc @todo Add description to prime.
-module(prime).
%% ====================================================================
%% API functions
%% ====================================================================
-export([get_prime_numbers/1, get_prime_number_B/1]).
%% ====================================================================
%% Internal functions
%% ====================================================================

get_prime_numbers(N) when is_number(N) ->
	get_prime_numbers(N, tl(tl(list_common:create_positive_number_list(N)))).

get_prime_numbers(MAX, [HEAD|TAIL]) when HEAD * HEAD =< MAX ->
	[HEAD | get_prime_numbers(MAX, [R || R <- TAIL, (R rem HEAD) > 0])];
get_prime_numbers(_, TAIL) -> TAIL.

get_prime_number_B(N) -> get_prime_number_B(job1:tail_len(job1:create_list(N)), job1:create_list(N)).

get_prime_number_B(0, L) -> L;
get_prime_number_B(Acc, [H|T]) -> get_prime_number_B(Acc-1, [H|[R || R <- T, (R rem H) > 0]]).