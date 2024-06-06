#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;Seek and Copy Image Link in Discord
;Directions: 
;	Hover mouse to the right of the Discord embed
;	Press F3
;	Image link copied to clipboard with an alt+tab for easy pasting
;Specifications:
;	Scans for the color (Discord's embed border color): 0x312D2B
;	Moves to the left by: SCAN_INCREMENT
;	Moves until it finds another color
;	Right clicks then moves to open link x=x+220,y=850
;Colors:
;	Discord BG normal: 0x383331
;	Discord BG highlighted: 0x35302E
;	Discord Embed Border: 0x312D2B

;Author: Harris C Shepard
;Date Modified: 06-06-24


GoSub, Init

F3::
	GoSub, getPos	;x1,y1
	scan_option := SCAN_RAW
	GoSub, Scan
	
	;scan_option := SCAN_PICTURE
	;GoSub, Scan
	
	GoSub, ClickOpenLinkRaw
	GoSub, AltTab
	
return

F4::
	GoSub, getPos
	GoSub, getColor
	Send % color
return

Constants:
	SCAN_INCREMENT := 20 ;pixels
	SCAN_BORDER := 0	;scan options
	SCAN_PICTURE := 1
	SCAN_RAW := 2
	SLEEP_INCREMENT := 50	;pixels
return

Init:
	GoSub, Constants
	scan_option := SCAN_BORDER

return


getPos:
	MouseGetPos, x1, y1
return

getColor:
	PixelGetColor, color, x1, y1
return

Scan:
	if(scan_option == SCAN_BORDER)
	{
		goSub, ScanLeftEmbedBorder
	}
	else if(scan_option == SCAN_RAW)
	{
		
		goSub, ScanLeftRaw
	}
	else
	{
		
		goSub, ScanLeftPicture
	}
return

ClickOpenLink:
	MouseMove x1, y1, 100
	Sleep SLEEP_INCREMENT
	Send {Click, Right}
	Sleep SLEEP_INCREMENT
	y1 := 850	;right click menu has fixed y1
	x1 := x1 + 220
	MouseMove x1, y1, 100
	Send {Click}
	Sleep SLEEP_INCREMENT
return

ClickOpenLinkRaw:
	MouseMove x1, y1, 100
	Sleep SLEEP_INCREMENT
	Send {Click, Right}
	Sleep SLEEP_INCREMENT
	y1 := 850	;right click menu has fixed y1
	x1 := x1 + 220
	if(x1 > 1450)
	{
		x1 = 1450	;discord has a max x1
	}
	MouseMove x1, y1, 100
	Send {Click}
	Sleep SLEEP_INCREMENT
return

AltTab:
	Send {Alt down}{tab}
	Send {Alt up}
	Sleep SCAN_INCREMENT
return

ScanLeftEmbedBorder:
	found = 0	;0 is false in ahk
	While(found == false)
	{
		x1 := x1 - SCAN_INCREMENT	;colon equals for numbers
		if(x1 < 0)
		{
			found = -1
			;send % color
			
		}
		else
		{
			GoSub, getColor
			if(color == 0x312D2B)
			{
				found:= x1
				;Send b
			}
		}
	}
return

;For images not in an embed
ScanLeftRaw:
	found = 0	;0 is false in ahk
	While(found == false)
	{
		x1 := x1 - SCAN_INCREMENT	;colon equals for numbers
		if(x1 < 0)
		{
			found = -1
			;send % color
			
		}
		else
		{
			GoSub, getColor
			if((color != 0x383331) && (color != 0x35302E) && (color != 0x312D2B))
			{
				found:= x1
				;Send % color
			}
		}
	}
return



ScanLeftPicture: 
	found = 0	;0 is false in ahk
	While(found == false)
	{
		x1 := x1 - SCAN_INCREMENT	;colon equals for numbers
		if(x1 < 0)
		{
			found = -1
			;send d
			
		}
		else
		{
			GoSub, getColor
			if(color != 0x312D2B)
			{
				found:= x1
				;Send % x1
			}
		}
	}
return