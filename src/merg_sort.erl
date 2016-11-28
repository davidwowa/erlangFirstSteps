%% @author 

-module(merg_sort).

%% ====================================================================
%% API functions
%% ====================================================================
-export([mergesort/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

mergesort([]) -> [];
mergesort(List) when is_list(List) -> 
	{Left, Right} = split(length(List) div 2, List),
  	merge(mergesort(Left), mergesort(Right)).

split(N, List) -> split(N, List, []).
split(0, List, Acc)  -> {Acc, List};
split(N, [H|T], Acc) -> split(N-1, T, [H|Acc]).

merge([], Right) -> Right;
merge(Left, []) -> Left;
merge(Left = [L|Ls], Right=[R|Rs]) ->
  if L =< R ->
      [L | merge(Ls, Right)];
    L > R ->
      [R | merge(Left, Rs)]
  end.