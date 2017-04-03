private ["_body","_playerNear","_name","_hisMoney","_myMoney"];

if (dayz_actionInProgress) exitWith {"You are already performing an action, wait for the current action to finish." call dayz_rollingMessages;};
dayz_actionInProgress = true;

_body = _this select 3;

if (isNull _body) exitWith {dayz_actionInProgress = false; systemChat "cursorTarget isNull!";};

_playerNear = {isPlayer _x} count ((getPosATL _body) nearEntities ["CAManBase", 10]) > 1;
if (_playerNear) exitWith {dayz_actionInProgress = false;localize "str_pickup_limit_5" call dayz_rollingMessages;};

_name = _body getVariable ["bodyName","unknown"];
_hisMoney = _body getVariable [Z_MoneyVariable,0];

if (isNil "_hisMoney") then { _hisMoney = 0;};
if (!(typeName _hisMoney == "SCALAR") || {_hisMoney < 1}) exitWith {dayz_actionInProgress = false; format ["%1 has no %2",_name,CurrencyName] call dayz_rollingMessages};

_myMoney = player getVariable [Z_MoneyVariable,0];
_myMoney = _myMoney + _hisMoney;

_body setVariable [Z_MoneyVariable,0,true];
player setVariable [Z_MoneyVariable,_myMoney,true];

systemChat format ["You took %1 %2, ID says %3!",[_hisMoney] call BIS_fnc_numberText,CurrencyName,_name];

player playActionNow "PutDown";
uiSleep 2;

dayz_actionInProgress = false;