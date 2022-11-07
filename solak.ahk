I_Icon = %A_ScriptDir%\res\solak.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%

#IfWinActive RuneScape

SetKeyDelay, 20, 0

=:: ; backwards tc + sc + omni
	SendInput zjm^f
	Return
	
.:: ; double mine
	Send .
	Sleep, 50
	Send .
	Return

-:: ;forward tc + vuln + sc + wm
	Send {Insert}jmf
	Return