I_Icon = %A_ScriptDir%\res\solak.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%

#IfWinActive RuneScape

SetKeyDelay, 20, 0

=:: ; backwards tc + sc + omni
	Send zjm^f
	Return

/*=:: ; core auto+deto+db+vests
	SendInput, xc
	Sleep,20
	SendInput, q
	Sleep, 20
	SendInput, {F8}{F3}{F4}{F5}{F6}{F7}
	Return
*/
	
.:: ; double mine
	Send .
	Sleep, 50
	Send .
	Return

/*-:: ;forward tc + vuln + sc + wm
	SendInput {Insert}jmf
	Return
*/

-:: ; range mage start
	Send, {,}{Insert}mr
	Return