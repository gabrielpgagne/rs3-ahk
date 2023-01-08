; ------------------------------------
; Env setup aka auto-execute section

#SingleInstance Force
#IfWinActive RuneScape

I_Icon = %A_ScriptDir%\res\rs.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%


is_in_chat := 0 ; Used to avoid sending macro while typing
default_wait_time := 30 ; Wait time for game's questionable bind detection [ms]
grico := 0 ; Pocket grico var
cbt_style := 1 ; by default == mage

SetKeyDelay, defaultWaitTime, 0
SetControlDelay, -1
SetMouseDelay, -1
CoordMode, pixel, Screen
CoordMode, mouse, Screen

; ------------------------------------
; On-screen locations for clicks and image searches

invy := {"x_left" : 1184, "y_top" : 852, "x_right" : 1472, "y_bottom" : 1000}

gear := {"x_left" : 1671, "y_top" : 888, "x_right" : 1917, "y_bottom" : 1034}

prayer := {"x_left" : 1671, "y_top" : 470, "x_right" : 1916, "y_bottom" : 542}

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
	ExitApp

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
	if(grico = 0){ ; Don't execute needlessly
		ImageSearch, X, Y, prayer["x_left"], prayer["y_top"], prayer["x_right"], prayer["y_bottom"], C:\Users\darko\Desktop\ahk_rs\res\mage_pray_active.png

		if(ErrorLevel = 1){ ; Not found so either melee or range	
			
			ImageSearch, X, Y, prayer["x_left"], prayer["y_top"], prayer["x_right"], prayer["y_bottom"], C:\Users\darko\Desktop\ahk_rs\res\melee_pray_active.png
			
			if(ErrorLevel = 1){ ; Melee not found so range is active
				cbt_style := 2
			}
			else{ ; Melee found
				cbt_style := 1
			}
		}

		else{ ; Mage found
			cbt_style := 0
		}

		ControlClick, x998 y981, A ; cbow
		if(cbt_style != 2){ ; if not range style
			ControlClick, x1695 y520, A ; range pray click
		}
		grico := 1
	}
	Return
	
^5:: ; Excal + MH
	Keywait, 5
	SendInput, ^w^5
	Return
	
^6:: ; Excal + BD MH
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