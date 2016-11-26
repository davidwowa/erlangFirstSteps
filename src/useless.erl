%% @author schierin
%% @doc @todo Add description to useless.


-module(useless).
-export([add/2, hello/0, greet_and_add_two/1, hello_import/0]).
-import(io,[format/1]).

%% ====================================================================
%% API functions
%% ====================================================================

%% Add two integers
add(A,B) ->
	A + B.
%% Write "Hello world" on the console
hello() ->
    io:format("Hello, world!~n").
 
%% Combine the two functions
greet_and_add_two(X) ->
    hello(),
    add(X,2).

%% Import nutzen
hello_import() ->
	format("Hello, import~n").

%% ====================================================================
%% Internal functions
%% ====================================================================


