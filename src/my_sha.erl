%% @author David
%% @doc @todo Add description to my_sha.


-module(my_sha).

%% ====================================================================
%% API functions
%% ====================================================================
-export([sha_hex/1]).
-export([find_count_of_zeros/1, generate_sha/3]).

%% ====================================================================
%% Internal functions
%% ====================================================================

generate_sha(_, Context, 0) -> 
	Digest = crypto:hash_final(Context),
	lists:flatten(list_to_hex(binary:bin_to_list(Digest)));
generate_sha(Value, Context, Count) ->
	New_context = crypto:hash_update(Context, Value),
	Diggest = crypto:hash_final(New_context),
	io:fwrite("B: ~w \n", [Diggest]),
	List = lists:flatten(list_to_hex(binary:bin_to_list(Diggest))),
	io:fwrite("L: ~w \n", [List]),
	generate_sha(Value, New_context, Count-1).

%% find zero in binary
find_count_of_zeros(Binary) when is_list(Binary) ->
	io:fwrite("sha: ~w \n", [Binary]),
	find_count_of_zeros_ext(Binary, 0).

find_count_of_zeros_ext([H|T], Count) ->
%% 	io:fwrite("count: ~w \n", [Count]),
	if
		H == 0 -> find_count_of_zeros_ext(T, Count + 1);
		true -> find_count_of_zeros_ext(T, Count)
	end;
find_count_of_zeros_ext(_T, Count) -> io:fwrite("count: ~w \n", [Count]).

%% See http://sacharya.com/tag/integer-to-hex-in-erlang/
sha_hex(S) ->
	SHA_bin =  crypto:hash(sha256, S),
	SHA_list = binary_to_list(SHA_bin),
	lists:flatten(list_to_hex(SHA_list)).

list_to_hex(L) ->
	lists:map(fun(X) -> int_to_hex(X) end, L).

int_to_hex(N) when N < 256 ->
	[hex(N div 16), hex(N rem 16)].
hex(N) when N < 10 ->
	$0+N;
hex(N) when N >= 10, N < 16 ->
	$a + (N-10).