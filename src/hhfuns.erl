%% @author David
%% @doc @todo Add description to hhfuns.


-module(hhfuns).
-compile(export_all).
 
one() -> 1.
two() -> 2.
 
add(X,Y) -> X() + Y().
%% Now open the Erlang shell, compile the module and get going:

%% 1> c(hhfuns).
%% {ok, hhfuns}
%% 2> hhfuns:add(one,two).
%% ** exception error: bad function one
%% in function  hhfuns:add/2
%% 3> hhfuns:add(1,2).
%% ** exception error: bad function 1
%% in function  hhfuns:add/2
%% 4> hhfuns:add(fun hhfuns:one/0, fun hhfuns:two/0).
%% 3