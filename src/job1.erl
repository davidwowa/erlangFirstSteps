%% @author David
%% @doc @todo Add description to job1.


-module(job1).

%% ====================================================================
%% API functions
%% ====================================================================
-export([create_list/1, create_list_B/1, multiples_B/1, ring_buffer/2, remove_last_element/3, tail_len/1, get_last_element/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% 1.
% -
create_list(N) -> create_list(N, []).
 
create_list(0, List) -> List;
create_list(N, List) when N > 0 -> create_list(N-1, [N|List]).

%% ???
create_list_B(N) -> create_list_B(N, N, []).
 
create_list_B(0, _, List) -> List;
create_list_B(N, Acc, List) when N > 0 -> create_list_B(N-1, Acc-1, [Acc-1|List]).

% -
multiples_B(N) -> multiples_B(N, 0, []).
% Acc is length of list 
multiples_B(_, 10, List) -> List;
multiples_B(N, Acc, List) when N > 0 -> multiples_B(N, Acc+1, [Acc * N|List]).

% -
ring_buffer(N, List) -> remove_last_element([N|List], [], tail_len(List)).

remove_last_element(_, L2, 0)  -> tail_reverse(L2);
remove_last_element([H|T], L, Acc) -> remove_last_element(T, [H|L], Acc-1).

% - last element
get_last_element(List) -> get_last_element(List, tail_len(List)).

get_last_element(List, 1) -> List;
get_last_element([_|T], Acc) -> get_last_element(T, Acc-1).

%% commons: examples from book
tail_len(L) -> tail_len(L,0).
 
tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T,Acc+1).

tail_reverse(L) -> tail_reverse(L,[]).
 
tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).