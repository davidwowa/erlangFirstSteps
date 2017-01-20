%% @author David
%% @doc @todo Add description to job2.


-module(job2).

%% ====================================================================
%% API functions
%% ====================================================================
-export([fib/1, for/1]).
-export([sum/1, sum2/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% Aufgabe 2
%% * Fibonacci I29
fib(0) -> 0;
fib(1) -> 1;
fib(2) -> 1;
fib(N) -> fib(N-1) + fib(N-2).

%% From https://www.tutorialspoint.com/erlang/erlang_quick_guide.htm
%% For-loop over Fibonacci
for(0) -> []; 
for(N) when N > 0 -> [fib(N)|for(N-1)]. 

%% * Simple sum calculating
sum(0.0) -> 0.0;
sum(N) when N > 0 -> 1.0/N + sum(N - 1.0).

sum2(0) -> 0;
sum2(N) when N > 0 -> 1/N + sum2(N - 1).