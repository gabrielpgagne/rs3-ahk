I_Icon = %A_ScriptDir%\res\telos.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%
;return

#IfWinActive RuneScape

SetKeyDelay, 30, 0
SetControlDelay, -1
SetMouseDelay, -1
CoordMode, pixel, Screen
CoordMode, mouse, Screen

=:: ; SC + DW + freedom
	Send m^e^w+c
	Return
