%% @author David
%% @doc @todo Add description to echo.


-module(echo).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0, loop/0]).

%% ====================================================================
%% Internal functions
%% ====================================================================
start() ->
spawn(echo, loop, []).
        loop() ->
            receive
{From, Message} -> From ! Message,
loop() end.

%% to use as Id = echo:start(), Id ! {self(), hello}.
%% think about messages sysntax in erlang "Pid ! message"
