%% @author David
%% @doc @todo Add description to my_lists.


-module(my_lists).

%% ====================================================================
%% API functions
%% ====================================================================
-export([get_integers_from_list/1, get_price/1, get_sublist_from/3]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% *
%% MyRadnomList = [1, 2, 3, "dsfsdf", 34, 45, "sdfsdfsdf", "sdfsdf", {1, 2, 3, "ABDD"}].
get_integers_from_list([]) -> [];
get_integers_from_list([H|T]) when is_integer(H) -> 
	[H|get_integers_from_list(T)];
get_integers_from_list([_|T]) -> 
	get_integers_from_list(T).

%% * TODO
get_price(X) when X>10 andalso X=<17 -> 5;
get_price(X) when X>17 -> 10;
get_price(_) -> 0.

%% lists:filter(fun ([K | _ ]) -> {A, B} = K, io:fwrite("~w ", [B]) end, Party).
%% use filter

%% *
%% create sublist from list 
get_sublist_from(Start, End, List) when is_list(List) -> lists:sublist(List, Start, End).

%% Heron TODO

%% 