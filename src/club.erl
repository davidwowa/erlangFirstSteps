%% @author David
%% @doc @todo Add description to club.

-module(club).
-include("club_records.hrl").
-include_lib("stdlib/include/qlc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([get_dict/1]).
-export([create_dummy_data_club/0]).
-export([save_data/1, add_user/2, remove_user/2]).
-export([create_test_user/0, create_test_user2/0, remove_test_user/0]).
-export([test/0]).
-export([lookup/1, lookup2/1]).
-export([create_dummy_data_club_M/0]).

%% ====================================================================
%% Internal functions
%% ====================================================================

create_dummy_data_club_M() ->
	#club{adress="Street 1, 12345 Town", users=create_dummy_data_users(), sporttypes=create_dummy_data_sports()},
	mnesia:create_schema([node()]),
	mnesia:start(),
	mnesia:create_table(user, [{attributes, record_info(id, name, age, adress, trait)}]),
	mnesia:create_table(sporttype, [{attributes, record_info(name, hours, price)}]),
	mnesia:create_table(club, [{attributes, record_info(adress, users, sporttypes)}]).

create_dummy_data_club() ->
	#club{adress="Street 1, 12345 Town", users=create_dummy_data_users(), sporttypes=create_dummy_data_sports()}.

create_dummy_data_users()->
	PartyUsers = file_handler:readlines_CSV("/Users/David/Documents/workspace/CC_Elrang/files/party.csv"),
%% 	PartyUsers = file_handler:readlines_CSV("C:\\Users\\wdzak\\git\\erlangFirstSteps\\files\\party.csv"),
	AddUuid = fun({Name, Age}) -> [#user{id = uuid:to_string(uuid:v4()), name=Name, age=Age, adress=random_adress(),trait=random_trait()}] end,
	lists:flatmap(AddUuid, PartyUsers).

create_dummy_data_sports() ->
	[#sporttype{name="Karate", hours=2, price=10},
	 #sporttype{name="Aikido", hours=3, price=20},
	 #sporttype{name="Krav Maga", hours=4, price=30},
	 #sporttype{name="Sleep", hours=1, price=40},
	 #sporttype{name="Hapkido", hours=6, price=50},
	 #sporttype{name="Kendo", hours=3, price=60},
	 #sporttype{name="Kung-Fu", hours=4, price=70}].

random_trait()->
	List = [student, retired, adult, child],
	Idx = rand:uniform(length(List)),
	lists:nth(Idx, List).

random_adress()->
	List = file_handler:readlines_CSV_A("/Users/David/Documents/workspace/CC_Elrang/files/us-500.csv"),
%% 	List = file_handler:readlines_CSV_A("C:\\Users\\wdzak\\git\\erlangFirstSteps\\files\\us-500.csv"),
	Idx = rand:uniform(length(List)),
	lists:nth(Idx, List).

save_data(CC_Club) -> 
	file:write_file("/Users/David/Documents/workspace/CC_Elrang/files/cc-club0.txt", io_lib:fwrite("~p.\n", [CC_Club])).

add_user(User, Users) ->
	lists:merge([User], Users).

remove_user(User, Users) ->
	lists:delete(User, Users).

create_test_user() ->
	Data = create_dummy_data_club(),
	User = #user{id="test", name="TEST", age=230, adress="TEST", trait=adult},
	Dat = Data#club{users = lists:merge([User], Data#club.users)},
	save_data(Dat), Dat.

create_test_user2() ->
	Data = create_dummy_data_club(),
	User = #user{id="test", name="TEST", age=230, adress="TEST", trait=adult},
	Dat = Data#club{users = lists:merge([User], Data#club.users)},
	Dat.

remove_test_user() ->
	Data = create_dummy_data_club(),
	User = #user{id="test", name="TEST", age=230, adress="TEST", trait=adult},
	io:fwrite("add user"),
	Dat0 = Data#club{users = lists:merge([User], Data#club.users)},
	io:fwrite("delete user"),
	Dat1 = Dat0#club{users = lists:delete(User, Dat0#club.users)},
	save_data(Dat1), Dat1.

lookup(Name) ->
	Data = create_dummy_data_club(),
	lists:keysearch(Name, #user.name, Data#club.users).

lookup2(List) ->
	Data = create_dummy_data_club(),
	lists:keysort(List, Data#club.users).


test() -> Data = create_dummy_data_club(),
		  Data#club.users.

%% Word-Counter Ext.
get_dict(List) when is_list(List) ->
	dict:from_list(List).