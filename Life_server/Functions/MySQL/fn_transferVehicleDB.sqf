/*
	Author: Nick Brown
	Description: Transfer vehicle in db
	["76561198114868726","2"] remoteExecCall ["DB_fnc_transferVehicleDB"];
*/
private["_pid","_vid","_query"];
_pid = [_this,0,"",[""]] call BIS_fnc_param;
_vid = [_this,1,"",[""]] call BIS_fnc_param;
if(_pid == "" OR _vid == "") exitWith {diag_log("Transfer not correct!");};
diag_log("Transfer!It executed!");

_query = format["transferVehicle:%1:%2",_pid,_vid];
waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;