%% @author 

-module(merg_sort).

-import(io,[format/1]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([mergesort/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

mergesort([]) -> [];
mergesort(List) when is_list(List) -> 
	io:format("An~"),
	{Left, Right} = list_common:split(length(List) div 2, List),
	io:format("Dn~"),
  	merge(mergesort(Left), mergesort(Right)).

merge([], Right) -> Right;
merge(Left, []) -> Left;
merge(Left = [L|Ls], Right=[R|Rs]) ->
  if L =< R ->
      [L | merge(Ls, Right)];
    L > R ->
      [R | merge(Left, Rs)]
  end.