%% @author schierin
%% @doc @todo Add description to functions9.


-module(functions9).
-compile(export_all).

-record(robot, {name, 
				type=industrial, 
				hobbies, 
				details=[]}).

-record(person, {name, phone, address}).
-record(user, {id, name, group, age}).

%% ====================================================================
%% API functions
%% ====================================================================
-export([]).


first_robot() ->
	#robot{name="Mechatron",
		   type=handmade,
		   details=["Describe the Details"]}.

person_1() -> 
     #person{name="Müller", phone=12345, address="Hauptstrasse 4"}.

%% Pattern Matching im Funktions-Kopf als Filter
admin_panel(#user{name=Name, group=admin}) ->
	Name ++ " is allowed";
admin_panel(#user{name=Name}) ->
	Name ++ " is not allowed".

%% Bindungen im Funktions-Kopf und Guards
adult_section(U = #user{}) when U#user.age >= 18 ->
	allowed;
adult_section(_) ->
	forbidden.

repairman(Rob) -> 
    Details = Rob#robot.details,
	NewRob = Rob#robot{details=["Repaired by repairman" | Details]},
	{repaired, NewRob}.

%% ====================================================================
%% Internal functions
%% ====================================================================


