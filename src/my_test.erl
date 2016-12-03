%% @author David
%% @doc @todo Add description to 'my_test'.

-module('my_test').
-import(io,[format/1]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([headX/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

headX([]) -> [];
headX(List) -> io:fwrite("\n~w", [List]), headX(tl(List)).