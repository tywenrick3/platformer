// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_game(){

/// @description Insert description here
// You can write your code in this editor

//Make a save array
var	_saveData = array_create(0);

//For every instance, create a struct and add it to the array

with(oRubyCollectable)
{
	var _saveEntity = 
	{
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		collected : collected,
		currentRoom : room
	}
	array_push(_saveData, _saveEntity);
	
}

with(obj_player)
{
	var _saveEntity = 
	{
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		rubies : rubies,
		currentRoom : room
	}
	array_push(_saveData, _saveEntity);
	
}

with(pEnemy)
{
	var _saveEntity = 
	{
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		currentRoom : room
	}
	array_push(_saveData, _saveEntity);
	
}

//Turn the data into a JSON and save it via a buffer

var _string = json_stringify(_saveData);
var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "save.sav");
buffer_delete(_buffer);

}