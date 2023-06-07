; ------------------------------------
; Env setup aka auto-execute section

#SingleInstance Force
#IfWinActive RuneScape

I_Icon = %A_ScriptDir%\res\rs.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%

is_in_chat := 0 ; Used to avoid sending macro while typing
default_wait_time := 40 ; Wait time for game's questionable bind detection [ms]
grico := 0 ; Pocket grico var
cbt_style := 1 ; by default == mage
spell = 0 ; 0=incite, 1=exsang, 2=ruby

SetKeyDelay, defaultWaitTime, 0
SetControlDelay, defaultWaitTime
SetMouseDelay, -1
CoordMode, pixel, Screen
CoordMode, mouse, Screen

; ------------------------------------
; On-screen locations for clicks and image searches

invy := {"x_left" : 1184, "y_top" : 852, "x_right" : 1472, "y_bottom" : 1000}

gear := {"x_left" : 1671, "y_top" : 888, "x_right" : 1917, "y_bottom" : 1034}

prayer := {"x_left" : 1670, "y_top" : 460, "x_right" : 1916, "y_bottom" : 542}

; ------------------------------------
; Functions

gricoCheck(){ ; Called at every weapon switch bind
	global
	if(grico = 1){ ; Pocket grico currently on
		if(cbt_style = 0){
			ControlClick, x1739 y524, A
		}
		else if(cbt_style = 1){
			ControlClick, x1885 y487, A
		}

		grico := 0
	}
	Return
}

; ------------------------------------
; Chatbox Hotkeys

Esc::
	Send, {Esc}
	is_in_chat := 0
Return

Enter::
	Send, {Enter}
	is_in_chat := !is_in_chat
Return

Tab::
	Send, {Tab}
	is_in_chat := 1
Return

; ------------------------------------
; Misc Hotkeys

^0:: ; Quit RS3, AHK and Alt1
	Process, Close, rs2client.exe
	Process, Close, Runeapps.Alt1.exe
	Process, Close, JagexLauncher.exe

	Loop {
		Process, Close, Autohotkey.exe
		If (ErrorLevel = 0)
			Break     ;No [more] matching processes found
		}

; ------------------------------------
; PVM Hotkeys

F9:: ; Brid armor switch
label_bridswitch:
	grico := 0
	SendInput, {F3}{F4}{F5}{F6}{F7}{F8}
Return

F10:: ; switch to melee armor then equip cbow
	Gosub, label_bridswitch
	cbt_style := 1
	grico := 1
	ControlClick, x998 y981, A ; cbow
	ControlClick, x1699 y520, A ; range pray click
Return

^q:: ; 2H
	Send, ^q
	gricoCheck()
Return

^w:: ; MH + OH
	Send, ^w^e
	gricoCheck()
Return

^e:: ; MH + OH
	Send, ^w^e
	gricoCheck()
Return

^r:: ; 2nd 2H
	Send, ^r
	gricoCheck()
Return

^t:: ; MH + Shield
	Send, ^w^t
	gricoCheck()
Return

^d:: ; 2nd MH + OH
	Send, ^e^d
	gricoCheck()
Return
/*
^s:: ; MH + Flank
	KeyWait, s
	SendInput, ^w^s
	gricoCheck()
	Return
*/

^v:: ; Pocket grico
	ImageSearch, X, Y, gear["x_left"], gear["y_top"], gear["x_right"], gear["y_bottom"], *50 .\res\mage_armor.png

	if(ErrorLevel = 1){ ; Not found so either melee or range

		ImageSearch, X, Y, gear["x_left"], gear["y_top"], gear["x_right"], gear["y_bottom"], *50 .\res\melee_armor.png

		if(ErrorLevel = 1){ ; Melee not found so range is active
			cbt_style := 2
		}
		else if(ErrorLevel = 2){
			ToolTip, "Could not find melee_armor.png in rs.ahk. Check paths."
		}
		else{ ; Melee found
			cbt_style := 1
		}
	}
	else if(ErrorLevel = 2){
		ToolTip, "Could not find mage_armor.png in rs.ahk. Check paths."
	}
	else{ ; Mage found
		cbt_style := 0
	}
	ControlClick, x998 y981, A ; cbow
	if(cbt_style != 2){ ; if not range style
		ControlClick, x1695 y520, A ; range pray click
	}
	grico := 1
Return

^b:: ; ice barr
	ControlClick, x1034 y984, A
Return

^5:: ; Excal + MH
	Send, ^w^5
Return

^6:: ; Excal + BD MH
	Send, ^6^5
Return

+w:: ; Eat solid food
	ControlClick, x962 y1019, A ; fish
Return

+e:: ; Sip brew
	ControlClick, x1003 y1018, A ; brew
Return

+t:: ; Reso + auto shield switch
	ControlClick, x706 y979, A ; wand pos
	ControlClick, x855 y977, A ; shield pos
	ControlClick, x1006 y834, A ; reso pos
Return

+r:: ; Divert + auto shield switch
	ControlClick, x706 y979, A ; wand pos
	ControlClick, x855 y977, A ; shield pos
	ControlClick, x1044 y830, A ; divert
Return

+s:: ; Reflect + auto shield switch
	ControlClick, x706 y979, A ; wand pos
	ControlClick, x855 y977, A ; shield pos
	ControlClick, x1005 y864, A ; reflect
Return

+x:: ; preparation + auto shield switch
	ControlClick, x706 y979, A ; wand pos
	ControlClick, x855 y977, A ; shield pos
	ControlClick, x1078 y830, A ; divert
Return

k:: ; SWH
	if(!is_in_chat){
		Send, ^6^5
		ControlClick, x925 y1016, A ; IOTH
		ControlClick, x890 y1020, A ; EOF spec
	}
	else{
		Send, k
	}
Return

u:: ; bb + dw switch + gconc yolo
	if(!is_in_chat){
		ControlClick, x1033 y943, A ; bb
		Send, ^e^w
		ControlClick, x710 y946, A ; IOTH
	}
	else{
		Send, u
	}
Return

^1:: ; Incite fear
	if(spell != 0){
		MouseGetPos, X, Y
		BlockInput, MouseMove
		MouseClick, Right, 1650, 1017, 1, 0
		MouseClick, Left
		MouseMove X, Y, 0
		BlockInput, MouseMoveOff
		spell = 0
	}
	Return

^2:: ; Exsang
	if(spell != 1){
		MouseGetPos, X, Y
		BlockInput, MouseMove
		MouseClick, Right, 1606, 1018, 1, 0
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
		MouseClick, Right, 1645, 945, 1, 0
		MouseClick, Left, 1651, 981, 1, 0
		MouseMove X, Y, 0
		BlockInput, MouseMoveOff
		spell = 2
	}
	Return
