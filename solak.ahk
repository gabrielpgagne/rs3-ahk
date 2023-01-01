; ------------------------------------
; Env setup aka auto-execute section

#SingleInstance Force
#IfWinActive RuneScape

I_Icon = %A_ScriptDir%\res\solak.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%

SetKeyDelay, 30, 0
SetControlDelay, -1
SetMouseDelay, -1

invy_x_left = 100 ; Use img_coord_finder.ahk
invy_y_top = 100  ; to set inventory position
invy_x_right = 800
invy_y_bot = 800

; ------------------------------------
; Hotkeys

=:: ; Legs / core macro. Changes dynamically if skips/casuals
	ImageSearch, X, Y, invy_x_left, invy_y_top, invy_x_right, invy_y_bot, %A_WorkingDir%\res\crystal_bow.png, *2 
	if(ErrorLevel = 1){ ; Couldn't find Crystal Bow. Non-skips
		ToolTip, Didn't find C Bow ; debug
		Send, zm^f
	}
	else{ ; Found crystal Bow, so macro turns into legs deto release
		ToolTip, Found C Bow, %X%, %Y% ; debug
		Send, xcq{F3}{F4}{F5}{F6}{F7}{F8}
	}
	Return
	
.:: ; double mine
	Send .
	Sleep, 50
	Send .
	Return

/*-:: ;forward tc + vuln + sc + wm
	SendInput {Insert}jmf
	Return
*/
