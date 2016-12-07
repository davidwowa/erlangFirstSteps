%% @author David
%% @doc @todo Add description to file_handler.


-module(file_handler).

%% ====================================================================
%% API functions
%% ====================================================================
-export([readlines_CSV/1, readlines/1, readlinesB/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% from http://www2.erlangcentral.org/wiki/?title=Read_File_to_List
readlines_CSV(FileName) ->
    {ok, Device} = file:open(FileName, [read]),
    get_all_lines_CSV(Device, []).
 
get_all_lines_CSV(Device, Accum) ->
    case io:get_line(Device, "") of
        eof  -> file:close(Device), Accum;
        Line -> Spl = string:sub_string(Line, 1, string:len(Line)-1),
				Idx = string:cspan(Spl, ";"),
				String1 = string:sub_string(Spl, 1, Idx),
				String2 = string:sub_string(Spl, Idx, string:len(Spl)),
				String3 = re:replace(String2, ";", ""),
				Al = erlang:binary_to_integer(tl(tl(String3))),
			[{erlang:list_to_atom(String1), Al} | get_all_lines_CSV(Device, Accum)]
    end.

readlinesB(FileName) ->
    {ok, Device} = file:open(FileName, [read]),
    get_all_linesB(Device, []).
 
get_all_linesB(Device, Accum) ->
    case io:get_line(Device, "") of
        eof  -> file:close(Device), Accum;
        Line -> LineMinus = string:sub_string(Line, 4, string:len(Line)),
			string:concat(LineMinus, get_all_linesB(Device, Accum)) 
    end.

readlines(FileName) ->
    {ok, Device} = file:open(FileName, [read]),
    get_all_lines(Device, []).
 
get_all_lines(Device, Accum) ->
    case io:get_line(Device, "") of
        eof  -> file:close(Device), Accum;
        Line -> string:concat(Line, get_all_lines(Device, Accum)) 
    end.