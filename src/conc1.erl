%% @author schierin
%% @doc @todo Add description to conc1.


-module(conc1).
-compile(export_all).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).

count1() ->
	receive
		one -> io:format("Message: 1~n");
		two -> io:format("Message: 2~n");
		_ -> io:format("Message: ?~n")
	end.

count2() ->
    receive
        {From,one} -> From ! "Message: 1";
        {From,two} -> From ! "Message: 2";
        _ -> io:format("Message: ?~n")
    end.


count3() ->
	receive
        {From,one} -> 
			From ! "Message: 1",
			count3();
        {From,two} -> 
			From ! "Message: 2";
        _ -> io:format("Message: ?~n"),
			 count3()
    end.


%% ====================================================================
%% Internal functions
%% ====================================================================


