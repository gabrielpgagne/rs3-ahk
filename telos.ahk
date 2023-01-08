I_Icon = %A_ScriptDir%\res\telos.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%
;return

#IfWinActive RuneScape

SetKeyDelay, 30, 0

=:: ; SC + DW + freedom
	Send m
	Send ^e^w
	Return
