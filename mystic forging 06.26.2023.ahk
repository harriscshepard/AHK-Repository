#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;Gw2 Mystic Forging, Alt+Tilda double click				
!`::				
Click, 2				
return				
				
;Ctrl+Tilda Autoclick				
$^`::				
While GetKeyState("~","p"){				
Send ^{Click}
sleep 100				
			
}				
return				
				
!1::				
MouseMove, 52,0,100,R				
return				
				
				
;Go to 'Forge', 286,300->640,673	MouseMove, 385, 415,100,R		
;Go to 'Forge', 286,300->630,670	MouseMove, 345, 375,100,R			
!2::				
MouseMove, 345, 375,100,R			
return				
				
;Go to '1st Slot',640,673->137,300	
;Go to '1st Slot',640,673->137,300			
!3::				
;MouseMove, 592,300,100				
;MouseMove, -541,-415,100,R				
MouseMove, -501,-375,100,R				
return				
				
;T6 Promotion				
;goto refill 635->535				
!q::			
MouseMove, -100,0,100,R				
return	
				
!w::				
MouseMove, 100,0,100,R				
return			