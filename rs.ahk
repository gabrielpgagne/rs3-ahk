#IfWinActive RuneScape

useImageSearch = 0 ; Set to 1 to use Image Search macros
grico = 0 ; indicates if pocket grico was used
spell = 0 ; 0=incite, 1=bb, 2=ruby

;F23::Ctrl
;F24::Shift

SetKeyDelay, 20, 0

F9:: ; Brid armor switch
	grico = 0
	Send {F8} {F3} {F4} {F5} {F6} {F7}
	Return

^q:: ; 2H
	Keywait q
	if(grico = 1){
		Send ^q ^=
		grico = 0
	}
	else{
		Send ^q
	}	
	Return

^w:: ; MH
	Keywait w
	if(grico = 1){
		Send ^w ^=
		grico = 0
	}
	else{
		Send ^w
	}
	Return
	
^e:: ; MH + OH
	KeyWait e
	if(grico = 1){
		Send ^w ^e ^=
		grico = 0
	}
	else{
		Send ^w ^e
	}
	Return

^r:: 
	Keywait r
	if(grico = 1){
		Send ^r ^=
		grico = 0
	}
	else{
		Send ^r
	}
	Return

^t:: ; MH + Defender (PF)
	KeyWait t
	if(grico = 1){
		Send ^w ^t ^=
		grico = 0
	}
	else{
		Send ^w ^t
	}
	Return

^d:: ; 2nd MH + OH
	KeyWait d
	if(grico = 1){
		Send ^d ^e ^=
		grico = 0
	}
	else{
		Send ^d ^e
	}
	Return
	
^s:: ; MH + Flank
	KeyWait s
	if(grico = 1){
		Send ^w ^s ^=
		grico = 0
	}
	else{
		Send ^w ^s
	}
	Return

^v:: ; Pocket grico
	KeyWait v
	if(grico = 0){
		Send ^v  ^-
	}
	else{
		Send ^v
	}
	grico = 1
	Return
	

^5:: ; Excal
	Keywait 5
	Send ^5
	Return
	
;6:: ; BD MH+OH + BD
;	Send ^6 ^5 {Control Up}
;	Sleep(25):
;	Send 6
;	Return

^6:: ; 
	Send ^6 ^5
	Return
	
^7:: ; SWH
	KeyWait Control
	Send ^6 ^5 {,} n
	Return
	
;+t:: ; SH swap + Res
;	KeyWait Shift
;	Send ^w ^t +t
;	Return
	
;+r:: ; SH swap + Divert
;	KeyWait Shift
;	Send ^w ^t +r
;	Return


`;:: ; Melos entangle
	Send {,} {`;} {.}
	Return

=:: ; backwards tc + sc + omni
	Send z j m ^f
	Return
	
.:: ; double mine
	Send .
	Sleep, 50
	Send .
	Return
		
-:: ; call familiar + spec
	MouseGetPos, X, Y
	BlockInput, MouseMove
	MouseClick, Left, 1713, 759, 1, 0
	MouseMove X, Y, 0
	BlockInput, MouseMoveOff
	Send {NumpadSub}
	Return

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
	
^3::
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
