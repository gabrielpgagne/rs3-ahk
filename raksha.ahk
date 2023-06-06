I_Icon = %A_ScriptDir%\res\raksha.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%
;return

#IfWinActive RuneScape

SetKeyDelay, 30, 0
SetMouseDelay, 30
SetControlDelay, 30
SetMouseDelay, -1
CoordMode, pixel, Screen
CoordMode, mouse, Screen

=:: ; SC + DW + freedom
	ImageSearch, X, Y, 1184, 853, 1472, 1001, *75 .\res\bolg.png
	if (ErrorLevel=0){
		BlockInput, MouseMove
		MouseGetPos, curX, curY
		MouseClick, Left, X, Y, 1
		MouseMove, curX, curY, 0
		BlockInput,  MouseMoveOff

		ControlClick, x1695 y520, A ; range pray click
		ControlClick, x925 y1016, A ; IOTH
		ControlClick, x890 y1020, A ; EOF spec
		ControlClick, x1744 y520, A ; mage pray click
	}
	Return


