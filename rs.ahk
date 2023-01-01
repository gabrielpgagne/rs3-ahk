; ------------------------------------
; Env setup aka auto-execute section

#SingleInstance Force
#IfWinActive RuneScape

I_Icon = %A_ScriptDir%\res\rs.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%

is_in_chat := 0 ; Used to avoid sending macro while typing
default_wait_time := 30 ; Wait time for game's questionable bind detection [ms]
grico := 0 ; Indicates if pocket grico cbow is equipped

SetKeyDelay, defaultWaitTime, 0
SetControlDelay, -1
SetMouseDelay, -1

; ------------------------------------
; Functions

gricoCheck(){
	global
	if(grico = 1){
		ControlClick, x959 y980, A ; style prayer pos
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
	is_in_chat := !is_in_chat ; To be tested
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
	ExitApp

; ------------------------------------
; PVM Hotkeys

F9:: ; Brid armor switch
label_bridswitch:
	grico := 0
	SendInput, {F3}{F4}{F5}{F6}{F7}{F8}
	Return

F10:: ; switch to melee armor + equip cbow
	Gosub, label_bridswitch
	Sleep, default_wait_time
	Gosub, label_grico
	Return

^q:: ; 2H
	Keywait, q
	SendInput, ^q
	gricoCheck()
	Return

^w:: ; MH
	Keywait, w
	SendInput, ^w
	gricoCheck()
	Return
	
^e:: ; MH + OH
	KeyWait, e
	SendInput, ^w^e
	gricoCheck()
	Return

^r:: ; 2nd 2H
	KeyWait, r
	SendInput, ^r
	gricoCheck()
	Return

^t:: ; MH + Shield
	KeyWait, t
	SendInput, ^w^t
	gricoCheck()
	Return

^d:: ; 2nd MH + OH
	KeyWait, d
	SendInput, ^e^d
	gricoCheck()
	Return
	
^s:: ; MH + Flank
	KeyWait, s
	SendInput, ^w^s
	gricoCheck()
	Return

^v:: ; Pocket grico
label_grico:
	ControlClick, x1000 y978, A ; cbow pos
	if(grico = 0){
		ControlClick, x1702 y518, A ; range pray pos
	}
	grico := 1
	Return
	
^5:: ; Excal + MH
	Keywait, 5
	SendInput, ^w^5
	Return
	
^6:: ; Excal + MH
	Keywait, 6
	SendInput, ^6^5
	Return

+w:: ; Eat solid food
	KeyWait, w
	SendInput, +w
	Return

+e:: ; Sip brew
	KeyWait, e
	SendInput, +e
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

k:: ; SWH
	if(is_in_chat = 0){
		Send, ^6^5
		Sleep, default_wait_time
		Send, ,n
	}
	else{
		Send, k
	}
	Return