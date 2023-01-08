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
CoordMode, pixel, Screen
CoordMode, mouse, Screen

invy_x_left = 1186 ; Use img_coord_finder.ahk
invy_y_top = 854  ; to set inventory position
invy_x_right = 1472
invy_y_bot = 1000

; ------------------------------------
; Hotkeys

=:: ; Legs / core macro. Changes dynamically if skips/casuals
	ImageSearch, X, Y, invy_x_left, invy_y_top, invy_x_right, invy_y_bot, *100 C:\Users\darko\Desktop\ahk_rs\res\crystal_bow.png
	if(ErrorLevel = 1){ ; Couldn't find Crystal Bow. Non-skips
		Send, zjm^f
	}
	else{ ; Found crystal Bow, so macro turns into legs deto release
		/*ControlClick, x1038 y936, A
		ControlClick, x1068 y944, A
		ControlClick, x671 y946, A
		*/
		Send, xcq
		Sleep, 50
		Send, {F3}{F4}{F5}{F6}{F7}{F8}
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
