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
  	merge(mergesort(Left), mergesort(Right)).

merge([], Right) -> Right;
merge(Left, []) -> Left;

merge(Left = [L|Ls], Right=[R|Rs]) ->
  if L =< R ->
      [L | merge(Ls, Right)];
    L > R ->
      [R | merge(Left, Rs)]
  end.