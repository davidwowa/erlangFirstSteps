%% @author 

-module(merge_sort).
-import(io,[format/1]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([mergesort/1, merge/2]).
%% ====================================================================
%% Internal functions
%% ====================================================================

mergesort([]) -> [];
mergesort(List) when is_list(List) ->
	{Left, Right} = list_common:split(length(List) div 2, List),
	io:fwrite("Left ~w  Right ~w\n ", [Left, Right]),
	if
		length(Left) >=2 ->
			merge(mergesort(Left), mergesort(Right));
		true ->
			merge(Left, Right)
	end.

merge([], Right) -> Right;
merge(Left, []) -> Left;

merge([L|Lt], Right=[R|_]) when L =< R -> 
	[L|merge(Lt, Right)];
merge(Left = [L|_], [R|Rt]) when L > R -> 
	[R|merge(Left, Rt)].