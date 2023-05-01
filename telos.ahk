I_Icon = %A_ScriptDir%\res\telos.ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%
;return

#IfWinActive RuneScape

SetKeyDelay, 30, 0
SetControlDelay, 25
SetMouseDelay, -1
CoordMode, pixel, Screen
CoordMode, mouse, Screen

=:: ; SC + DW + freedom
	ControlClick, x1033 y1018, A ; sc
	ControlClick, x704 y980, A ; mh
	ControlClick, x745 y979, A ; oh
	ControlClick, x940 y832, A ; freedom
	Return

-:: ; Ice auto + deto + gconc
	ControlClick, x1035 y982, A ; ice auto
	ControlClick, x1069 y942, A ; deto
	ControlClick, x706 y979, A ; wand pos
	ControlClick, x742 y977, A ; orb
	ControlClick, x709 y940, A ; gconc*/
	Return

+m:: ; cade + turtling switch
	ControlClick, x1309 y792, A ; leg
	ControlClick, x706 y979, A ; wand pos
	ControlClick, x855 y977, A ; shield pos
	ControlClick, x1080 y863, A ; cade
	Return
