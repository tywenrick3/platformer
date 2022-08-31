/// @description Insert description here
// You can write your code in this editor
x += hspd_move * dir;

if (x <=position_from || x >= position_to) {
	dir *= -1;	
}

