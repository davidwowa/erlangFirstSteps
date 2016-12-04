%% @author David
%% @doc @todo Add description to numbersX.

-module(numbersX).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).
-export([fib/1, for/2]).
-export([sum/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% Aufgabe 2
%% * Fibonacci I29

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N-1) + fib(N-2).

%% From https://www.tutorialspoint.com/erlang/erlang_quick_guide.htm
%% For-loop over Fibonacci
for(0, _) -> []; 
for(N, _) when N > 0 -> 
	[fib(N)|for(N-1,fib(N))]. 

%% * Simple sum calculating, point is realy important
sum(0.0) -> 0.0;
sum(N) when N > 0 -> 
	1.0/N + sum(N - 1.0).