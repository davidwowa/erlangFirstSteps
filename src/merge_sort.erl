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
	{Left, Right} = split(length(List) div 2, List),
%% 	io:fwrite("Left ~w  Right ~w\n ", [Left, Right]),
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

%% Split list
split(N, List) when 2 < length(List) -> 
	split(N, List, []);
split(_, List) when 2 == length(List) -> 
	{[hd(List)], tl(List)}.

split(0, List, Acc)  -> {Acc, List};
split(N, [H|T], Acc) -> 
	%% 	io:fwrite("~w ~w ~w ~w\n", [N, H, T, Acc]), 
	split(N-1, T, [H|Acc]).
