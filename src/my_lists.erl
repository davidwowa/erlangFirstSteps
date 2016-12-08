%% @author David
%% @doc @todo Add description to my_lists.


-module(my_lists).

%% ====================================================================
%% API functions
%% ====================================================================
-export([get_integers_from_list/1, get_sublist_from/3]).
-export([get_integers_from_list_filter/1]).
-export([calculate_sum/1]).
-export([count_words/1, count_word/2]).
-export([count_char/2, adjust_text/1]).
-export([list_max_count_word/1]).
-export([count_words_clear/1, count_words_clearX/1]).
-export([get_most_frequent_words/2]).
-export([get_words_N/2]).
-export([heron_sqrt/1, heron_sqrt_ext/4]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% *
%% MyRadnomList = [1, 2, 3, "dsfsdf", 34, 45, "sdfsdfsdf", "sdfsdf", {1, 2, 3, "ABDD"}].
get_integers_from_list([]) -> [];
get_integers_from_list([H|T]) when is_integer(H) -> 
	[H|get_integers_from_list(T)];
get_integers_from_list([_|T]) -> 
	get_integers_from_list(T).

get_integers_from_list_filter([]) -> [];
get_integers_from_list_filter(List) when is_list(List) ->
	Filter = fun(X) -> is_integer(X) end,
	lists:filter(Filter, List).

%% * Party
calculate_sum([]) -> 0;
calculate_sum(List) when is_list(List) ->
	FilterKids = fun({_, Age}) -> Age < 11 end,
	FilterTeens = fun({_, Age}) -> Age >= 11 andalso Age < 18 end,
	FilterAdults = fun({_, Age}) -> Age >= 18 end,
	Kids = lists:filter(FilterKids, List),
	Teens = lists:filter(FilterTeens, List),
	Adults = lists:filter(FilterAdults, List),
	io:fwrite("\n Kinder : ~w, \n Teens: ~w, \n Adults : ~w", [Kids, Teens, Adults]),
	io:fwrite("\n Nr. Kinder : ~w, \n Nr. Teens: ~w, \n Nr. Adults : ~w", [length(Kids), length(Teens), length(Adults)]),
	io:fwrite("\n Kinder : ~w, \n Teens: ~w, \n Adults : ~w", [0, (length(Teens) * 5), (length(Adults) * 10)]),
	io:fwrite("\n Sum : ~w \n", [(length(Teens) * 5) + (length(Adults) * 10)]).

%% *
%% create sublist from list 
get_sublist_from(Start, End, List) when is_list(List) -> lists:sublist(List, Start, End).

%% Heron
heron_sqrt(0) -> 0;
heron_sqrt(N) -> heron_sqrt_ext(N, 10, 1.0, 0.0).

heron_sqrt_ext(N, Count, Is_init, Xn) when is_float(N) ->
	if 
		Is_init == 1 ->
			StartValue = 0.5 * (N + 1.0),
			heron_sqrt_ext(N, Count-1, 0, StartValue);
		true -> 
			if Count >= 0 ->
				   %% 				   math:sqrt(2) -> 1.4142135623730951
				   %% 					this alg 1.414213562373095 its not possible this to equal
				   
				   %% 					RealyValue = math:sqrt(N),
				   %% 					if
				   %% 						RealyValue == Xn -> io:fwrite("Result : ~w \n ", [N]),
				   %% 						   	heron_sqrt_ext(N, 0, 0, Xn);
				   %% 						true -> io:fwrite("~w \n", [Xn])
				   %% 					end,
				   Xnn = 0.5 * (Xn + (N/Xn)), 
				   io:fwrite("Xn = ~w \n ", [Xnn]),
				   heron_sqrt_ext(N, Count-1, 0, Xnn);
			   true -> io:fwrite("Result : ~w \n ", [Xn])
			end
	end.

%% Word
%% C:\\Users\\wdzak\\git\\erlangFirstSteps\\files\\TestText.txt
count_words([]) -> io:fwrite("ERROR: string is empty!\n");
count_words(String) when is_list(String) -> 
	io:fwrite("Number of words : ~w \n", [string:words(String)]),
	io:fwrite("Size of set of words : ~w \n", [sets:size(sets:from_list(string:tokens(String, " ")))]),
	Words = sets:to_list(sets:from_list(string:tokens(String, " "))),
	CalculatorReformer = fun(Str) -> {Str, count_word(String, Str)} end,
	lists:map(CalculatorReformer, Words).

count_words_clear([]) -> io:fwrite("ERROR: string is empty!\n");
count_words_clear(String) when is_list(String) -> 
	StringClear = adjust_text(String),
	Words = sets:to_list(sets:from_list(string:tokens(StringClear, " "))),
	CalculatorReformer = fun(Str) -> {Str, count_word(StringClear, Str)} end,
	io:fwrite("Number of words : ~w \n", [string:words(StringClear)]),
	io:fwrite("Size of set of words : ~w \n", [sets:size(sets:from_list(string:tokens(StringClear, " ")))]),
	lists:map(CalculatorReformer, Words).

count_words_clearX([]) -> io:fwrite("ERROR: string is empty!\n");
count_words_clearX(String) when is_list(String) -> 
	StringClear = adjust_text(String),
	Words = sets:to_list(sets:from_list(string:tokens(StringClear, " "))),
	CalculatorReformer = fun(Str) -> {Str, count_word(StringClear, Str)} end,
	io:fwrite("Number of words : ~w \n", [string:words(StringClear)]),
	%% 	io:fwrite("Size of set of words : ~w \n", [sets:size(sets:from_list(string:tokens(StringClear, " ")))]),
	lists:map(CalculatorReformer, Words).

count_word(String, Word) ->
	Filter = fun(X, N) when X =:= Word -> N + 1;
				(_, N) -> N
			 end,
	lists:foldl(Filter, 0, string:tokens(String, " ")).

count_char(String, Char) ->
	Filter = fun(X, N) when X =:= Char -> N + 1;
				(_, N) -> N
			 end,
	lists:foldl(Filter, 0, String).

%% Remove numbers ... from given text
adjust_text(Text) ->
	Text1 = re:replace(Text, "[0-9]+", "", [global, {return, list}]),
	re:replace(Text1, "[.|,|\\-|:|!|?|>|<]+", "", [global, {return, list}]).

%% * found on stackoverflow
list_max_count_word([]) -> list_is_empty;
list_max_count_word([H | T]) -> lists:foldl(fun erlang:max/2, H, T);
list_max_count_word(_) -> bad_argument.

%% most frequent words
get_most_frequent_words(0, []) -> list_is_empty;
get_most_frequent_words(N, Set)  when is_list(Set) ->
	SortFilter = fun({_, Count},{_, Count2}) -> Count >= Count2 end,
	lists:sublist(lists:sort(SortFilter, Set), N);
get_most_frequent_words(_, _) -> bad_arguments.

%% words N
get_words_N(0, []) -> list_is_empty_or;
get_words_N(N, List) when is_list(List) ->
	Filter = fun({_, Count}) -> Count >= N end,
	lists:filter(Filter, List);
get_words_N(_, _) -> bad_arguments.