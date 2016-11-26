%% @author schierin
%% @doc @todo Add description to functions3.


-module(functions3).

%% ====================================================================
%% API functions
%% ====================================================================
-export([greet/2, head/1, second/1, same/2, valid_time/1, right_age/1, help_me/1, compare_number/2, insert/2, warm/1]).

greet(male, Name) ->
	io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
	io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
	io:format("Hello, ~s!", [Name]).

head([H|_]) -> H.
second([_,X|_]) -> X.

same(X,X) ->
	true;
same(_,_) ->
	false.

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
	io:format("Date tuple (~p): ~p/~p/~p, ~n", [Date, Y,M,D]),
	io:format("Time tuple (~p): ~p/~p/~p, ~n", [Time, H,Min,S]);
valid_time(_) ->
	io:format("Wrong format ~n").

right_age(X) when X >= 18, X =< 100 ->
	true;
right_age(_) ->
	false.

help_me(Animal) ->
	Talk = if Animal == cat -> "meow";
			  Animal == beef -> "mooo";
			  Animal == dog -> "bark";
			  true -> "wrong"
		   end,
	{Animal, "says " ++ Talk ++ "!"}.

compare_number(X,Y) ->
	if X > Y -> "groesser";
	   X < Y -> "kleiner";
	   X == Y -> "gleich"
	end.

insert(X, []) ->
	[X];
insert(X, Set) ->
	case lists:member(X, Set) of
		true -> Set;
		false -> [X|Set]
	end.

warm(Temperature) ->
    case Temperature of 
        {celsius, N} when N >= 20, N =< 45 ->
			'celsius warm';
		{fahrenheit, N} when N >=68, N =< 113 ->
			'fahrenheit warm';
		_ ->
			'cold'
	end.

	


%% ====================================================================
%% Internal functions
%% ====================================================================


