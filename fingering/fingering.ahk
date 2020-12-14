#singleinstance, force
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ clip_image @@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;----------------
;-- parameter ---
;----------------
Hotkey, LAlt  & sc039 , CreateCapWindow , On  ;<------------------    Adjust the hotkey value to suit your needs / wants 
Hotkey, sc15d & n , CreateCapWindow, On
Hotkey, tab & Lalt, CreateCapWindow, On
;clip capture screen
Hotkey, sc056  & sc039 , CreateCapWindow , On  ;<------------------    Adjust the hotkey value to suit your needs / wants 
Hotkey, tab & sc056, CreateCapWindow, On
;hotkey, rbutton &  mbutton , CreateCapWindow, On
;************************************************
SaveToFile := 1 		 		   		;<------------------    Set this to 1 to save all clips with a unique name , Set it to 0 to overwrite the saved clip every time a new clip is made.
;************************************************
ShowCloseButton := 1 			   		;<------------------    Set this to 1 to show a small close button in the top right corner of the clip. Set this to 0 to keep the close button, but not show it.
;************************************************

;#SingleInstance, Force  ; Force the script to close any other instances of this script. (Run one copy at a time)
SetBatchLines, -1 ;Set the script to run at top speed.
;CoordMode, Mouse , Screen ;Use the screen as the refrence to get positions from.

IfNotExist, %A_ScriptDir%\Saved Clips ; if there is no folder for saved clips
	FileCreateDir, %A_ScriptDir%\Saved Clips ; create the folder.
SetWorkingDir, %A_ScriptDir%\Saved Clips ;Set the saved clips folder as the working dir.
Handles := [] ; Create an array to hold the name of the different gui's.
;Index := 0 ;Used as the name of the current gui cap window.
Index := 0 ;Used as the name of the current gui cap window.
;return   ; End of Auto-Execute Section.
;__ parameter ___
;________________


;------------------------
;-- clip_image_hotkey ---
;------------------------
;*^ESC::	ExitApp ; Hotkey to exit the script.
;capslock & shift::pause
LAlt & F12::
	Run, %A_ScriptDir%\Saved Clips
	return
LAlt & F11::
	FileRecycle, %A_ScriptDir%\Saved Clips\*.png
	return
;**************************************************************************************
;**************************************************************************************

CloseClip: ;Close (Destroy this gui)
	hwnd := WinActive() ;Get the handle to the active window
	Gui, % Handles[hwnd] ": Destroy"  ;Destroy the gui with the name stored in the Handles array at position hwnd.
	return

MoveWindow: 
	PostMessage, 0xA1 , 2  ;Move the active window
	return

CreateCapWindow: ;Create a gui to used for setting the screen cap area and to display the resulting screen shot.
	Index++ ;Increment the current index. (the gui's name)
	if(Index >= 99) ;prevent label crash
	{
		Index := 1
	}
	Gui, %Index% : New , +AlwaysOnTop -Caption -DPIScale +ToolWindow +LastFound +Border hwndHwnd ;Create a new gui and set its options.
	Handles[hwnd] := Index  ;Use the windows handle (hwnd) as the index for the the value of the windows name. 
	Gui, %Index% : Color , 123456 ;Set the color of the gui (This color will be made transparent in the next step)
	WinSet, TransColor , 123456 ;Set only this color as transparent
	Gui, %Index% : Font, cMaroon s10 Bold Q5 , Segoe UI ;Set this gui's font. (Used for the close button)
	Active := 1
	;ToolTip, Click and drag to set capture area. ;Display a tooltip that tells the user what to do.
	ToolTip, Capture On ;LAlt+space and hold LAlt to set capture area. ;Display a tooltip that tells the user what to do.
	SetTimer, Tooltips , 30 ;Set a timer to move the tooltip around with the users cursor.
	return

Tooltips:
	;ToolTip, Click and drag to set capture area. ;Display a tooltip that tells the user what to do.
	ToolTip, Capture On ;LAlt+space and hold LAlt to set capture area. ;Display a tooltip that tells the user what to do.
	return

DrawCapArea:
	if( !FirstPosition ){ ;If the first position hasn't been set yet.
		FirstPosition := 1 ;The first position is now set.
		MouseGetPos, SX , SY ;Get the x and y starting position.
	}else	{ ;After the first position is set.
		MouseGetPos, EX , EY ;Get the current position of the cursor.
		if( SX <= EX && SY <= EY )  ;If the current position is below and to the right of the starting position.
			WinPos := { X: SX , Y: SY , W: EX - SX , H: EY - SY } ;Create a object to hold the windows positions.
		else if( SX > EX && SY <= EY ) ;If the current position is below and to the left of the starting position.
			WinPos := { X: EX , Y: SY , W: SX - EX , H: EY - SY } ;Create a object to hold the windows positions.
		else if( SX <= EX && SY > EY) ;If the current position is above and to the right of the starting position.
			WinPos := { X: SX , Y: EY , W: EX - SX , H: SY - EY } ;Create a object to hold the windows positions.
		else if( SX > EX && SY > EY) ;If the current position is above and to the left of the starting position.
			WinPos := { X: EX , Y: EY , W: SX - EX , H: SY - EY } ;Create a object to hold the windows positions.
	}
	if( WinPos.W ) ;if the winpos object exists
		Gui, %Index% : Show , % "x" WinPos.X " y" WinPos.Y " w" WinPos.W " h" WinPos.H " NA" ;Show the window in the correct position.
	return
;hide all image
hide_open_picture:
sc056 & wheeldown::
tab & wheeldown::
LAlt & sc00e::
;sc039 & wheeldown::
lalt & down::
LAlt & sc15d:: 	;hide image
	Ind := Index
	loop
	{
		if(Ind==0)
			break
		Gui, %Ind% : Hide
		Ind--
		if(Ind==0)
		{
			Ind := 1		
			break
		}
	}
	if(pic_label==null)
		pic_label := 1
	pic_label := picture_label
	Loop
	{
		Gui, picture_%pic_label%: Hide
		pic_label--
		if(pic_label<1)
		{
			pic_label :=1
			break
		}
	}
	tooltip, Hide
	sleep, 1000
	tooltip
	return
tab & wheelup::
sc056 & wheelup::
;sc039 & mbutton::
lalt & up::
LAlt & RControl::	;show image
	if(Ind==null)
		Ind := 0
	if(Index == 0)
	{
		gosub,op_picture
		return
	}
	loop
	{
		try{
			Gui, %Ind% : +ToolWindow 
			Gui, %Ind% : Show
		
			Ind++
			if(Ind>Index)
			{
				Ind := Index		
				break
			}
		}
		catch{
			break
		}
	}
 op_picture:
	pic_label := 1
	Loop
	{
		Gui, picture_%pic_label%: +ToolWindow -Caption +AlwaysOntop
		Gui, picture_%pic_label%: Show
		pic_label++
		if(pic_label>picture_label)
		{
			pic_label := picture_label
			break
		}
	}
	tooltip, Show
	sleep, 1000
	tooltip
	return
destrory_all_image_window:
tab & rbutton::
sc056 & mbutton::
;sc039 & wheelup::
sc15d & wheeldown::
LAlt & RShift::	;destroy all image window
	if(Ind==null)
		Ind :=0
	if(Index==0)
	{
		gosub, des_picture
		return
	}
	if(Index!=0 && Ind==0) ;while creating a picture, then destroy it.
	{
		gosub, hide_open_picture
		;create thread
		;settimer, hide_open_picture, -30
	}
	if(Ind==Index)
	{
		loop
		{
			Gui, %Ind% : destroy
			Ind--
			if(Ind<1)
			{
				Ind := 1
				break
			}
		}
	}
	else
		Loop
		{
			Gui, %Ind% : destroy
			Ind++
			if(Ind>Index)
			{
				Ind := Index
				break
			}
		}
		; all destroy
		all_picture := 99
		loop
		{
			Gui, %all_picture% : destroy
			all_picture--
			if(all_picture<=1)
			{
				all_picture := 99
				break
			}
		}
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 des_picture:
	if(pic_label>=picture_label)
	{
		loop
		{
		Gui, picture_%pic_label%: destroy
		pic_label--
		if(pic_label<1)
			{
				pic_label := 1
				break
			}
		}
	}
	else
		loop
		{
		Gui, picture_%pic_label%: destroy
		pic_label++
		if(pic_label>picture_label)
			{
				pic_label := picture_label
				break
			}
		}
	tooltip, Destroy
	sleep, 1000
	tooltip
	return

TakeScreenShot:
	pToken := Gdip_Startup() ;Start using Gdip
	ClipBitmap := Gdip_BitmapFromScreen( WinPos.X "|" WinPos.Y "|" WinPos.W "|" WinPos.H) ;Create a bitmap of the screen.
	Gdip_SaveBitmapToFile( ClipBitmap , A_WorkingDir "\" ( ( SaveToFile = 1 ) ? ( ClipName := "Saved Clip " A_Now ) : ( ClipName := "Temp Clip") ) ".png", 100 ) ; Save the bitmap to file
	Gdip_DisposeImage( ClipBitmap ) ;Dispose of the bitmap to free memory.
	Gdip_Shutdown(pToken) ;Turn off gdip
	return
;Select File 
LControl & sc039::	;open file
	SetTimer, AlwaysOnTop_set, -300
	FileSelectFile, file, M3
	Loop, parse, file,`n
	{
		if(A_Index==1)
			index1 := A_LoopField
		else if(A_Index>=2)
		{
			gosub, open_picture
		}
	}	
	return
open_picture:
	if(picture_label==null)
	{
		picture_label:=1
	}
	Gui, picture_%picture_label%: Add, Picture,gMoveWindow , %index1%\%A_LoopField%
	Gui, picture_%picture_label%: -caption +toolwindow +alwaysontop
	Gui, picture_%picture_label%:Color, 0004FF
	Gui, picture_%picture_label%: Show,,picture_background_transparent
	WinSet, Transcolor,0004FF , picture_background_transparent
	picture_label++
	return
LShift & lcontrol::
	;Send, {shift}
	send,{alt down}{lshift}{alt up}
	return
/*
LShift & sc039::	;other  open file
	SetTimer, AlwaysOnTop_set, -300
	FileSelectFile, file, M3
	Loop, parse, file,`n
	{
		if(A_Index==1)
			index2 := A_LoopField
		else if(A_Index>=2)
		{
			gosub, open_fixed_picture
		}
	}
	return
*/
open_fixed_picture:
	if(picture_fixed_label==null || picture_fixed_label==0)
	{
		picture_fixed_label:=1
	}
	Gui, picture_fixed_%picture_fixed_label%: Add, Picture,gMoveWindow , %index2%\%A_LoopField%
	Gui, picture_fixed_%picture_fixed_label%: -caption +toolwindow +alwaysontop
	Gui, picture_fixed_%picture_fixed_label%:Color, 0004FF
	Gui, picture_fixed_%picture_fixed_label%: Show,,picture_fixed_background_transparent
	WinSet, Transcolor,0004FF , picture_fixed_background_transparent
	picture_fixed_label++
	return
LShift & sc00e::
LShift & sc15d:: 	;hide fixed image
	pic_fixed_label := picture_fixed_label
	Loop
	{
		Gui, picture_fixed_%pic_fixed_label%: Hide
		pic_fixed_label--
		if(pic_fixed_label<=0)
		{
			pic_fixed_label :=1
			break
		}
	}
	return
LShift & RControl::	;show fixed image
	pic_fixed_label := 1
	Loop
	{
		Gui, picture_fixed_%pic_fixed_label%: +ToolWindow -Caption +AlwaysOntop
		Gui, picture_fixed_%pic_fixed_label%: Show
		pic_fixed_label++
		if(pic_fixed_label>picture_fixed_label)
		{
			pic_fixed_label := picture_fixed_label
			break
		}
	}
	return
LShift & RShift::	;destroy all fixed image window
	pic_fixed_label := picture_fixed_label
	if(pic_fixed_label==null || pic_fixed_label==0)
		return
	if(pic_fixed_label>=picture_fixed_label)
	{
		loop
		{
			Gui, picture_fixed_%pic_fixed_label%: destroy
			pic_fixed_label--
			if(pic_fixed_label<1)
				{
					pic_fixed_label := 1
					break
				}
		}
	}
	else
		loop
		{
			Gui, picture_fixed_%pic_fixed_label%: destroy
			pic_fixed_label++
			if(pic_fixed_label>picture_fixed_label)
				{
					pic_fixed_label := picture_fixed_label
					break
				}
		}
	return
;;xiao fei shu
sc056 & v::
;sc056 & lbutton::
;;;;;;;;;;;;;
lwin & lbutton::
!v::
	;;;;;;;;;;;;;;;;;;;;;;;;; keep "alt tabe"
	if(GetKeyState("rbutton","P")==1){
		return
	}
	;;;;;;;;;;;;;;;;;;;;;;;;
	try{
		;;;;;;;;;;;;;;;;;;;;;
		; check directory
		gosub, check_directory_
		if(count_environment0==0)
			return
		;;;;;;;;;;;;;;;;;;;;;
	}
	sleep, 200
	FileCopy, %Image_copy_path%, % Explorer_GetSelection()
	try{
		;;;;;;;;;;;;;;;;;;;;;
		; delete new directory
		gosub, delete_temp_new_diretory
		;;;;;;;;;;;;;;;;;;;;;
	}
	gosub, pasteImage
	settimer, can_tool19,-1500
	return

#If (Active) ;Context sen Hotkeys.
LAlt & sc039::
	WinPos := "" ;Clear this object.
	FirstPosition := 0 ;Variable used to determin if the starting point has been set yet.
	SetTimer, DrawCapArea , 30 ;Set a timer for drawing a rectangle around the capture area.
;	return
	keywait, LAlt
;z Up::
	Active := 0 ;Set context hotkeys off
	SetTimer, DrawCapArea , Off ;Turn off the drawing timer.
	SetTimer, Tooltips , Off ;Turn off the tooltips timer
	ToolTip, ;Turn off any tooltips.
	if( WinPos.W < 10 || WinPos.H < 10 ) { ; if the cap area width or height is less than 10px.
		Gui, %Index% : Destroy ;Destroy the gui
		return ; Skip taking a screen clip.
	}
	Gui, %Index% : -Border ;Remove the border before taking the screen clip
	gosub, TakeScreenShot ;Take a screen shot of the cap area.
	Gui, %Index% : +Border ;Add the border again.
	
	Gui, %Index% : Add , Text , % ( ( ShowCloseButton ) ? ( " Center 0x200 Border " ) : ( "" ) ) " x" WinPos.W - 20 " y0 w20 h20 BackgroundTrans gCloseClip" , % ( ( ShowCloseButton ) ? ( "X" ) : ( "" ) ) ;Create a trigger used for closing this window.
	Gui, %Index% : Add , Text , % "x0 y0 w" WinPos.W " h" WinPos.H " BackgroundTrans gMoveWindow" ;Create a trigger used for moving the window around.
	Gui, %Index% : Add , Picture , % "x0 y0 w" WinPos.W " h" WinPos.H ,% ClipName ".png"   ;Add the Screen clip image
	;ClipWait
	Image_copy_path := % A_WorkingDir "\"  ClipName ".png" 
	;sleep, 5000
	;copy_file_ptr := % A_WorkingDir "\"  ClipName ".png"
	settimer, copyImage, -1000
	return
sc056 & sc039:: ;sc056 -> "\" key
	WinPos := "" ;Clear this object.
	FirstPosition := 0 ;Variable used to determin if the starting point has been set yet.
	SetTimer, DrawCapArea , 30 ;Set a timer for drawing a rectangle around the capture area.
;	return
	keywait, sc056
;z Up::
	Active := 0 ;Set context hotkeys off
	SetTimer, DrawCapArea , Off ;Turn off the drawing timer.
	SetTimer, Tooltips , Off ;Turn off the tooltips timer
	ToolTip, ;Turn off any tooltips.
	if( WinPos.W < 10 || WinPos.H < 10 ) { ; if the cap area width or height is less than 10px.
		Gui, %Index% : Destroy ;Destroy the gui
		return ; Skip taking a screen clip.
	}
	Gui, %Index% : -Border ;Remove the border before taking the screen clip
	gosub, TakeScreenShot ;Take a screen shot of the cap area.
	Gui, %Index% : +Border ;Add the border again.
	
	Gui, %Index% : Add , Text , % ( ( ShowCloseButton ) ? ( " Center 0x200 Border " ) : ( "" ) ) " x" WinPos.W - 20 " y0 w20 h20 BackgroundTrans gCloseClip" , % ( ( ShowCloseButton ) ? ( "X" ) : ( "" ) ) ;Create a trigger used for closing this window.
	Gui, %Index% : Add , Text , % "x0 y0 w" WinPos.W " h" WinPos.H " BackgroundTrans gMoveWindow" ;Create a trigger used for moving the window around.
	Gui, %Index% : Add , Picture , % "x0 y0 w" WinPos.W " h" WinPos.H ,% ClipName ".png"   ;Add the Screen clip image
	;ClipWait
	Image_copy_path := % A_WorkingDir "\"  ClipName ".png" 
	;sleep, 5000
	;copy_file_ptr := % A_WorkingDir "\"  ClipName ".png"
	settimer, copyImage, -1000
	return

copyImage:
	pToken := Gdip_Startup()
;	Gdip_SetBitmapToClipboard(pBitmap := Gdip_CreateBitmapFromFile("C:\Users\sjLin\Google Drive\AutoHotKey\Applet\Screen Clipper Tool\Saved Clips\Saved Clip 20191217213804.png"))
	Gdip_SetBitmapToClipboard(pBitmap := Gdip_CreateBitmapFromFile(Image_copy_path))
	Gdip_DisposeImage_copyToclipboard(pBitmap)
	Gdip_Shutdown_copyToclipboard(pToken)
	return
~sc15d & n:: ;right hand
	WinPos := "" ;Clear this object.
	FirstPosition := 0 ;Variable used to determin if the starting point has been set yet.
	SetTimer, DrawCapArea , 30 ;Set a timer for drawing a rectangle around the capture area.
	keywait, sc15d
	Active := 0 ;Set context hotkeys off
	SetTimer, DrawCapArea , Off ;Turn off the drawing timer.
	SetTimer, Tooltips , Off ;Turn off the tooltips timer
	ToolTip, ;Turn off any tooltips. 
	if( WinPos.W < 10 || WinPos.H < 10 ) { ; if the cap area width or height is less than 10px.
		Gui, %Index% : Destroy ;Destroy the gui
		return ; Skip taking a screen clip.
	}
	Gui, %Index% : -Border ;Remove the border before taking the screen clip
	gosub, TakeScreenShot ;Take a screen shot of the cap area.
	Gui, %Index% : +Border ;Add the border again.
	
	Gui, %Index% : Add , Text , % ( ( ShowCloseButton ) ? ( " Center 0x200 Border " ) : ( "" ) ) " x" WinPos.W - 20 " y0 w20 h20 BackgroundTrans gCloseClip" , % ( ( ShowCloseButton ) ? ( "X" ) : ( "" ) ) ;Create a trigger used for closing this window.
	Gui, %Index% : Add , Text , % "x0 y0 w" WinPos.W " h" WinPos.H " BackgroundTrans gMoveWindow" ;Create a trigger used for moving the window around.
	Gui, %Index% : Add , Picture , % "x0 y0 w" WinPos.W " h" WinPos.H ,% ClipName ".png"   ;Add the Screen clip image
	;ClipWait
	Image_copy_path := % A_WorkingDir "\"  ClipName ".png" 
	;sleep, 5000
	settimer, copyImage, -1000
	return
Lbutton::
	WinPos := "" ;Clear this object.
	FirstPosition := 0 ;Variable used to determin if the starting point has been set yet.
	SetTimer, DrawCapArea , 30 ;Set a timer for drawing a rectangle around the capture area.
;	return
	keywait, Lbutton
;z Up::
	Active := 0 ;Set context hotkeys off
	SetTimer, DrawCapArea , Off ;Turn off the drawing timer.
	SetTimer, Tooltips , Off ;Turn off the tooltips timer
	ToolTip, ;Turn off any tooltips.
	if( WinPos.W < 10 || WinPos.H < 10 ) { ; if the cap area width or height is less than 10px.
		Gui, %Index% : Destroy ;Destroy the gui
		return ; Skip taking a screen clip.
	}
	Gui, %Index% : -Border ;Remove the border before taking the screen clip
	gosub, TakeScreenShot ;Take a screen shot of the cap area.
	Gui, %Index% : +Border ;Add the border again.
	
	Gui, %Index% : Add , Text , % ( ( ShowCloseButton ) ? ( " Center 0x200 Border " ) : ( "" ) ) " x" WinPos.W - 20 " y0 w20 h20 BackgroundTrans gCloseClip" , % ( ( ShowCloseButton ) ? ( "X" ) : ( "" ) ) ;Create a trigger used for closing this window.
	Gui, %Index% : Add , Text , % "x0 y0 w" WinPos.W " h" WinPos.H " BackgroundTrans gMoveWindow" ;Create a trigger used for moving the window around.
	Gui, %Index% : Add , Picture , % "x0 y0 w" WinPos.W " h" WinPos.H ,% ClipName ".png"   ;Add the Screen clip image
	;ClipWait
	Image_copy_path := % A_WorkingDir "\"  ClipName ".png" 
	;sleep, 5000
	settimer, copyImage, -1000
	return	
;#######################################################################################
;copy image to clipboard
Gdip_DeleteGraphics(pGraphics)
{
   return DllCall("gdiplus\GdipDeleteGraphics", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_DisposeImageAttributes(ImageAttr)
{
	return DllCall("gdiplus\GdipDisposeImageAttributes", A_PtrSize ? "UPtr" : "UInt", ImageAttr)
}
Gdip_GetImageHeight(pBitmap)
{
   DllCall("gdiplus\GdipGetImageHeight", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Height)
   return Height
}
Gdip_GetImageWidth(pBitmap)
{
   DllCall("gdiplus\GdipGetImageWidth", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Width)
   return Width
}
Gdip_SetImageAttributesColorMatrix(Matrix)
{
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	
	VarSetCapacity(ColourMatrix, 100, 0)
	Matrix := RegExReplace(RegExReplace(Matrix, "^[^\d-\.]+([\d\.])", "$1", "", 1), "[^\d-\.]+", "|")
	StringSplit, Matrix, Matrix, |
	Loop, 25
	{
		Matrix := (Matrix%A_Index% != "") ? Matrix%A_Index% : Mod(A_Index-1, 6) ? 0 : 1
		NumPut(Matrix, ColourMatrix, (A_Index-1)*4, "float")
	}
	DllCall("gdiplus\GdipCreateImageAttributes", A_PtrSize ? "UPtr*" : "uint*", ImageAttr)
	DllCall("gdiplus\GdipSetImageAttributesColorMatrix", Ptr, ImageAttr, "int", 1, "int", 1, Ptr, &ColourMatrix, Ptr, 0, "int", 0)
	return ImageAttr
}

Gdip_DrawImage(pGraphics, pBitmap, dx="", dy="", dw="", dh="", sx="", sy="", sw="", sh="", Matrix=1)
{
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	
	if (Matrix&1 = "")
		ImageAttr := Gdip_SetImageAttributesColorMatrix(Matrix)
	else if (Matrix != 1)
		ImageAttr := Gdip_SetImageAttributesColorMatrix("1|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|" Matrix "|0|0|0|0|0|1")

	if (sx = "" && sy = "" && sw = "" && sh = "")
	{
		if (dx = "" && dy = "" && dw = "" && dh = "")
		{
			sx := dx := 0, sy := dy := 0
			sw := dw := Gdip_GetImageWidth(pBitmap)
			sh := dh := Gdip_GetImageHeight(pBitmap)
		}
		else
		{
			sx := sy := 0
			sw := Gdip_GetImageWidth(pBitmap)
			sh := Gdip_GetImageHeight(pBitmap)
		}
	}

	E := DllCall("gdiplus\GdipDrawImageRectRect"
				, Ptr, pGraphics
				, Ptr, pBitmap
				, "float", dx
				, "float", dy
				, "float", dw
				, "float", dh
				, "float", sx
				, "float", sy
				, "float", sw
				, "float", sh
				, "int", 2
				, Ptr, ImageAttr
				, Ptr, 0
				, Ptr, 0)
	if ImageAttr
		Gdip_DisposeImageAttributes(ImageAttr)
	return E
}
Gdip_GraphicsFromImage(pBitmap)
{
	DllCall("gdiplus\GdipGetImageGraphicsContext", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
	return pGraphics
}
Gdip_CreateBitmap(Width, Height, Format=0x26200A)
{
    DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", Width, "int", Height, "int", 0, "int", Format, A_PtrSize ? "UPtr" : "UInt", 0, A_PtrSize ? "UPtr*" : "uint*", pBitmap)
    Return pBitmap
}
DestroyIcon(hIcon)
{
	return DllCall("DestroyIcon", A_PtrSize ? "UPtr" : "UInt", hIcon)
}
Gdip_CreateHBITMAPFromBitmap(pBitmap, Background=0xffffffff)
{
	DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "uint*", hbm, "int", Background)
	return hbm
}

Gdip_SetBitmapToClipboard(pBitmap)
{
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	off1 := A_PtrSize = 8 ? 52 : 44, off2 := A_PtrSize = 8 ? 32 : 24
	hBitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
	DllCall("GetObject", Ptr, hBitmap, "int", VarSetCapacity(oi, A_PtrSize = 8 ? 104 : 84, 0), Ptr, &oi)
	hdib := DllCall("GlobalAlloc", "uint", 2, Ptr, 40+NumGet(oi, off1, "UInt"), Ptr)
	pdib := DllCall("GlobalLock", Ptr, hdib, Ptr)
	DllCall("RtlMoveMemory", Ptr, pdib, Ptr, &oi+off2, Ptr, 40)
	DllCall("RtlMoveMemory", Ptr, pdib+40, Ptr, NumGet(oi, off2 - (A_PtrSize ? A_PtrSize : 4), Ptr), Ptr, NumGet(oi, off1, "UInt"))
	DllCall("GlobalUnlock", Ptr, hdib)
	DllCall("DeleteObject", Ptr, hBitmap)
	DllCall("OpenClipboard", Ptr, 0)
	DllCall("EmptyClipboard")
	DllCall("SetClipboardData", "uint", 8, Ptr, hdib)
	DllCall("CloseClipboard")
}
Gdip_CreateBitmapFromFile(sFile, IconNumber=1, IconSize="")
{
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	, PtrA := A_PtrSize ? "UPtr*" : "UInt*"
	
	SplitPath, sFile,,, ext
	if ext in exe,dll
	{
		Sizes := IconSize ? IconSize : 256 "|" 128 "|" 64 "|" 48 "|" 32 "|" 16
		BufSize := 16 + (2*(A_PtrSize ? A_PtrSize : 4))
		
		VarSetCapacity(buf, BufSize, 0)
		Loop, Parse, Sizes, |
		{
			DllCall("PrivateExtractIcons", "str", sFile, "int", IconNumber-1, "int", A_LoopField, "int", A_LoopField, PtrA, hIcon, PtrA, 0, "uint", 1, "uint", 0)
			
			if !hIcon
				continue

			if !DllCall("GetIconInfo", Ptr, hIcon, Ptr, &buf)
			{
				DestroyIcon(hIcon)
				continue
			}
			
			hbmMask  := NumGet(buf, 12 + ((A_PtrSize ? A_PtrSize : 4) - 4))
			hbmColor := NumGet(buf, 12 + ((A_PtrSize ? A_PtrSize : 4) - 4) + (A_PtrSize ? A_PtrSize : 4))
			if !(hbmColor && DllCall("GetObject", Ptr, hbmColor, "int", BufSize, Ptr, &buf))
			{
				DestroyIcon(hIcon)
				continue
			}
			break
		}
		if !hIcon
			return -1

		Width := NumGet(buf, 4, "int"), Height := NumGet(buf, 8, "int")
		hbm := CreateDIBSection(Width, -Height), hdc := CreateCompatibleDC(), obm := SelectObject(hdc, hbm)
		if !DllCall("DrawIconEx", Ptr, hdc, "int", 0, "int", 0, Ptr, hIcon, "uint", Width, "uint", Height, "uint", 0, Ptr, 0, "uint", 3)
		{
			DestroyIcon(hIcon)
			return -2
		}
		
		VarSetCapacity(dib, 104)
		DllCall("GetObject", Ptr, hbm, "int", A_PtrSize = 8 ? 104 : 84, Ptr, &dib) ; sizeof(DIBSECTION) = 76+2*(A_PtrSize=8?4:0)+2*A_PtrSize
		Stride := NumGet(dib, 12, "Int"), Bits := NumGet(dib, 20 + (A_PtrSize = 8 ? 4 : 0)) ; padding
		DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", Width, "int", Height, "int", Stride, "int", 0x26200A, Ptr, Bits, PtrA, pBitmapOld)
		pBitmap := Gdip_CreateBitmap(Width, Height)
		G := Gdip_GraphicsFromImage(pBitmap)
		, Gdip_DrawImage(G, pBitmapOld, 0, 0, Width, Height, 0, 0, Width, Height)
		SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
		Gdip_DeleteGraphics(G), Gdip_DisposeImage(pBitmapOld)
		DestroyIcon(hIcon)
	}
	else
	{
		if (!A_IsUnicode)
		{
			VarSetCapacity(wFile, 1024)
			DllCall("kernel32\MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sFile, "int", -1, Ptr, &wFile, "int", 512)
			DllCall("gdiplus\GdipCreateBitmapFromFile", Ptr, &wFile, PtrA, pBitmap)
		}
		else
			DllCall("gdiplus\GdipCreateBitmapFromFile", Ptr, &sFile, PtrA, pBitmap)
	}
	
	return pBitmap
}
Gdip_DisposeImage_copyToclipboard(pBitmap)
{
   return DllCall("gdiplus\GdipDisposeImage", A_PtrSize ? "UPtr" : "UInt", pBitmap)
}
Gdip_Shutdown_copyToclipboard(pToken)
{
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	
	DllCall("gdiplus\GdiplusShutdown", Ptr, pToken)
	if hModule := DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
		DllCall("FreeLibrary", Ptr, hModule)
	return 0
}

;################################################################
x::
	WinPos := "" ;Clear this object.
	FirstPosition := 0 ;Variable used to determin if the starting point has been set yet.
	SetTimer, DrawCapArea , 30 ;Set a timer for drawing a rectangle around the capture area.
	return
c:: ;it will destroy image
sc02c::
z::
	if(getkeystate("c", "P")==1){
		get_c_temp := 1
	}
	Active := 0 ;Set context hotkeys off
	SetTimer, DrawCapArea , Off ;Turn off the drawing timer.
	SetTimer, Tooltips , Off ;Turn off the tooltips timer
	ToolTip, ;Turn off any tooltips.
	if( WinPos.W < 10 || WinPos.H < 10 ) { ; if the cap area width or height is less than 10px.
		Gui, %Index% : Destroy ;Destroy the gui
		return ; Skip taking a screen clip.
	}
	Gui, %Index% : -Border ;Remove the border before taking the screen clip
	gosub, TakeScreenShot ;Take a screen shot of the cap area.
	Gui, %Index% : +Border ;Add the border again.
	
	Gui, %Index% : Add , Text , % ( ( ShowCloseButton ) ? ( " Center 0x200 Border " ) : ( "" ) ) " x" WinPos.W - 20 " y0 w20 h20 BackgroundTrans gCloseClip" , % ( ( ShowCloseButton ) ? ( "X" ) : ( "" ) ) ;Create a trigger used for closing this window.
	Gui, %Index% : Add , Text , % "x0 y0 w" WinPos.W " h" WinPos.H " BackgroundTrans gMoveWindow" ;Create a trigger used for moving the window around.
	Gui, %Index% : Add , Picture , % "x0 y0 w" WinPos.W " h" WinPos.H ,% ClipName ".png"   ;Add the Screen clip image
	;ClipWait
	Image_copy_path := % A_WorkingDir "\"  ClipName ".png" 
	;sleep, 5000
	settimer, copyImage, -1000
	if(get_c_temp==1){
		get_c_temp := 0
		gosub, destrory_all_image_window
	}
	return	
#tab::
	Send, #{tab}
	return
sc153:: ;xiao fei shu (left)
left::
h::
	MouseMove, -Sd, 0, 0, R
	Tooltip, %Sd%
	SetTimer, ca_tool, -2000
	return
down::
j::
	MouseMove, 0, Sd, 0, R
	Tooltip, %Sd%
	SetTimer, ca_tool, -2000
	return
up::
k::
	MouseMove, 0, -Sd, 0, R
	Tooltip, %Sd%
	SetTimer, ca_tool, -2000
	return
right::
l::
	MouseMove, Sd, 0, 0, R
	Tooltip, %Sd%
	SetTimer, ca_tool, -2000
	return
f::
	Sd := 100
	Tooltip, %Sd%
	return
d::
	Sd := 5
	Tooltip, %Sd%
	return
g::
	Sd := 350
	Tooltip, %Sd%
	return
u::
	Click, Middle
	return
i::
	Click, Left
	return
o::
	Click, Right
	return
n::
	Send, {WheelDown}
	return
m::
	Send, {WheelUp}
	return
 ,::
	Send, {WheelLeft}
	return
 .::
	Send, {WheelRight}
	return
s::
	Send, {WheelDown 6}
	return
a::
	Send, {WheelUp 6}
	return
`;::
	click, Down
	tooltip,click down,0,0,2
	keywait, tab
	tooltip,,,,2
	click, up
	return
r::
	x_m := A_ScreenWidth*0.25
	y_m := A_Screenheight*0.25
	if(x_r==null)
		x_r:=0
	if(x_r==0)
	{	
		px_m := 1
		py_m := 1
	}
	else if(x_r==1)
	{
		px_m := 3
		py_m := 1
	}
	else if(x_r==2)
	{
		px_m := 3
		py_m := 3
	}
	else if(x_r==3)
	{
		px_m := 1
		py_m := 3
	}
	x_n := floor(x_m*px_m)
	y_n := floor(y_m*py_m)
	mouseMove, %x_n%, %y_n%
	;mousegetpos,qw,er
	;msgbox,%qw%,%er%
	;msgbox, %x_n%,%y_n%
	x_r++
	if(x_r>=4)
		x_r := 0
	;msgbox,%x_r%
	return
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;============================================================================
enter::
RButton::  ;If the right mouse button is pressed while selecting the screen clip area, Cancel the action and restore variables etc.
	Active := 0 ;Set context hotkeys off
	SetTimer, DrawCapArea , Off ;Turn off the drawing timer.
	SetTimer, Tooltips , Off ;Turn off the tooltips timer
	ToolTip, ;Turn off any tooltips.
	Gui, %Index% : Destroy ;Destroy the current gui
	return

#If

;******************************************************************************************************************************************
;******************************************************************************************************************************************
;***************************************************      GDIP Functions      *************************************************************
;******************************************************************************************************************************************
;******************************************************************************************************************************************
Gdip_Startup(){
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	if !DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
		DllCall("LoadLibrary", "str", "gdiplus")
	VarSetCapacity(si, A_PtrSize = 8 ? 24 : 16, 0), si := Chr(1)
	DllCall("gdiplus\GdiplusStartup", A_PtrSize ? "UPtr*" : "uint*", pToken, Ptr, &si, Ptr, 0)
	return pToken
}
Gdip_BitmapFromScreen(Screen=0, Raster=""){
	if (Screen = 0){
		Sysget, x, 76
		Sysget, y, 77	
		Sysget, w, 78
		Sysget, h, 79
	}else if (SubStr(Screen, 1, 5) = "hwnd:"){
		Screen := SubStr(Screen, 6)
		if !WinExist( "ahk_id " Screen)
			return -2
		WinGetPos,,, w, h, ahk_id %Screen%
		x := y := 0
		hhdc := GetDCEx(Screen, 3)
	}else if (Screen&1 != ""){
		Sysget, M, Monitor, %Screen%
		x := MLeft, y := MTop, w := MRight-MLeft, h := MBottom-MTop
	}else	{
		StringSplit, S, Screen, |
		x := S1, y := S2, w := S3, h := S4
	}
	if (x = "") || (y = "") || (w = "") || (h = "")
		return -1
	chdc := CreateCompatibleDC(), hbm := CreateDIBSection(w, h, chdc), obm := SelectObject(chdc, hbm), hhdc := hhdc ? hhdc : GetDC()
	BitBlt(chdc, 0, 0, w, h, hhdc, x, y, Raster)
	ReleaseDC(hhdc)
	pBitmap := Gdip_CreateBitmapFromHBITMAP(hbm)
	SelectObject(chdc, obm), DeleteObject(hbm), DeleteDC(hhdc), DeleteDC(chdc)
	return pBitmap
}
Gdip_SaveBitmapToFile(pBitmap, sOutput, Quality=75){
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	SplitPath, sOutput,,, Extension
	if Extension not in BMP,DIB,RLE,JPG,JPEG,JPE,JFIF,GIF,TIF,TIFF,PNG
		return -1
	Extension := "." Extension
	DllCall("gdiplus\GdipGetImageEncodersSize", "uint*", nCount, "uint*", nSize)
	VarSetCapacity(ci, nSize)
	DllCall("gdiplus\GdipGetImageEncoders", "uint", nCount, "uint", nSize, Ptr, &ci)
	if !(nCount && nSize)
		return -2
	If (A_IsUnicode){
		StrGet_Name := "StrGet"
		Loop, % nCount 	{
			sString := %StrGet_Name%(NumGet(ci, (idx := (48+7*A_PtrSize)*(A_Index-1))+32+3*A_PtrSize), "UTF-16")
			if !InStr(sString, "*" Extension)
				continue
			pCodec := &ci+idx
			break
		}
	} else {
		Loop, % nCount 	{
			Location := NumGet(ci, 76*(A_Index-1)+44)
			nSize := DllCall("WideCharToMultiByte", "uint", 0, "uint", 0, "uint", Location, "int", -1, "uint", 0, "int",  0, "uint", 0, "uint", 0)
			VarSetCapacity(sString, nSize)
			DllCall("WideCharToMultiByte", "uint", 0, "uint", 0, "uint", Location, "int", -1, "str", sString, "int", nSize, "uint", 0, "uint", 0)
			if !InStr(sString, "*" Extension)
				continue
			pCodec := &ci+76*(A_Index-1)
			break
		}
	}
	if !pCodec
		return -3
	if (Quality != 75){
		Quality := (Quality < 0) ? 0 : (Quality > 100) ? 100 : Quality
		if Extension in .JPG,.JPEG,.JPE,.JFIF
		{
			DllCall("gdiplus\GdipGetEncoderParameterListSize", Ptr, pBitmap, Ptr, pCodec, "uint*", nSize)
			VarSetCapacity(EncoderParameters, nSize, 0)
			DllCall("gdiplus\GdipGetEncoderParameterList", Ptr, pBitmap, Ptr, pCodec, "uint", nSize, Ptr, &EncoderParameters)
			Loop, % NumGet(EncoderParameters, "UInt") 	{
				elem := (24+(A_PtrSize ? A_PtrSize : 4))*(A_Index-1) + 4 + (pad := A_PtrSize = 8 ? 4 : 0)
				if (NumGet(EncoderParameters, elem+16, "UInt") = 1) && (NumGet(EncoderParameters, elem+20, "UInt") = 6){
					p := elem+&EncoderParameters-pad-4
					NumPut(Quality, NumGet(NumPut(4, NumPut(1, p+0)+20, "UInt")), "UInt")
					break
				}
			}      
		}
	}
	if (!A_IsUnicode){
		nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sOutput, "int", -1, Ptr, 0, "int", 0)
		VarSetCapacity(wOutput, nSize*2)
		DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sOutput, "int", -1, Ptr, &wOutput, "int", nSize)
		VarSetCapacity(wOutput, -1)
		if !VarSetCapacity(wOutput)
			return -4
		E := DllCall("gdiplus\GdipSaveImageToFile", Ptr, pBitmap, Ptr, &wOutput, Ptr, pCodec, "uint", p ? p : 0)
	}
	else
		E := DllCall("gdiplus\GdipSaveImageToFile", Ptr, pBitmap, Ptr, &sOutput, Ptr, pCodec, "uint", p ? p : 0)
	return E ? -5 : 0
}
Gdip_DisposeImage(pBitmap){
   return DllCall("gdiplus\GdipDisposeImage", A_PtrSize ? "UPtr" : "UInt", pBitmap)
}
Gdip_Shutdown(pToken){
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	DllCall("gdiplus\GdiplusShutdown", Ptr, pToken)
	if hModule := DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
		DllCall("FreeLibrary", Ptr, hModule)
	return 0
}
GetDCEx(hwnd, flags=0, hrgnClip=0){
	Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("GetDCEx", Ptr, hwnd, Ptr, hrgnClip, "int", flags)
}
CreateCompatibleDC(hdc=0){
   return DllCall("CreateCompatibleDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}
CreateDIBSection(w, h, hdc="", bpp=32, ByRef ppvBits=0){
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	hdc2 := hdc ? hdc : GetDC()
	VarSetCapacity(bi, 40, 0)
	NumPut(w, bi, 4, "uint") , NumPut(h, bi, 8, "uint") , NumPut(40, bi, 0, "uint") , NumPut(1, bi, 12, "ushort") , NumPut(0, bi, 16, "uInt") , NumPut(bpp, bi, 14, "ushort")
	hbm := DllCall("CreateDIBSection" , Ptr, hdc2 , Ptr, &bi , "uint", 0 , A_PtrSize ? "UPtr*" : "uint*", ppvBits , Ptr, 0 , "uint", 0, Ptr)
	if !hdc
		ReleaseDC(hdc2)
	return hbm
}
SelectObject(hdc, hgdiobj){
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	return DllCall("SelectObject", Ptr, hdc, Ptr, hgdiobj)
}
GetDC(hwnd=0){
	return DllCall("GetDC", A_PtrSize ? "UPtr" : "UInt", hwnd)
}
BitBlt(ddc, dx, dy, dw, dh, sdc, sx, sy, Raster=""){
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	return DllCall("gdi32\BitBlt" , Ptr, dDC , "int", dx , "int", dy , "int", dw , "int", dh , Ptr, sDC , "int", sx , "int", sy , "uint", Raster ? Raster : 0x00CC0020)
}
ReleaseDC(hdc, hwnd=0){
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	return DllCall("ReleaseDC", Ptr, hwnd, Ptr, hdc)
}
Gdip_CreateBitmapFromHBITMAP(hBitmap, Palette=0){
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", Ptr, hBitmap, Ptr, Palette, A_PtrSize ? "UPtr*" : "uint*", pBitmap)
	return pBitmap
}
DeleteObject(hObject){
   return DllCall("DeleteObject", A_PtrSize ? "UPtr" : "UInt", hObject)
}
DeleteDC(hdc){
   return DllCall("DeleteDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}




;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;__ clip_image_hotkey ___
;________________________

;============== clip_image ==============
;========================================

SetCapsLockState,AlwaysOFF
sc039 & .::
	if(toggle==null){
		toggle:=1
	}
	if(toggle==1){
		SetCapsLockState,AlwaysOFF
	}
	else{
		SetCapsLockState,AlwaysON
	}
	toggle:=!toggle
	return

capslock::send, {esc}
sc039::send,{space}

lalt::PostMessage, 0x50, 0, 0x4040404,, A
ralt::PostMessage, 0x50, 0, 0x4090409,, A

;suspend
capslock & lshift::Suspend
;reload
capslock & esc::Reload

sc039 & q::send,{raw}!
sc039 & w::send,{raw}@
sc039 & e::send,{raw}#
sc039 & r::send,{raw}$
sc039 & t::send,{raw}`%
sc039 & y::send,{raw}^
sc039 & u::send,{raw}&
sc039 & i::send,{raw}*
sc039 & o::send,{raw}(
sc039 & p::send,{raw})


sc039 & a::send,{raw}1
sc039 & s::send,{raw}2
sc039 & d::send,{raw}3
sc039 & f::send,{raw}4
sc039 & g::send,{raw}5
sc039 & h::send,{raw}6
sc039 & j::send,{raw}7
sc039 & k::send,{raw}8
sc039 & l::send,{raw}9
sc039 & `;::send,{raw}0


sc039 & z::send,{raw}+
sc039 & x::send,{raw}-
sc039 & c::
	send,{raw}{}
	send, {left}
	return
sc039 & v::send,{raw}{
sc039 & b::send,{raw}}
sc039 & n::send,{raw}=
sc039 & m::send,{raw}_
sc039 & ,::
	send,{raw}[]
	send, {left}
	return



lalt & h::send, {left}
lalt & j::send, {down}
lalt & k::send, {up}
lalt & l::send, {right}


lalt & u::send, {home}
lalt & i::send, {pgup}
lalt & o::send, {pgdn}
lalt & `;::send, {end}


lalt & b::send, ^{backspace}
lalt & n::send, {backspace}
lalt & m::send, {delete}
lalt & ,::send, ^{delete}


lalt & a::send, {enter}

capslock & u::
	send, ^c
	return
capslock & i::
	send, ^v
	return
capslock & n::
	send, ^s
	return
capslock & m::
	send, ^z
	return
capslock & ,::
	send, ^a
	return
capslock & .::
	send, ^x
	return




;----------------------------------------   label input

capslock & g::
	;gui, sup_input:new
	try{
		try{
			gui, sup_input:Font, s10 bold, Helvetica
		}
		catch{
			gui, sup_input:Font, s10 bold, 
		}
		gui, sup_input:add, text, , Support Input
		gui, sup_input:add, edit, vsupport_input WantTab
		gui, sup_input:add, button, gsupport_input_OK Default, OK
		gui, sup_input: +AlwaysOnTop
		gui, sup_input:show, ,Support Input HotString
	}
	catch{
		gui, sup_input:destroy
	}
	return

support_input_OK:
	gui, sup_input:hide
	gui, sup_input:submit
	gui, sup_input:destroy
	try{
		gosub, %support_input%
	}
	catch{
		tooltip, Index faliure
		sleep, 2000
		tooltip
	}
	return


;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Label @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;;;;;;;;;;;;;;;;;;;;;;;; comment subject
;--------------------
;-- simple comment --
;--------------------
comment--:
	sign_count := 40
	goto, GUI_comment
	return
comment-:
	sign_count := 20
	goto, GUI_comment
	return
GUI_comment:
	gui, ahkct:new
	gui, ahkct: add, text, ,Comment sign
	gui, ahkct: add, edit, vcomment_sign
	gui, ahkct: add, text, ,Subject
	gui, ahkct: add, edit, vcomment_subject
	gui, ahkct: add, button, gsimple_comment, OK
	gui, ahkct:+alwaysontop
	gui, ahkct:show, w300, Comment
	return

simple_comment:
	gui, ahkct:submit
	comment_str := sign_bar(sign_count, "-")
	comment_str := StrReplace(comment_str, "`n", "")
	comment_str = `n%comment_sign%%comment_str%   %comment_subject%`n
	has_sign := {"#":1, "!":1, "+":1, "{":1, "}":1}
	if(has_sign.HasKey(comment_sign)){
		send, {raw}%comment_str%
	}
	else{
		sendinput, %comment_str%
	}
	return

comment@:
;:?:Ct;.::
	signMark := "@"
	subject_comment_count := 30
	sign_count := subject_comment_count
	gui, ahkct:new
	gui, ahkct: add, text, ,Comment sign
	gui, ahkct: add, edit, vcomment_sign
	gui, ahkct: add, text, ,Subject
	gui, ahkct: add, edit, vcomment_subject
	gui, ahkct: add, button, gsend_comment, OK
	gui, ahkct:+alwaysontop
	gui, ahkct:show, w300, Comment
	return
comment*:
;:?:Ct;.::
	signMark := "-"
	sign_count := 6
	gui, ahkct:new
	gui, ahkct: add, text, ,Comment sign
	gui, ahkct: add, edit, vcomment_sign
	gui, ahkct: add, text, ,Subject
	gui, ahkct: add, edit, vcomment_subject
	gui, ahkct: add, button, gsend_comment, OK
	gui, ahkct:+alwaysontop 
	gui, ahkct:show, w300, Comment
	return
send_comment:
	gui, ahkct:submit
;msgbox, %sign_count%
	comment_str := ""
	if(comment_sign==null){
		tooltip, sign blank
		sleep, 2000
		tooltip
		return
	}
	;check str odd or even
	sign_count += StrLen(comment_subject)
	odd_or_even_check := Mod(sign_count, 2)
	if(odd_or_even_check==1){
		sign_count += 1
	}
	;;;;;;;;;;;;;;;;;;;;;;;
	;sign_count += 6
	if(sign_count<10){
		sign_count := 10
	}
	if(comment_subject==null){
		sign_count := 10
		if(signMark == "@"){
			sign_count := subject_comment_count
		}
	}
	;**********************
	;** check sign type ***
	;**********************
	;**********************

	;comment_type
	comment_str = %comment_sign%%comment_str%
	;; show sign (sign_count)
	comment_str .= sign_bar(sign_count, signMark)
	comment_str = %comment_str%%comment_sign%
	comment_str .= sign_bar_comment(sign_count, comment_subject, signMark)
	comment_str = %comment_str%%comment_sign%
	comment_str .= sign_bar(sign_count, signMark)
	comment_str = %comment_str%%comment_sign%
	finish_bar := "="
	if(signMark == "-"){
		finish_bar := "_"
	}
	;------------------
	comment_str .= sign_bar_comment(sign_count, comment_subject, finish_bar)
	comment_str = %comment_str%%comment_sign%
	comment_str .= sign_bar(sign_count, finish_bar)
	;-- old version ---
	;------------------
	;comment_str .= sign_bar(sign_count, finish_bar)
	;------------------
	has_sign := {"#":1, "!":1, "+":1, "{":1, "}":1}
	if(has_sign.HasKey(comment_sign)){
		send, {raw}%comment_str%
	}
	else{
		sendinput, %comment_str%
	}
	send, {up 3}
	send, {end}
	send, `n
	gui, ahkct:destroy
	return
sign_bar(sign_count, comment_sign="@"){
	comment_str =
	loop, %sign_count%
	{
		comment_str = %comment_str%%comment_sign%
		if(sign_count==A_Index){
			comment_str = %comment_str%`n
		}
	}
	return comment_str
}
sign_bar_comment(sign_count, comment="blank_", comment_sign="@"){
	comment_str =
	if(comment==null){
		comment = blank_
	}
	comment_count := StrLen(comment)
	comment_odd_or_even_ := Mod(comment_count, 2)
	last_sign_mark := 0
	if(comment_odd_or_even_==1){
		comment_count += 1
		last_sign_mark := 1
	}
	sign_count -= (comment_count+2)
	sign_count /= 2
	loop, %sign_count%
	{
		comment_str = %comment_str%%comment_sign%
	}
	comment_str = %comment_str%%A_Space%%comment%
	loop, %sign_count%
	{
		if(A_Index==1){
			comment_str = %comment_str%%A_Space%%comment_sign%
			continue
		}
		comment_str = %comment_str%%comment_sign%
	}
	if(last_sign_mark==1){
		last_sign_mark:= 0
		comment_str = %comment_str%%comment_sign%
	}
	comment_str = %comment_str%`n
	return comment_str
}
;__ simple comment __
;____________________


;============== Label ===============
;====================================

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Function @@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	;function	open local explorer
;detect path
;reference;
;write by errorseven
;website: stack overflow
;https://stackoverflow.com/questions/39253268/autohotkey-and-windows-10-how-to-get-current-explorer-path/39263800#39263800
;---------------------------------------------------
Explorer_GetSelection(hwnd="") {
    WinGet, process, processName, % "ahk_id" hwnd := hwnd? hwnd:WinExist("A")
    WinGetClass class, ahk_id %hwnd%
    if  (process = "explorer.exe") {
        if (class ~= "(Cabinet|Explore)WClass") {
            for window in ComObjCreate("Shell.Application").Windows
                if  (window.hwnd==hwnd)
                    path := window.Document.FocusedItem.path

            SplitPath, path,,dir
        }
        return dir
	}
}
	;Function
;--------------------------------------------------
	;Show Mode of Key
	Show_ToolTip(switch,displacement){
		if(switch=1){
			ToolTip,MK%displacement%,0,0,1
		}
		else if(switch=3)
			ToolTip, NS,0,30,2
		else if(switch=2)
			ToolTip,,,,2
		else
			ToolTip,,,,1
			ToolTip,,,,3
	}
	;mouse position tooltip
	MS_RM:
		tooltip,%SD%,,,4
		if(Sd==5)
		{
			WinSet, Transparent, 100, MS_tr_5
			WinSet, Transparent, 0, MS_tr_100
			WinSet, Transparent, 0, MS_tr_350
		}
		else if(Sd==100)
		{
			WinSet, Transparent, 0, MS_tr_5
			WinSet, Transparent, 100, MS_tr_100
			WinSet, Transparent, 0, MS_tr_350
		}
		else if(Sd==350)
		{
			WinSet, Transparent, 0, MS_tr_5
			WinSet, Transparent, 0, MS_tr_100
			WinSet, Transparent, 100, MS_tr_350
		}
		return
	MS_RM_close:
		Settimer, Mouse_MouseKey_CK,off
		tooltip,,,,4
		if(MS_GUI_cancel_transparent!=1)
		{
			WinSet, Transparent, 0, MS_tr_5
			WinSet, Transparent, 0, MS_tr_100
			WinSet, Transparent, 0, MS_tr_350
		}
		MS_GUI_cancel_transparent := 0
		return
	hide_MS_RM:
		tooltip,,,,4
		WinSet, Transparent, 0, MS_tr_5
		WinSet, Transparent, 0, MS_tr_100
		WinSet, Transparent, 0, MS_tr_350
		return
	
	;check mouse move
	Mouse_MouseKey_CK:
		MouseGetPos, Mouse_MouseKey_CK2x, Mouse_MouseKey_CK2y
		if(Mouse_MouseKey_CK_Xpos != Mouse_MouseKey_CK2x && Mouse_MouseKey_CK_Ypos != Mouse_MouseKey_CK2y)
		{
			MS_GUI_cancel_transparent :=1
			goto MS_RM_close
		}
		return

;#################################################	file management
/*
capslock & sc039::	;open file
	SetTimer, AlwaysOnTop_set_file, -300
	FileSelectFile, file, M3
	Loop, parse, file,`n
	{
		if(A_Index==1)
			index1 := A_LoopField
		else if(A_Index>=2)
		{
			;Run, Target , WorkingDir, Options, OutputVarPID
			run, %index1%\%A_LoopField%, %index1%
		}
	}	
	return
*/
AlwaysOnTop_set_file: ;open file
	WinSet,AlwaysOnTop,On, Select File ;  - Switcher.ahk
	WinSetTitle, Select File ,,Open files
	return


AlwaysOnTop_set:
	WinSet,AlwaysOnTop,On, Select File ;  - Switcher.ahk
	return

capslock & tab::	;open clipboard content
	clipboard := "" ;empty clipboard
	Send, ^c
	ClipWait
	Run, %Clipboard%,,UseErrorLevel
	if ErrorLevel
		tooltip,something wrong
	sleep,2000
	tooltip
	return




;;;;;;;;;;;;;;;;;;;;;;;; check null directory or environment path
check_directory_:
	des =% Explorer_GetSelection()
	StringSplit, count_environment, des, `;
	if(count_environment0==0){
		tooltip, Null Directory,,,8
		settimer, can_tool_8, -2000
		return
	}
	if(count_environment0>=5){
		loop{
			send, ^+n
			sleep, 50
			send, {enter} 
			sleep, 200
			des =% Explorer_GetSelection()
			sleep, 200
			new_dir = %des%\New folder*
			if FileExist(new_dir)
			{
				break
			}
		}
	}
	return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; temp new directory
delete_temp_new_diretory:
	des =% Explorer_GetSelection()
	new_dir = %des%\New folder*
	loop, Files, %new_dir%, D
	{
		FileRemoveDir, %A_LoopFileFullPath%
	}
	return
;============== Function ==============
;======================================
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Tooltip @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
pasteImage:
	tooltip, paste image, , , 19
	return

;----------------------------------------   tooltip_cancel
/*
	tooltip,,,, number
*/
;==============================
can_tool:
	tooltip
	return
can_tool1:
	tooltip,,,,1
	return
can_tool2:
	tooltip,,,,2
	return
can_tool3:
	tooltip,,,,3
	return
can_tool4:
	tooltip,,,,4
	return
can_tool5:
	tooltip,,,,5
	return
can_tool6:
	tooltip,,,,6
	return
can_tool7:
	tooltip,,,,7
	return
can_tool_8:
can_tool8:
	tooltip,,,,8
	return
can_tool9:
	tooltip,,,,9
	return
can_tool10:
	tooltip,,,,10
	return
can_tool11:
	tooltip,,,,11
	return
can_tool12:
	tooltip,,,,12
	return
can_tool13:
	tooltip,,,,13
	return
can_tool14:
	tooltip,,,,14
	return
can_tool15:
	tooltip,,,,15
	return
can_tool16:
	tooltip,,,,16
	return
can_tool17:
	tooltip,,,,17
	return
can_tool18:
	tooltip,,,,18
	return
can_tool19:
	tooltip,,,,19
	return
can_tool20:
	tooltip,,,,20
	return
ca_tool:
	tooltip
	return
;============== Tooltip ===============
;======================================

