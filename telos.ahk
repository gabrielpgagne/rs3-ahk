I_Icon = %A_ScriptDir%\res\telos.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%
;return

#IfWinActive RuneScape

SetKeyDelay, 20, 0

`;:: ; Melos entangle
	Send {,}{`;}{.}
	Return
