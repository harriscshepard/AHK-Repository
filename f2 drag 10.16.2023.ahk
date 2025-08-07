#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Initialize
GoSub, Init

F2::
	
	if(current_state == "STATE_IDLE")
	{
		current_state = STATE_DRAGGING
		Send {Click, down}
		
	}
	While(current_state == "STATE_DRAGGING")
	{
		
		key_is_down := GetKeyState("F2")
		if(!key_is_down)
		{
			current_state = STATE_IDLE
			Send {Click, up}
		}
		Sleep 20
	}
	
	sleep 20
	



return

Subroutine:
return

Constants:
;	STATE_DRAGGING = 1
;	STATE_IDLE = 0
return

Init:
	GoSub, Constants
	current_state = STATE_IDLE
return