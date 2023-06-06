#IfWinActive RuneScape

#SingleInstance force

#Persistent

;https://www.autohotkey.com/board/topic/99539-variable-within-string-variable/

; comment the next line if you want to see x,y as window relative coords

CoordMode, mouse, Screen
CoordMode, pixel, Screen


SetTimer, show, 10

return



show:

  MouseGetPos, x, y

  tooltip, x: %x%`, y: %y%

  return