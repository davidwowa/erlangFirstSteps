%% @author David
%% @doc @todo Add description to job1.


-module(job1).

%% ====================================================================
%% API functions
%% ====================================================================
-export([create_list/1, create_list_B/1, multiples/1, multiples_B/1, ring_buffer/2]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% 1.
% -
create_list(N) -> create_list(N, []).
 
create_list(0, List) -> List;
create_list(N, List) when N > 0 -> create_list(N-1, [N|List]).

%% PLAN B

create_list_B(N) -> create_list_B(N, N, []).
 
create_list_B(0, _, List) -> List;
create_list_B(N, Acc, List) when N > 0 -> create_list_B(N-1, Acc-1, [Acc-1|List]).

% -
multiples(0) -> [0];
multiples(N) when N > 0 -> multiples(N, 1).

multiples(N, X) when X =< 100 -> [N * X | multiples(N, X + 1)].

%% PLAN B

multiples_B(N) -> multiples_B(N, 0, []).
 
multiples_B(_, 10, List) -> List;
multiples_B(N, Acc, List) when N > 0 -> multiples_B(N, Acc+1, [Acc * N|List]).

% -
ring_buffer(N, List) -> remove_last_element([N|List]).

% is equal to is last element, if yes remove it
remove_last_element([_T])  -> [];
remove_last_element([H|T]) -> [H|remove_last_element(T)].

% PLAN B
