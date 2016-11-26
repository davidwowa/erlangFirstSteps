%% @author schierin
%% @doc @todo Add description to conc2.


-module(conc2).
-compile(export_all).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).

start(FoodList) ->
	spawn(?MODULE, fridge, [FoodList]).

fridge(FoodList) ->
	receive
		{From, {store, Food}} ->
			From ! {self(), ok},
			fridge([Food|FoodList]);
		{From, {take, Food}} ->
			case lists:member(Food, FoodList) of
				true ->
					From ! {self(), {ok, Food}},
					fridge(lists:delete(Food, FoodList));
				false ->
					From ! {self(), not_found},
					fridge(FoodList)
			end;
		terminate ->
			ok
	end.

store(Pid, Food) ->
	Pid ! {self(), {store, Food}},
	receive
		{Pid, Msg} -> Msg
	end.

take(Pid, Food) ->
	Pid ! {self(), {take, Food}},
	receive
		{Pid, Msg} -> Msg
	end.

store2(Pid, Food) ->
	Pid ! {self(), {store, Food}},
	receive
		{Pid, Msg} -> Msg
	after 3000 ->
		timeout
	end.

take2(Pid, Food) ->
	Pid ! {self(), {take, Food}},
	receive
		{Pid, Msg} -> Msg
	after 3000 ->
		timeout
	end.

important() ->
	receive
		{Priority, Message} when Priority > 10 ->
			[Message | important()]
	after 0 ->
		normal()
	end.
 
normal() ->
	receive
		{_, Message} ->
			[Message | normal()]
	after 0 ->
		[]
	end.


%% ====================================================================
%% Internal functions
%% ====================================================================


