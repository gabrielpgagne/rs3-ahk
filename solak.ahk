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

	; ------------------------------------
	; Hotkeys

	=:: ; Core macro
		Send, zjm^w^e
		ControlClick, x704 y942, A
	Return

	.:: ; double mine
		Send .
		Sleep, 50
		Send .
	Return

	-:: ; duo start, tc + sc + shard
		Send {Insert}m
		ControlClick, x1116 y865, A
	Return
