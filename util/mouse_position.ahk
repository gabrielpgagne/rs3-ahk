#IfWinActive RuneScape

1:: ; you can add other modifier key fixes, 
	MouseGetPos, X, Y
	MsgBox, "X position %X%, Y position %Y%"
	Return