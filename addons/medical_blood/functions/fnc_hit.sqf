/*
 * Author: Glowbal
 * Handle unit hit eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: caused by <OBJECT>
 * 2: damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_causedBy", "_damage"];

if (isNull _causedBy) exitWith { // won't be able to calculate the direction properly, so instead we pick something at random
    [QGVAR(spurt), [_unit, random 360, _damage]] call CBA_fnc_serverEvent;
};

// Calculate bulletDirection
private _unitPos = getPosASL _unit;
private _causedByPos = getPosASL _causedBy;

private _bulletDir = ((_unitPos select 0) - (_causedByPos select 0)) atan2 ((_unitPos select 1) - (_causedByPos select 1));

[QGVAR(spurt), [_unit, _bulletDir, _damage]] call CBA_fnc_serverEvent;