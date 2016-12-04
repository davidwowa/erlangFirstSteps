%% @author David
%% @doc @todo Add description to list_common.

-module(list_common).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).
-export([create_positive_number_list_reverse/1, create_positive_number_list/1]).
-export([multiples_as_list/1, multiples_in_shell/1]).
-export([ring_buffer/2]).
-export([show_last_element/1, get_last_element/1]).
% common exports
-export([split/2]).
-export([remove_last_element/1]).
-export([tail_reverse/1]).
-export([get_list_with_ranodm_numbers/2]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% generate list with random numbers 
get_list_with_ranodm_numbers(MaxRandomNumber, ListSize) -> 
	[rand:uniform(MaxRandomNumber) || _ <- lists:seq(1, ListSize)].

%% Split list
split(N, List) when 2 < length(List) -> 
	split(N, List, []);
split(_, List) when 2 == length(List) -> 
	{[hd(List)], tl(List)}.

split(0, List, Acc)  -> {Acc, List};
split(N, [H|T], Acc) -> 
%% 	io:fwrite("~w ~w ~w ~w\n", [N, H, T, Acc]), 
	split(N-1, T, [H|Acc]).

%% Aufgabe 1
%% *
% !!!This is not tail-recursive, and very slow, because list in erlang is a tree, an next example
% add element on last place in tree!!!
%% create_positive_number_beam(0) -> [];
%% create_positive_number_beam(N) when N > 0 -> create_positive_number_beam(N-1) ++ [N].

%% create_negative_number_beam(0) -> [];
%% create_negative_number_beam(N) when N < 0 -> create_negative_number_beam(N+1) ++ [N].

%% create_number_beam(F, T) when F > T -> [];
%% create_number_beam(F, T) when F =< T -> create_number_beam(F+1, T) ++ [F].

% Tail-recursive solution
create_positive_number_list_reverse(0) -> [0];
create_positive_number_list_reverse(N) when N > 0 -> [N|create_positive_number_list_reverse(N - 1)].

create_positive_number_list(0) -> [0];
create_positive_number_list(N) when N > 0 -> create_positive_number_list_ext(N, -1).

create_positive_number_list_ext(N, X) when X >= N -> [];
create_positive_number_list_ext(N, X) when X < N -> [X + 1|create_positive_number_list_ext(N, X + 1)].

% from book
tail_reverse(L) -> tail_reverse(L,[]).
 
tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).

%% * Multiples
multiples_as_list(0) -> [0];
multiples_as_list(N) when N > 0 -> multiples_as_list_ext(N, 1).

multiples_as_list_ext(_, X) when X > 100 -> [];
multiples_as_list_ext(N, X) when X =< 100 -> [N * X | multiples_as_list_ext(N, X + 1)].

multiples_in_shell(0) -> [0];
multiples_in_shell(N) when N > 0 -> multiples_in_shell_ext(N, 1).

multiples_in_shell_ext(_, X) when X > 100 -> 0;
multiples_in_shell_ext(N, X) when X =< 100 -> io:fwrite("\nMultiple for ~w : ~w", [X, N * X]), multiples_in_shell_ext(N, X + 1).

%% * RingBuffer
ring_buffer(N, List) -> remove_last_element([N|List]).

% is equal to is last element, if yes remove it
remove_last_element([_T])  -> [];
remove_last_element([H|T]) -> [H|remove_last_element(T)].

% * show last element
show_last_element([_T]) -> io:fwrite("\nLast element is ~w in list ", [_T]), _T;
show_last_element([H|T]) -> [H|show_last_element(T)].
% * get last element
get_last_element([_T]) when 1 == length([_T]) -> io:fwrite("Last element is ~c ", [_T]), _T;
get_last_element(List) -> get_last_element(tl(List)).