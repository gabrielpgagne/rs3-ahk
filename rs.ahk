I_Icon = %A_ScriptDir%\res\rs.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%

#IfWinActive RuneScape

grico = 0 ; indicates if pocket grico was used
spell = 0 ; 0=incite, 1=bb, 2=ruby, 4=ice barr

SetKeyDelay, 20, 0

^0:: ; Quit RS3, especially useful for fullscreen mode
	Process, Close, rs2client.exe
	Return

F9:: ; Brid armor switch
label_bridswitch:
	grico = 0
	SendInput {F8}{F3}{F4}{F5}{F6}{F7}
	Return

F10:: ; switch to melee armor + equip cbow
	Gosub, label_bridswitch
	Sleep, 25
	Gosub, label_grico
	Return


^q:: ; 2H
	Keywait q
	if(grico = 1){
		SendInput ^q^=
		grico = 0
	}
	else{
		SendInput ^q
	}	
	Return

^w:: ; MH
	Keywait w
	if(grico = 1){
		SendInput ^w^=
		grico = 0
	}
	else{
		SendInput ^w
	}
	Return
	
^e:: ; MH + OH
	KeyWait e
	if(grico = 1){
		SendInput ^w^e^=
		grico = 0
	}
	else{
		SendInput ^w^e
	}
	Return

^r:: 
	KeyWait r
	if(grico = 1){
		SendInput ^r^=
		grico = 0
	}
	else{
		SendInput ^r
	}
	Return

^t:: ; MH + Defender (PF)
	KeyWait t
	if(grico = 1){
		SendInput ^w^t^=
		grico = 0
	}
	else{
		SendInput ^w^t
	}
	Return

^d:: ; 2nd MH + OH
	KeyWait d
	if(grico = 1){
		SendInput ^d^e^=
		grico = 0
	}
	else{
		SendInput ^d^e
	}
	Return
	
^s:: ; MH + Flank
	KeyWait s
	if(grico = 1){
		SendInput ^w^s^=
		grico = 0
	}
	else{
		SendInput ^w^s
	}
	Return

^v:: ; Pocket grico
label_grico:
	KeyWait v
	if(grico = 0){
		SendInput ^v^-
	}
	else{
		SendInput ^v
	}
	grico = 1
	Return
	

^5:: ; Excal
	Keywait 5
	SendInput ^5
	Return
	
;6:: ; BD MH+OH + BD
;	SendInput ^6^5{Control Up}
;	Sleep(25):
;	SendInput 6
;	Return

^6:: ; 
	SendInput ^6^5
	Return
	
^7:: ; SWH
	KeyWait Control
	SendInput ^6^5{,}n
	Return
	
;+t:: ; SH swap + Res
;	KeyWait Shift
;	SendInput ^w^t+t
;	Return
	
;+r:: ; SH swap + Divert
;	KeyWait Shift
;	SendInput ^w^t+r
;	Return

/*
-:: ; call familiar + spec
	MouseGetPos, X, Y
	BlockInput, MouseMove
	MouseClick, Left, 1713, 759, 1, 0
	MouseMove X, Y, 0
	BlockInput, MouseMoveOff
	SendInput {NumpadSub}
	Return
*/

^1:: ; Incite fear
	if(spell != 0){
		MouseGetPos, X, Y
		BlockInput, MouseMove
		MouseClick, Right, 1655, 1057, 1, 0
		MouseClick, Left
		MouseMove X, Y, 0
		BlockInput, MouseMoveOff
		spell = 0
	}
	Return

^2:: ; bb
	if(spell != 1){
		MouseGetPos, X, Y
		BlockInput, MouseMove
		MouseClick, Right, 1545, 1057, 1, 0
		MouseClick, Left
		MouseMove X, Y, 0
		BlockInput, MouseMoveOff
		spell = 1
	}
	Return
	
^3:: ; Ruby
	if(spell != 2){
		MouseGetPos, X, Y
		BlockInput, MouseMove
		MouseClick, Right, 1652, 988, 1, 0
		MouseClick, Left, 1652, 1027, 1, 0
		MouseMove X, Y, 0
		BlockInput, MouseMoveOff
		spell = 2
	}
	Return
	
^4:: ; ice barr
	if(spell != 3){
		MouseGetPos, X, Y
		BlockInput, MouseMove
		MouseClick, Right, 1585, 1057, 1, 0
		MouseClick, Left
		MouseMove X, Y, 0
		BlockInput, MouseMoveOff
		spell = 3
	}
	Return
