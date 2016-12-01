%% @author David
%% @doc @todo Add description to list_common.

-module(list_common).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).
-export([create_positive_number_beam/1]).
-export([create_negative_number_beam/1]).
-export([create_number_beam/2]).
-export([multiple/1]).
-export([ring_buffer/2]).
-export([droplast/1]).
-export([show_last/1]).
-export([split/2]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% Split list

split(N, List) -> split(N, List, []).

split(0, List, Acc)  -> {Acc, List};
split(N, [H|T], Acc) -> split(N-1, T, [H|Acc]).

%% Aufgabe 1
%% *
%% Umgekehrt
create_positive_number_beam(0) -> [];
create_positive_number_beam(N) when N > 0 -> create_positive_number_beam(N-1) ++ [N].

create_negative_number_beam(0) -> [];
create_negative_number_beam(N) when N < 0 -> create_negative_number_beam(N+1) ++ [N].

create_number_beam(F, T) when F > T -> [];
create_number_beam(F, T) when F =< T -> create_number_beam(F+1, T) ++ [F].

%% * TODO !!!
multiple(0) -> [];
multiple(N) -> multiple(N-1) ++ [N*(N-1)].

%% * RingBuffer
ring_buffer(N, List) -> droplast([N|List]).

droplast([_T])  -> [];
droplast([H|T]) -> [H|droplast(T)].

%% show last element TODO !!!
show_last([T]) -> T ;
show_last([H|T]) -> io:fwrite("List size: ~p\n", [erlang:length(T)]), [H|show_last(T)].