#IfWinActive RuneScape

SetKeyDelay 20,0 ; Do not change

; ! = alt, ^ = control, + = shift

; the line below means: 
; WHEN ALT+Q is detected:
;	WAIT for q to be released
;	SEND ALT+q Input

; This macro fixes RuneScape's modifier key bug where if you unpress Mod (ctrl/shift/alt) key before the key, the game will register : (Mod + key) -> (key)

!q:: ; you can add other modifier key fixes
	KeyWait q
	Send !q {Alt Up}
	Return