				
				
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.				
#Warn  ; Enable warnings to assist with detecting common errors.				
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.				
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.				
SetMouseDelay 100	




;F3 Middle Mouse
;F3::MButton

;Scrollwheel disable
;WheelUp::
;return"WheelUp""WheelUp""WheelUp""WheelUp""WheelUp""WheelUp"

;WheelDown::
;return

;Triple Click with Copy and Alt tab, Alt+c
!c::
Click 3
Send, ^c
Sleep 100
Send {Alt down}{tab}
Send {Alt up}
return

;Paste with Enter Key and Alt tab, Alt+v
!v::
Click 1
Send, ^v
Send, {Enter}
Sleep 100
Send {Alt down}{tab}
Send {Alt up}
return

;Ctrl+Tilda Autoclick				
$^`::				
While GetKeyState("~","p"){				
Send ^{Click}
sleep 100				
			
}				
return				
	
;Windowskey->ctrl
LWin::
Send, ^
return

;ctrl+esc->esc
^Esc::
Send, Esc
return

;Alt+Tilda double click				
!`::
Click, 2				
return		








