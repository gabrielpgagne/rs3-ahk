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

; ------------------------------------
; On-screen locations for clicks and image searches

invy := {
	"x_left" : 100,
	"y_top" : 100,
	"x_right" : 800,
	"y_bottom" : 800
}

gear := {
	"x_left" : 100,
	"y_top" : 100,
	"x_right" : 800,
	"y_bottom" : 800
}

prayer := {
	"x_left" : 100,
	"y_top" : 100,
	"x_right" : 800,
	"y_bottom" : 800
}

melee_pray := { ; center coord
	"x" : 1500,
	"y" : 518
}

range_pray := { ; center coord
	"x" : 1500,
	"y" : 518
}

mage_pray := { ; center coord
	"x" : 1500,
	"y" : 518
}

pray_wrapper := [
	mage_pray, ; style 0
	melee_pray ; style 1
]

cbow := { ; pocket grico location
	"x" : 1700,
	"y" : 500
}

; ------------------------------------
; Functions

gricoCheck(){ ; Called at every weapon switch bind
	if(grico = 1){ ; Pocket grico currently on
		if(cbt_style != 2){
			Random, x, pray_wrapper[cbt_style]["x"]-5, pray_wrapper[cbt_style]["x"]+5
			Random, y, pray_wrapper[cbt_style]["y"]-5, pray_wrapper[cbt_style]["y"]+5
			ControlClick, x%x% y%y%, A
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
	if(grico = 0){ ; Don't execute needlessly
		
		ImageSearch, X, Y, mage_pray["x"]-10, mage_pray["x"]+10, mage_pray["y"]-10, mage_pray["y"]+10, "./res/mage_pray_active.png"
		
		if(!IsSet(X)){ ; Not found so either melee or range	
			
			ImageSearch, X, Y, melee_pray["x"]-10, melee_pray["x"]+10, melee_pray["y"]-10, melee_pray["y"]+10, "./res/melee_pray_active.png"
			
			if(!IsSet(X)){ ; Melee not found so range is active
				cbt_style := 2
			}
			else{ ; Melee found
				cbt_style := 2
			}
		}

		else{ ; Mage found
			cbt_style := 0
		}

		Random, x, 1695, 1705
		Random, y, 495, 505
		ControlClick, x%x% y%y%, A ; random cbow click
		if(cbt_style != 2){ ; if not range style
			Random, x, 1510, 1520
			Random, y, 510, 520
			ControlClick, x%x% y%y%, A ; range pray click
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