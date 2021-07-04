#singleinstance, force

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Parameter @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;----------------------------------------   clip_image
gosub, clip_image_parameter


;----------------------------------------   program_select
gosub, Program_Select_parameter


;----------------------------------------   get title
gosub, getTitleParameter
gosub, getTitleParameter2
gosub, getTitleParameter3


;----------------------------------------   edit table
gosub, WhiteBoard_parameter


;----------------------------------------   search support
gosub, read_list_search_index

;--------------------
;-- Parameter End ---
;--------------------
return
;__ Parameter End ___
;____________________















;============== Parameter ===============
;========================================

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ include @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#include *i label.ahk
;============== include ===============
;======================================














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
tab::send, {tab}

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


sc039 & z::
sc039 & sc02c:: ;sc02c -> z
	send,{+}
	return
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
sc039 & sc002::send,{down}
sc039 & sc003::send,{up}
sc039 & sc004::send,{right}
sc039 & sc029::send,{left}



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

lalt & x::send, !{f4}
lalt & c::send, ^w

lalt & a::send, {enter}


ralt & i::sendinput, \

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

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Tooltip @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

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




;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Label GUI @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

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
	gui, ahkct: add, button, gsimple_comment default, OK
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
	gui, ahkct: add, button, gsend_comment default, OK
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
	gui, ahkct: add, button, gsend_comment default, OK
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


;============== Label GUI ===============
;========================================

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Program Select @@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;------------------------------
;-- Program Select Parameter --
;------------------------------
Program_Select_parameter:
	IfNotExist Path\path.ini
	{
		tempc:=1
		loop 10
		{
			Name_%tempc% :="`t"
			tempc++	
		}
		tempc:=1
		loop 10
		{
			Path_%tempc% :="`t"
			tempc++	
		}
		FileCreateDir,Path
		FileAppend,[Name]`nName_1=%Name_1% `nName_2=%Name_2%`nName_3=%Name_3% `nName_4=%Name_4% `nName_5=%Name_5% `nName_6=%Name_6% `nName_7=%Name_7% `nName_8=%Name_8% `nName_9=%Name_9% `nName_10=%Name_10% `n[Path]`nPath_1=%Path_1% `nPath_2=%Path_2% `nPath_3=%Path_3% `nPath_4=%Path_4% `nPath_5=%Path_5%`nPath_6=%Path_6% `nPath_7=%Path_7% `nPath_8=%Path_8% `nPath_9=%Path_9% `nPath_10=%Path_10% ,Path\path.ini
	}
	return

;__ Program Select Parameter __
;______________________________
;open gui
LAlt & 0::
	Gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	return
;##################################
			try{
				;;;;;;;;;;;;;;;;;;;;;
				; check directory
				gosub, check_directory_
				;if(count_environment0==0)
					;return
				;;;;;;;;;;;;;;;;;;;;;
			}
			try{
				;;;;;;;;;;;;;;;;;;;;;
				; delete new directory
				gosub, delete_temp_new_diretory
				;;;;;;;;;;;;;;;;;;;;;
			}
RAlt & sc002::
	Gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	gosub, Ch_1
	Gui, PG_SL:Destroy
	return
RAlt & sc003:: ;sc003 > 2
RAlt & 2::
	Gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	gosub, Ch_2
	Gui, PG_SL:Destroy
	return
RAlt & sc004:: ;sc004 > 3
RAlt & 3::
	Gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	gosub, Ch_3
	Gui, PG_SL:Destroy
	return
RAlt & 4::
	Gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	gosub, Ch_4
	Gui, PG_SL:Destroy
	return
RAlt & 5::
	Gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	gosub, Ch_5
	Gui, PG_SL:Destroy
	return
RAlt & 6::
	Gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	gosub, Ch_6
	Gui, PG_SL:Destroy
	return
RAlt & 7::
	Gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	gosub, Ch_7
	Gui, PG_SL:Destroy
	return
RAlt & 8::
	Gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	gosub, Ch_8
	Gui, PG_SL:Destroy
	return
RAlt & 9::
	Gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	gosub, Ch_9
	Gui, PG_SL:Destroy
	return
RAlt & 0::
	Gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	gosub, Ch_10
	Gui, PG_SL:Destroy
	return
;##################################
;##################################	Program Select
call_Select_Program_Gui:
	Gui,PG_SL:destroy
	temp_N := 1
	loop 10
	{
		IniRead,Name_%temp_N%,Path\path.ini,Name,Name_%temp_N%
		temp_N++
	}
	temp_P := 1
	
	loop 10
	{
		IniRead,Path_%temp_P%,Path\path.ini,Path,Path_%temp_P%
		temp_P++
	}
	;Apply and Confirm Button
	;--------------------
	Gui, PG_SL:Add, button, w48 h25 x423 y350 vapply_var gsave_apply, Apply
	Gui, PG_SL:Add, button, w55 h25 x310 y350 vconfirm_var gsave_confirm default, Con&firm


	Gui, PG_SL:Font, s20, System
		;make a groupbox
	Gui, PG_SL:Add, GroupBox, w465 h320 x10 y5
		;title
	Gui, PG_SL:Add, text, x15 y0, Name:
	Gui, PG_SL:Add, text, x110 y0, Path:

		;Name
	;------------------------
	Gui, PG_SL:Add, edit, w80 h25 x30 y20 vName_1 ,%Name_1%
	num :=3
	counter_ps :=2
	temp_ar :=[]
	loop 9
	{
		;var := Name_%counter_ps%
		temp_ar[counter_ps] := Name_%counter_ps%
		Gui, PG_SL:Add, edit, w80 h25 x30 y+5 vName_%counter_ps% ,% temp_ar[counter_ps]
		num :=num+2
		counter_ps++
	}
	Gui, PG_SL:Font, normal

		;Path
	;------------------------
	Gui, PG_SL:Font, s12, Consolas
	Gui, PG_SL:Add, edit, w250 h25 x+10 y20 vPath_1, %Path_1%
	num :=4
	counter_ps :=2
	temp_ar :=[]
	loop, 9
	{
		var :=Path_%counter_ps%
		Gui, PG_SL:Add, edit, w250 h25 y+5 vPath_%counter_ps%     , %var%
		counter_ps++
		num := num+2
	}
	Gui, PG_SL:Font, normal

		;Button
	;------------------------
	Gui, PG_SL:Font, s10, Corbel
		;Blank Button
	counter_ps :=1
	Gui, PG_SL:Add, button, w43 h25 x+5 y20 vB_%counter_ps% gB_%counter_ps%, Blank
	loop 9
	{
		counter_ps++
		Gui, PG_SL:Add, button, w43 h25 y+5 vB_%counter_ps% gB_%counter_ps%, Blank
	}
		;Check Button
	counter_ps := 1
	Gui, PG_SL:Add, button, w48 h25 x+5 y20 vCh_%counter_ps% gCh_%counter_ps%, Check
	loop, 9
	{
		counter_ps++
		Gui, PG_SL:Add, button, w48 h25 y+5 vCh_%counter_ps% gCh_%counter_ps%, Check
	}
	Gui, PG_SL:Font, normal
		;reset apply confirm cancel
	;--------------------------------
	Gui, PG_SL:Add, button, w65 h25 x5 y350 greset_button, Reset All
	;Gui, PG_SL:Add, button, w48 h25 x423 y350 vapply_var gPG_SL_Apply, Apply
	Gui, PG_SL:Add, button, w48 h25 x370 y350 vcancel_var gcancel_button , &Cancel
	;Gui, PG_SL:Add, button, w55 h25 x310 y350 vconfirm_var gPG_SL_Confirm, Confirm
	;Gui, +AlwaysOnTop +LastFound 
	;Gui, PG_SL:+ToolWindow
	;============ralt shortcut
	if(GetKeyState("ralt","P")){
		return
	}
	;============
	Gui, PG_SL:Show, w480 h380, Shortcut 
	return

save_apply:
	GuiControl,Disable,apply_var
	Gui, submit,nohide
	save_name_temp := 1
	loop 10
	{
		name_temp := Name_%save_name_temp%
		IniWrite,%name_temp%,Path\path.ini,Name,Name_%save_name_temp%
		save_name_temp++
	}
	save_path_temp := 1
	loop 10
	{
		path_temp := Path_%save_path_temp%
		IniWrite, %path_temp%,Path\path.ini,Path,Path_%save_path_temp%
		
		save_path_temp++
	}
	sleep,50
	GuiControl, Enable,apply_var
	return
save_confirm:
	Gui, submit,hide
	save_name_temp := 1
	loop 10
	{
		name_temp := Name_%save_name_temp%
		IniWrite,%name_temp%,Path\path.ini,Name,Name_%save_name_temp%
		save_name_temp++
	}
	save_path_temp := 1
	loop 10
	{
		path_temp := Path_%save_path_temp%
		IniWrite, %path_temp%,Path\path.ini,Path,Path_%save_path_temp%
		
		save_path_temp++
	}
	FileDelete,Path\temp.ini
	return	
cancel_button:
	Gui,PG_SL:Submit,nohide
	tempp := 1
	loop 10
	{
		ntem :=Name_%tempp%
		IniWrite,%ntem%,Path\temp.ini,Name,Name_%tempp%
		tempp++
	}
	tempp := 1
	loop 10
	{
		ntem :=Path_%tempp%
		IniWrite,%ntem%,Path\temp.ini,Path,Path_%tempp%
		tempp++
	}
	tempp := 1
	loop 10
	{
		IniRead,chpn,Path\path.ini,Name,Name_%tempp%
		IniRead,chtn,Path\temp.ini,Name,Name_%tempp%
		IniRead,chpp,Path\path.ini,Path,Path_%tempp%
		IniRead,chtp,Path\temp.ini,Path,Path_%tempp%
		if(chpn!=chtn || chpp!=chtp)
		{
			Msgbox,3,Save,Do you want to save?
			ifMsgbox Yes
			{
				savet := 1
				loop 10
				{
					t1:=Name_%savet%
					t2:=Path_%savet%
					IniWrite,%t1%,Path\path.ini,Name,Name_%savet%
					IniWrite,%t2%,Path\path.ini,Path,Path_%savet%
					savet++
				}
				Gui,PG_SL:destroy
				break
			}
			ifMsgbox No
			{
				Gui,PG_SL:destroy
				break
			}
			else
			{
				break
			}

		}
		tempp++
	}
	Gui,PG_SL:destroy
	FileDelete,Path\temp.ini
	return

PG_SLGuiClose:
	Gui,PG_SL:Submit,nohide
	tempp := 1
	loop 10
	{
		ntem :=Name_%tempp%
		IniWrite,%ntem%,Path\temp.ini,Name,Name_%tempp%
		tempp++
	}
	tempp := 1
	loop 10
	{
		ntem :=Path_%tempp%
		IniWrite,%ntem%,Path\temp.ini,Path,Path_%tempp%
		tempp++
	}
	tempp := 1
	loop 10
	{
		IniRead,chpn,Path\path.ini,Name,Name_%tempp%
		IniRead,chtn,Path\temp.ini,Name,Name_%tempp%
		IniRead,chpp,Path\path.ini,Path,Path_%tempp%
		IniRead,chtp,Path\temp.ini,Path,Path_%tempp%
		if(chpn!=chtn || chpp!=chtp)
		{
			Msgbox,4,Save,Do you want to save?
			ifMsgbox Yes
			{
				savet := 1
				loop 10
				{
					t1:=Name_%savet%
					t2:=Path_%savet%
					IniWrite,%t1%,Path\path.ini,Name,Name_%savet%
					IniWrite,%t2%,Path\path.ini,Path,Path_%savet%
					savet++
				}
				Gui,PG_SL:destroy
				break
			}
			else
			{
				Gui,PG_SL:destroy
				break
			}
		}
		tempp++
	}
	Gui,PG_SL:destroy
	FileDelete,Path\temp.ini
	return
;Button select label
	B_1:
		GuiControl, Disable, B_1
		GuiControl,PG_SL:, Name_1,
		GuiControl, PG_SL:, Path_1,
		Sleep, 50
		GuiControl, Enable, B_1
		return
	B_2:
		GuiControl, Disable, B_2
		GuiControl,PG_SL:, Name_2,
		GuiControl, PG_SL:, Path_2,
		Sleep, 50
		GuiControl, Enable, B_2
		return
	B_3:
		GuiControl, Disable, B_3
		GuiControl,PG_SL:, Name_3,
		GuiControl, PG_SL:, Path_3,
		Sleep, 50
		GuiControl, Enable, B_3
		return
	B_4:
		GuiControl, Disable, B_4
		GuiControl,PG_SL:, Name_4,
		GuiControl, PG_SL:, Path_4,
		Sleep, 50
		GuiControl, Enable, B_4
		return
	B_5:
		GuiControl, Disable, B_5
		GuiControl,PG_SL:, Name_5,
		GuiControl, PG_SL:, Path_5,
		Sleep, 50
		GuiControl, Enable, B_5
		return
	B_6:
		GuiControl, Disable, B_6
		GuiControl,PG_SL:, Name_6,
		GuiControl, PG_SL:, Path_6,
		Sleep, 50
		GuiControl, Enable, B_6
		return
	B_7:
		GuiControl, Disable, B_7
		GuiControl,PG_SL:, Name_7,
		GuiControl, PG_SL:, Path_7,
		Sleep, 50
		GuiControl, Enable, B_7
		return
	B_8:
		GuiControl, Disable, B_8
		GuiControl,PG_SL:, Name_8,
		GuiControl, PG_SL:, Path_8,
		Sleep, 50
		GuiControl, Enable, B_8
		return
	B_9:
		GuiControl, Disable, B_9
		GuiControl,PG_SL:, Name_9,
		GuiControl, PG_SL:, Path_9,
		Sleep, 50
		GuiControl, Enable, B_9
		return
	B_10:
		GuiControl, Disable, B_10
		GuiControl,PG_SL:, Name_10,
		GuiControl, PG_SL:, Path_10,
		Sleep, 50
		GuiControl, Enable, B_10
		return
	;Check Button
	Ch_1:
		Gui,PG_SL:Submit,nohide
		GuiControl, Disable, Ch_1
		IniWrite,%Path_1%,Path\temp.ini,Path,Path_1
		IniRead,ch1,Path\temp.ini,Path,Path_1
		Run, %ch1%, ,UseErrorLevel
		if ErrorLevel
		{
			msgbox, It cannot work.
		}
		Sleep, 50
		GuiControl, Enable, Ch_1
		return
	Ch_2:
		Gui,PG_SL:Submit,nohide
		GuiControl, Disable, Ch_2
		IniWrite,%Path_2%,Path\temp.ini,Path,Path_2
		IniRead,ch2,Path\temp.ini,Path,Path_2
		Run, %ch2%, ,UseErrorLevel
		if ErrorLevel
		{
			msgbox,It cannot work.
		}
		Sleep, 50
		GuiControl, Enable, Ch_2
		return
	Ch_3:
		Gui,PG_SL:Submit,nohide
		GuiControl, Disable, Ch_3
		IniWrite,%Path_3%,Path\temp.ini,Path,Path_3
		IniRead,ch3,Path\temp.ini,Path,Path_3
		Run, %ch3%, ,UseErrorLevel
		if ErrorLevel
		{
			msgbox,It cannot work.
		}
		Sleep, 50
		GuiControl, Enable, Ch_3
		return
	Ch_4:
		Gui,PG_SL:Submit,nohide
		GuiControl, Disable, Ch_4
		IniWrite,%Path_4%,Path\temp.ini,Path,Path_4
		IniRead,ch4,Path\temp.ini,Path,Path_4
		Run, %ch4%, ,UseErrorLevel
		if ErrorLevel
		{
			msgbox,It cannot work.
		}
		Sleep, 50
		GuiControl, Enable, Ch_4
		return
	Ch_5:
		Gui,PG_SL:Submit,nohide
		GuiControl, Disable, Ch_5
		IniWrite,%Path_5%,Path\temp.ini,Path,Path_5
		IniRead,ch5,Path\temp.ini,Path,Path_5
		Run, %ch5%, ,UseErrorLevel
		if ErrorLevel
		{
			msgbox,It cannot work.
		}
		Sleep, 50
		GuiControl, Enable, Ch_5
		return
	Ch_6:
		Gui,PG_SL:Submit,nohide
		GuiControl, Disable, Ch_6
		IniWrite,%Path_6%,Path\temp.ini,Path,Path_6
		IniRead,ch6,Path\temp.ini,Path,Path_6
		Run, %ch6%, ,UseErrorLevel
		if ErrorLevel
		{
			msgbox,It cannot work.
		}
		Sleep, 50
		GuiControl, Enable, Ch_6
		return
	Ch_7:
		Gui,PG_SL:Submit,nohide
		GuiControl, Disable, Ch_7
		IniWrite,%Path_7%,Path\temp.ini,Path,Path_7
		IniRead,ch7,Path\temp.ini,Path,Path_7
		Run, %ch7%, ,UseErrorLevel
		if ErrorLevel
		{
			msgbox,It cannot work.
		}
		Sleep, 50
		GuiControl, Enable, Ch_7
		return
	Ch_8:
		Gui,PG_SL:Submit,nohide
		GuiControl, Disable, Ch_8
		IniWrite,%Path_8%,Path\temp.ini,Path,Path_8
		IniRead,ch8,Path\temp.ini,Path,Path_8
		Run, %ch8%, ,UseErrorLevel
		if ErrorLevel
		{
			msgbox,It cannot work.
		}
		Sleep, 50
		GuiControl, Enable, Ch_8
		return
	Ch_9:
		Gui,PG_SL:Submit,nohide
		GuiControl, Disable, Ch_9
		IniWrite,%Path_9%,Path\temp.ini,Path,Path_9
		IniRead,ch9,Path\temp.ini,Path,Path_9
		Run, %ch9%, ,UseErrorLevel
		if ErrorLevel
		{
			msgbox,It cannot work.
		}
		Sleep, 50
		GuiControl, Enable, Ch_9
		return
	Ch_10:
		Gui,PG_SL:Submit,nohide
		GuiControl, Disable, Ch_10
		IniWrite,%Path_10%,Path\temp.ini,Path,Path_10
		IniRead,ch10,Path\temp.ini,Path,Path_10
		Run, %ch10%, ,UseErrorLevel
		if ErrorLevel
		{
			msgbox,It cannot work.
		}
		Sleep, 50
		GuiControl, Enable, Ch_10
		return
reset_button:
	GuiControl, Disable, cancel_var
	Msgbox,4,Reset All, Are you sure to reset all?
	ifMsgbox Yes
	{
		counter := 0
		Loop, 20
		{
			counter++
			GuiControl, ,Name_%counter%, 
			GuiControl, ,Path_%counter%, 
		}
		Sleep, 50
	}
	GuiControl, Enable, cancel_var
	return
call_reload:
	Reload
	return
call_gui_ps:
	gui, PG_SL:Destroy
	gosub call_Select_Program_Gui
	return
can_tool_5: ;cancel tooltip 5
	tooltip,,,,5
	return
can_tool_6:
	tooltip,,,,6
	return

MouseKey_WU:
	LAlt & WheelUp::
		if(mu==null)
			mu:=1
		WN--
		mu := mod(WN,10)+1
		IniRead,Name_%mu%,Path\path.ini,Name,Name_%mu%
		IniRead,Path_%mu%,Path\path.ini,Path,Path_%mu%
		if(Path_%mu%==null)
		{
			loop 10
			{
				WN--
				mu :=mod(WN,10)+1
				IniRead,check_path_null,Path\path.ini,Path,Path_%mu%
				if(check_path_null!=null)
					break
			}
		}
		IniRead,Name_tooltip_show,Path\path.ini,Name,Name_%mu%
		IniRead,Path_tooltip_check,Path\path.ini,Path,Path_%mu%
		if(Name_tooltip_show==null && Path_tooltip_check!=null)
			tooltip,Null_%mu%,,,5
		else if(Name_tooltip_show!=null)
			tooltip,%Name_tooltip_show%,,,5
		SetTimer, can_tool5, -2000

		/*
		WN :=WN-2
		WN_plus_null_programe :=0
		WN_minus_null_programe :=1
		Sleep,100
		goto Program_Select
		*/
		return
MouseKey_WD:
	LAlt & WheelDown::
		if(mu==null)
			mu:=1
		WN++
		mu := mod(WN,10)+1
		IniRead,Name_%mu%,Path\path.ini,Name,Name_%mu%
		IniRead,Path_%mu%,Path\path.ini,Path,Path_%mu%
		if(Path_%mu%==null)
		{
			loop 10
			{
				WN++
				mu :=mod(WN,10)+1
				IniRead,check_path_null,Path\path.ini,Path,Path_%mu%
				if(check_path_null!=null)
					break
			}
		}
		IniRead,Name_tooltip_show,Path\path.ini,Name,Name_%mu%
		IniRead,Path_tooltip_check,Path\path.ini,Path,Path_%mu%
		if(Name_tooltip_show==null && Path_tooltip_check!=null)
			tooltip,Null_%mu%,,,5
		else if(Name_tooltip_show!=null)
			tooltip,%Name_tooltip_show%,,,5
		SetTimer, can_tool5, -2000


/*
		WN :=WN+2
		WN_minus_null_programe :=0
		WN_plus_null_programe :=1
		Sleep,100
		goto Program_Select
*/
		return
MouseKey_ST:
	LAlt & RButton::
		if(mu==null)
		{
			mu :=1
		}
		multi_select := 1 ;if you push alt multiselect program, it will open last one.
		SetTimer, Openfile_set_program, -100
		Tooltip,OK`nIt will open the last one`, you have chosen.,,,6
		SetTimer, can_tool_6, -1000
		return

Openfile_set_program:
	;Open_program := mu+1
	IniRead, RL_Program, Path\path.ini,Path,Path_%mu%
	multi_select := !multi_select
	Loop
	{
		if(GetKeyState("Alt","P")!=1 || GetKeyState("tab","P")!=1)
		{
			PostMessage, 0x50, 0, 0x4090409,, A ;英文輸入
		
			try{
				;;;;;;;;;;;;;;;;;;;;;
				; check directory
				gosub, check_directory_
				;if(count_environment0==0)
					;return
				;;;;;;;;;;;;;;;;;;;;;
			}

			Run, %RL_Program%, % Explorer_GetSelection() , UseErrorLevel
			if ErrorLevel
			{
				msgbox, It cannot work.
			}



			try{
				;;;;;;;;;;;;;;;;;;;;;
				; delete new directory
				gosub, delete_temp_new_diretory
				;;;;;;;;;;;;;;;;;;;;;
			}



			WN :=9999
			break
		}
		else if(multi_select==1)
		{
			break
		}
	}
	gosub, can_tool
	return
;============== Program Select ==============
;============================================

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ get title 1 @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
getTitleParameter:
	CoordMode, tooltip, screen
	DetectHiddenText, On
	getTitleIndex := 0
	getTitle_switch := 0
	markWindowShow := ""
	;delete "default" section
	besidesSection := 2
	
	if !FileExist("getTitle"){
		FileCreateDir, getTitle	
	}
	if !FileExist("getTitle\mark.ini"){
		markFile := FileOpen("getTitle\mark.ini","a")
		markFile.write("[DEFAULT]`ndefaultIndex=1`n[SelectName]`n[MARK1]")
		markFile.close
		IniRead, defaultMARK, getTitle\mark.ini, DEFAULT, defaultIndex
		;counting key number in section
		IniRead, MARK, getTitle\mark.ini, MARK1
		StringSplit, markKeyCount, MARK, `n
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		getTitleIndex := markKeyCount0
		loop, %markKeyCount0%
		{
			IniRead, markWindowArray%A_Index%, getTitle\mark.ini, MARK1, mark%A_Index%
			markWindowShow := % markWindowShow .  markWindowArray%A_Index% . "`n"
		}
	}
	else{
		IniRead, defaultMARK, getTitle\mark.ini, DEFAULT, defaultIndex
		;counting key number in section
		IniRead, MARK, getTitle\mark.ini, MARK%defaultMARK%
		StringSplit, markKeyCount, MARK, `n
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		getTitleIndex := markKeyCount0
		loop, %markKeyCount0%
		{
			IniRead, markWindowArray%A_Index%, getTitle\mark.ini, MARK%defaultMARK%, mark%A_Index%
			markWindowShow := % markWindowShow .  markWindowArray%A_Index% . "`n"
		}
	}
;--------------------   Add Tray
	Menu, Tray, add
	Menu, Tray, add, getTitle 1, openMarkWindow




	return
;@@@@@@@@@@


/*
lshift & wheelup::
	return
lshift & wheeldown::
	return
*/
lshift & esc::
	gosub, checkNewSection
	getTitleIndex += 1
	WinGetTitle,  markWindowArray%getTitleIndex%, A
	loop % getTitleIndex-1
	{
		if( markWindowArray%A_Index%== markWindowArray%getTitleIndex%){
			getTitleIndex -= 1
			tooltip, Haved marked,A_ScreenWidth/2, A_ScreenHeight/8,
			KeyWait, esc
			tooltip, %markWindowShow%`n,0,0
			return
		}
	}
	markWindowShow := % markWindowShow .  markWindowArray%getTitleIndex% . "`n"
	tooltip, %markWindowShow%`n,0,0
	;write in file
	IniWrite, % markWindowArray%getTitleIndex%, getTitle\mark.ini, MARK%defaultMARK%, mark%getTitleIndex%
	;;;;;;;;;;;;;;
	KeyWait, esc
	KeyWait, lshift
	settimer,markWindowcan_tool, -10000 
	return
tab & sc039::
sc039 & 0::
lshift & capslock:: 
	tooltip
	;getTitle_switch := !getTitle_switch
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	/*
		-1: The window is minimized 
		1: The window is maximized
		0: The window is neither minimized nor maximized.
	*/
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	WinGet, check_win_min, MinMax, % markWindowArray%getTitleIndex%
	if(check_win_min==-1){
		getTitle_switch := 1
	}
	else{
		getTitle_switch := 0
		the_last_one := % markWindowArray%getTitleIndex%
		if !WinActive(the_last_one){
			getTitle_switch := 1
		}
	}
	if(getTitle_switch==1)
	{
		tooltip, Show window,A_ScreenWidth/2, A_ScreenHeight/8, 3
		countOpenFile := 0
		loop %getTitleIndex%{
			if WinExist(markWindowArray%A_Index%){
				Winactive( markWindowArray%A_Index%)
				WinRestore, %  markWindowArray%A_Index%
				WinActivate,% markWindowArray%A_Index%
				countOpenFile += 1
				tooltip, [%countOpenFile%/%getTitleIndex%],A_ScreenWidth/2, A_ScreenHeight/8,
			}
				tooltip, [%countOpenFile%/%getTitleIndex%],A_ScreenWidth/2, A_ScreenHeight/8,
		}
		WinSet, AlwaysOnTop, On, %  markWindowArray%getTitleIndex%
		WinSet, AlwaysOnTop, Off, %  markWindowArray%getTitleIndex%
		settimer,markWindowcan_tool, -5000 
	}
	else{
		tooltip, Minimize window,A_ScreenWidth/2, A_ScreenHeight/8,3
		loop %getTitleIndex%{
			if WinExist( markWindowArray%A_Index%){
				Winactive( markWindowArray%A_Index%)
				;Minimize
				WinMinimize, %  markWindowArray%A_Index%
				;;;;;;;;;;;;;;;;;;;; WinActivate may break
				;WinSet, Bottom,, %  markWindowArray%A_Index%
				;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			}
		}
	}
	settimer, markWindowcan_tool, -1000
	KeyWait, tab
	return
openMarkWindow:
lshift & tab::
	try{
		; use to close exist "mark" window
		Gui, markwindow:Add, Button,vmark_var_top, "to check window exist"
	}
	catch{
		Gui, markwindow:destroy
		return
	}
	;check all window close
	gosub, destroyAllWindow
	Gui, markwindow:New
	gosub, countSectionNumber
	if(MARKCount0>=defaultMARK)
	{
		IniRead, mark1, getTitle\mark.ini, MARK1, mark1
		if(mark1!="ERROR"){
			Gui, markwindow:Add, Edit, w100 vSelectName%defaultMARK% gnamingSelect,
		}
	}
	tooltip
	;guicontrol to show Select Name
	loop %MARKCount0%
	{
		IniRead, SelectName%A_Index%, getTitle\mark.ini, SelectName, name%A_Index%
	}
	if(SelectName%defaultMARK%!="ERROR")
	{
		guicontrol, text, SelectName%defaultMARK%, % SelectName%defaultMARK%
	}
	loop %getTitleIndex%
	{
		if(A_Index==getTitleIndex){
			Gui, markwindow:Add, Radio, y+10 vMarkWindow%A_Index% Checked, %  markWindowArray%A_Index%
		}
		else{
			Gui, markwindow:Add, Radio, y+10  vMarkWindow%A_Index% , %  markWindowArray%A_Index%
		}
	}
	Gui, markwindow:Add, Button, Default w40 h30 gmarkwindowSelectAdd, &Add
	Gui, markwindow:Add, Button, Default w40 h30 x+5 gmarkWindowEdi, &Edit
	Gui, markwindow:Add, Button, Default w40 h30 x+5 gmarkWindowSelect, &Select
	Gui, markwindow:Add, Button, Default w40 h30 x+5 gmarkWindowDelWindow, &Del
	Gui, markwindow:Add, Button, Default w40 h30 x+5 vmark_var_top gmarkWindowTop, &Top
	Gui, markwindow:+AlwaysOnTop
	Gui, markwindow:show
	KeyWait, capslock
	return
lshift & rbutton::
	markWindowShow_ := ""
	loop %getTitleIndex%
	{
		markWindowShow_ := % markWindowShow_ .  markWindowArray%A_Index% . "`n"
	}
	tooltip, %markWindowShow_%,A_ScreenWidth/2, A_ScreenHeight/8,2
	;tooltip, %markWindowShow_%,,,2
	KeyWait, lshift
	tooltip,,,,2
	return




markWindowcan_tool:
	tooltip, ,A_ScreenWidth/2, A_ScreenHeight/2,3
	tooltip
	return

markWindowTop:
	Gui, markwindow:Submit
	;GuiControl, markwindow:focus, mark_var_top
	
	loop %getTitleIndex%
	{
		if(MarkWindow%A_Index%==1){
			markIndex := A_Index
			;change value
			temp := %  markWindowArray%A_Index%
			markWindowArray%markIndex% := %  markWindowArray%getTitleIndex%
			markWindowArray%getTitleIndex% := temp
			; write in ini
			IniWrite, % markWindowArray%getTitleIndex%, getTitle\mark.ini, MARK%defaultMARK%, mark%getTitleIndex%
			IniWrite, % markWindowArray%markIndex%, getTitle\mark.ini, MARK%defaultMARK%, mark%markIndex%
			;;;;;;;;;;;;;;
			break
		}
	}
	gosub, resetmarkWindowShow
	Gui, markwindow:Destroy
	return
markWindowDelWindow:
	Gui, markwindow:Submit
	Gui, markwindow:Destroy
	Gui, markwindowDel:Destroy
	loop %getTitleIndex%
	{
		Gui, markwindowDel:Add, CheckBox, vDelArrayContent%A_Index%, % markWindowArray%A_Index%
	}
	Gui, markwindowDel:Add, Button, w40 h30 gmarkWindowDelOK, Delete
	Gui, markwindowDel:Add, Button, w70 h30 x+15 gmarkWindowDelAll, Select All
	Gui, markwindowDel:+AlwaysOnTop
	Gui, markwindowDel:show
	return
markWindowDelAll:
	loop %getTitleIndex%
	{
		GuiControl,, DelArrayContent%A_Index%, 1
	}
	return
markWindowDelOK:
	Gui, markwindowDel:Submit
	gosub, markWindowDelOKFunction
	gosub, openMarkWindow
	return
markWindowDelOKFunction:
	nullCount := 0
	;checked choice assigned to null.
	loop %getTitleIndex%
	{
		if(DelArrayContent%A_Index%==1){
			markWindowArray%A_Index% := null
			nullCount += 1
		}
	}
	temp_index := 0
	loop %getTitleIndex%
	{
		
		if(markWindowArray%A_Index%!=null){
			temp_index += 1
			temp%temp_index% := % markWindowArray%A_Index%
		}
	}
	getTitleIndex -= nullCount
	loop %getTitleIndex%
	{
		markWindowArray%A_Index% := % temp%A_Index%
		IniWrite, % markWindowArray%A_Index%, getTitle\mark.ini, MARK%defaultMARK%, mark%A_Index%
	}
	loop %nullCount%
	{
		temp_del := getTitleIndex + A_Index
		IniDelete, getTitle\mark.ini, MARK%defaultMARK%, mark%temp_del%
	}
	nullCount := null
	temp_del := null
	temp_index := null
	;if section content all delete, change last section to this section
	if(getTitleIndex == 0)
	{
		gosub, countSectionNumber
	
		;if delete last section
		if(defaultMARK==MARKCount0){
			MARKCount0 -= 1
			IniRead, MARK, getTitle\mark.ini, MARK%MARKCount0%
			StringSplit, markKeyCount, MARK, `n
			loop %markKeyCount0%
			{
				IniRead, markWindowArray%A_Index%, getTitle\mark.ini, MARK%MARKCount0%, mark%A_Index%
				
			}

			defaultMARK -=1
			if(defaultMARK==0){
				defaultMARK :=1
			}
			gosub, writeInIniDefaultSection
			lastSectionDelete_temp := defaultMARK +1

			IniDelete, getTitle\mark.ini, MARK%lastSectionDelete_temp%
			IniDelete, getTitle\mark.ini, SelectName, name%lastSectionDelete_temp%
		}
		else{
			;counting key number in section
			IniRead, MARK, getTitle\mark.ini, MARK%MARKCount0%
			StringSplit, markKeyCount, MARK, `n
			loop %markKeyCount0%
			{
				IniRead, markWindowArray%A_Index%, getTitle\mark.ini, MARK%MARKCount0%, mark%A_Index%
				IniWrite, % markWindowArray%A_Index%, getTitle\mark.ini,MARK%defaultMARK%, mark%A_Index%
			}
			IniDelete, getTitle\mark.ini, MARK%MARKCount0%
			;write last name to the delete one
			IniRead, temp_SelectName, getTitle\mark.ini, SelectName, name%MARKCount0%
			IniDelete, getTitle\mark.ini, SelectName, name%MARKCount0%
			IniWrite, %temp_SelectName%, getTitle\mark.ini,  SelectName, name%defaultMARK%
		}
		if(MARKCount0==0){
			markFile := FileOpen("getTitle\mark.ini","w")
			markFile.write("[DEFAULT]`ndefaultIndex=1`n[SelectName]`n[MARK1]")
			markFile.close
		}
		gosub,countSectionNumber

		getTitleIndex := markKeyCount0
	}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	gosub, resetmarkWindowShow
	return
markWindowEdi:
	Gui, markwindow:Submit
	Gui, markwindow:destroy
	Gui, markwindowEdit:New
	loop %getTitleIndex%
	{
		Gui, markwindowEdit:Add, Edit, vEditArrayContent%A_Index%, %  markWindowArray%A_Index%
	}
	Gui, markwindowEdit:Add, Button, Default gmarkWindowEditOK, OK
	Gui, markwindowEdit:+AlwaysOnTop
	Gui, markwindowEdit:show
	return
markWindowEditOK:
	Gui, markwindowEdit:Submit
	loop %getTitleIndex%
	{
		markWindowArray%A_Index% := % EditArrayContent%A_Index%
		IniWrite, % markWindowArray%A_Index%, getTitle\mark.ini, MARK%defaultMARK%, mark%A_Index%
	}
	gosub, resetmarkWindowShow
	gosub, openMarkWindow
	return
markWindowSelect:
	Gui, markwindow:Destroy
	Gui, markwindowSelect:New
	gosub, countSectionNumber
	loop %MARKCount0%
	{
		IniRead, SelectName%A_Index%, getTitle\mark.ini, SelectName, name%A_Index%
		Gui, markwindowSelect:Add, Radio, vMARKSECTION%A_Index% gshowMARKSECTIONCONTENT, Select%A_Index% 
		if(SelectName%A_Index%!="ERROR"){
			GuiControl, text, MARKSECTION%A_Index%, % SelectName%A_Index%
		}
	}
	Gui, markwindowSelect:Add, Button, Default w40 h30 vmarkwindowSelectOKButton gmarkwindowSelectOK, OK
	GuiControl, Disable, markwindowSelectOKButton
	Gui, markwindowSelect:Add, Button, Default w40 h30 x+20 gmarkwindowSelectAdd, Add
	Gui, markwindowSelect:+AlwaysOnTop
	Gui, markwindowSelect:show
	return
markwindowSelectAdd:
	gosub, countSectionNumber
	defaultMARK := MARKCount0 + 1
	gosub, writeInIniDefaultSection
	gosub, createBlankSection
	gosub, resetmarkWindowShow
	gosub, readIniSectionMark
	gosub, markwindowSelectAddCloseTooltip
	Gui, markwindowSelect:destroy
	Gui, markwindow:destroy
	return

markwindowSelectOK:
	Gui, markwindowSelect:submit
	defaultMARK := MARKSECTION_temp_index
	gosub, writeInIniDefaultSection
	getTitleIndex := markKeyCount0
	loop %getTitleIndex%
	{
		IniRead, markWindowArray%A_Index%, getTitle\mark.ini, MARK%defaultMARK%, mark%A_Index%
		
	}
	; tooltip 4
	SetTimer, markWindowShow_Gui_tooltip, off
	tooltip,,,,4
	;;;;;;;;;;;;
	gosub, resetmarkWindowShow
	gosub, openMarkWindow
	return

showMARKSECTIONCONTENT:
	Gui, markwindowSelect:submit, nohide
	GuiControl, Enable, markwindowSelectOKButton
	loop %MARKCount0%
	{
		if(MARKSECTION%A_Index% == 1){
			;counting key number in section
			IniRead, MARK, getTitle\mark.ini, MARK%A_Index%
			StringSplit, markKeyCount, MARK, `n
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			markWindowShow_Gui := ""
			MARKSECTION_temp_index := A_Index
			loop %markKeyCount0%
			{
				IniRead, mark%A_Index%, getTitle\mark.ini, MARK%MARKSECTION_temp_index%, mark%A_Index%
				markWindowShow_Gui := % markWindowShow_Gui .  mark%A_Index% . "`n"
			}
		}
	}
	SetTimer, markWindowShow_Gui_tooltip, 50
	return
markwindowSelectGuiClose:
markwindowSelectAddCloseTooltip:
	SetTimer, markWindowShow_Gui_tooltip, off
	tooltip,, , , 4 
	Gui, markwindowSelect:destroy
	return
markWindowShow_Gui_tooltip:
	;tooltip,%markWindowShow_Gui%,A_ScreenWidth/2, A_ScreenHeight/8, 4 
	tooltip,%markWindowShow_Gui%,,, 4 
	return
resetmarkWindowShow:
	markWindowShow := ""
	loop %getTitleIndex%
	{
		markWindowShow := % markWindowShow .  markWindowArray%A_Index% . "`n"
	}
	return

readIniSectionMark:
	;counting key number in section
	IniRead, MARK, getTitle\mark.ini, MARK%defaultMARK%
	StringSplit, markKeyCount, MARK, `n
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	getTitleIndex := markKeyCount0
	loop, %markKeyCount0%
	{
		IniRead, markWindowArray%A_Index%, getTitle\mark.ini, MARK%defaultMARK%, mark%A_Index%
		markWindowShow := % markWindowShow .  markWindowArray%A_Index% . "`n"
	}
	gosub, resetmarkWindowShow
	return


/*
wheelSwithSectionContent:
	gosub, countSectionNumber
	wheelCountSectionNumber := MARKCount0 +1
	return
*/
countSectionNumber:
	;count number of sections
	IniRead, MARKSECTION, getTitle\mark.ini
	StringSplit, MARKCount, MARKSECTION, `n
	MARKCount0 -= besidesSection ;delete "default" section
	return
namingSelect:
	Gui, markwindow:submit, nohide
	;gosub, countSectionNumber
	IniWrite, % SelectName%defaultMARK%, getTitle\mark.ini,SelectName, name%defaultMARK% 
	return
writeInIniDefaultSection:
	IniWrite, %defaultMARK%, getTitle\mark.ini, DEFAULT, defaultIndex
	return
createBlankSection:
	IniWrite, "", getTitle\mark.ini, MARK%defaultMARK%, mark1
	return
checkNewSection:
	;count key number
	IniRead, MARK, getTitle\mark.ini, MARK%defaultMARK%
	StringSplit, markKeyCount, MARK, `n
	if(markKeyCount0==1){
		IniRead, mark1, getTitle\mark.ini, MARK%defaultMARK%, mark1
		if(mark1==""){
		IniDelete, getTitle\mark.ini, MARK%defaultMARK%, mark1
		getTitleIndex := 0
		}
	}
	gosub, resetmarkWindowShow
	
	return
markwindowGuiClose:
destroyAllWindow:
	Gui, markwindow:Destroy
	Gui, markwindowSelect:Destroy
	Gui, markwindowDel:Destroy
	Gui, markwindowEdit:Destroy
	return
;============== get title 1 ===============
;==========================================


;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ get title 2 @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
getTitleParameter2:
	CoordMode, tooltip, screen
	DetectHiddenText, On
	A2A := 0
	A3A := 0
	A4A := ""
	;delete "default" section
	A5A := 2
	
	if !FileExist("getTitle"){
		FileCreateDir, getTitle	
	}
	if !FileExist("getTitle\mark2A.ini"){
		mark2AFile := FileOpen("getTitle\mark2A.ini","a")
		mark2AFile.write("[DEFAULT]`ndefaultIndex=1`n[A27A]`n[A7A1]")
		mark2AFile.close
		IniRead, A6A, getTitle\mark2A.ini, DEFAULT, defaultIndex
		;counting key number in section
		IniRead, A7A, getTitle\mark2A.ini, A7A1
		StringSplit, mark2AKeyCount, A7A, `n
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		A2A := mark2AKeyCount0
		loop, %mark2AKeyCount0%
		{
			IniRead, mark2AWindowArray%A_Index%, getTitle\mark2A.ini, A7A1, mark2A%A_Index%
			A4A := % A4A .  mark2AWindowArray%A_Index% . "`n"
		}
	}
	else{
		IniRead, A6A, getTitle\mark2A.ini, DEFAULT, defaultIndex
		;counting key number in section
		IniRead, A7A, getTitle\mark2A.ini, A7A%A6A%
		StringSplit, mark2AKeyCount, A7A, `n
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		A2A := mark2AKeyCount0
		loop, %mark2AKeyCount0%
		{
			IniRead, mark2AWindowArray%A_Index%, getTitle\mark2A.ini, A7A%A6A%, mark2A%A_Index%
			A4A := % A4A .  mark2AWindowArray%A_Index% . "`n"
		}
	}
;--------------------   Add Tray
	Menu, Tray, add, getTitle 2, A8A

	return
rshift & esc::
	gosub, A11A
	A2A += 1
	WinGetTitle,  mark2AWindowArray%A2A%, A
	loop % A2A-1
	{
		if( mark2AWindowArray%A_Index%== mark2AWindowArray%A2A%){
			A2A -= 1
			tooltip, Haved mark2Aed,A_ScreenWidth/2, A_ScreenHeight/8,
			KeyWait, esc
			tooltip, %A4A%`n,0,0
			return
		}
	}
	A4A := % A4A .  mark2AWindowArray%A2A% . "`n"
	tooltip, %A4A%`n,0,0
	;write in file
	IniWrite, % mark2AWindowArray%A2A%, getTitle\mark2A.ini, A7A%A6A%, mark2A%A2A%
	;;;;;;;;;;;;;;
	KeyWait, esc
	KeyWait, rshift
	settimer,mark2AWindowcan_tool, -10000 
	return
capslock & sc039::
rshift & capslock:: 
	tooltip
	;A3A := !A3A
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	/*
		-1: The window is minimized 
		1: The window is maximized
		0: The window is neither minimized nor maximized.
	*/
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	WinGet, A12A, MinMax, % mark2AWindowArray%A2A%
	if(A12A==-1){
		A3A := 1
	}
	else{
		A3A := 0
		A13 := % mark2AWindowArray%A2A%
		if !WinActive(A13){
			A3A := 1
		}
	}
	if(A3A==1)
	{
		tooltip, Show window,A_ScreenWidth/2, A_ScreenHeight/8,3
		A14A := 0
		loop %A2A%{
			if WinExist(mark2AWindowArray%A_Index%){
				Winactive( mark2AWindowArray%A_Index%)
				WinRestore, %  mark2AWindowArray%A_Index%
				WinActivate,% mark2AWindowArray%A_Index%
				A14A += 1
				tooltip, [%A14A%/%A2A%],A_ScreenWidth/2, A_ScreenHeight/8,
			}
				tooltip, [%A14A%/%A2A%],A_ScreenWidth/2, A_ScreenHeight/8,
		}
		WinSet, AlwaysOnTop, On, %  mark2AWindowArray%A2A%
		WinSet, AlwaysOnTop, Off, %  mark2AWindowArray%A2A%
		settimer,mark2AWindowcan_tool, -5000 
	}
	else{
		tooltip, Minimize window,A_ScreenWidth/2, A_ScreenHeight/8,3
		loop %A2A%{
			if WinExist( mark2AWindowArray%A_Index%){
				Winactive( mark2AWindowArray%A_Index%)
				;Minimize
				WinMinimize, %  mark2AWindowArray%A_Index%
				;;;;;;;;;;;;;;;;;;;; WinActivate may break
				;WinSet, Bottom,, %  mark2AWindowArray%A_Index%
				;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			}
		}
	}
	settimer, mark2AWindowcan_tool, -1000
	KeyWait, tab
	return
A8A:
rshift & tab::
	try{
		; use to close exist "mark2A" window
		Gui, mark2Awindow:Add, Button,vmark2A_var_top, "to check window exist"
	}
	catch{
		Gui, mark2Awindow:destroy
		return
	}
	;check all window close
	gosub, A15A
	Gui, mark2Awindow:New
	gosub, A16A
	if(A7ACount0>=A6A)
	{
		IniRead, mark2A1, getTitle\mark2A.ini, A7A1, mark2A1
		if(mark2A1!="ERROR"){
			Gui, mark2Awindow:Add, Edit, w100 vA27A%A6A% gA17A,
		}
	}
	tooltip
	;guicontrol to show Select Name
	loop %A7ACount0%
	{
		IniRead, A27A%A_Index%, getTitle\mark2A.ini, A27A, A28A%A_Index%
	}
	if(A27A%A6A%!="ERROR")
	{
		guicontrol, text, A27A%A6A%, % A27A%A6A%
	}
	loop %A2A%
	{
		if(A_Index==A2A){
			Gui, mark2Awindow:Add, Radio, y+10 vA33A%A_Index% Checked, %  mark2AWindowArray%A_Index%
		}
		else{
			Gui, mark2Awindow:Add, Radio, y+10  vA33A%A_Index% , %  mark2AWindowArray%A_Index%
		}
	}
	Gui, mark2Awindow:Add, Button, Default w40 h30 gmark2AwindowSelectAdd, &Add
	Gui, mark2Awindow:Add, Button, Default w40 h30 x+5 gmark2AWindowEdi, &Edit
	Gui, mark2Awindow:Add, Button, Default w40 h30 x+5 gmark2AWindowSelect, &Select
	Gui, mark2Awindow:Add, Button, Default w40 h30 x+5 gmark2AWindowDelWindow, &Del
	Gui, mark2Awindow:Add, Button, Default w40 h30 x+5 vmark2A_var_top gmark2AWindowTop, &Top
	Gui, mark2Awindow:+AlwaysOnTop
	Gui, mark2Awindow:show
	KeyWait, capslock
	return
rshift & rbutton::
	A4A_ := ""
	loop %A2A%
	{
		A4A_ := % A4A_ .  mark2AWindowArray%A_Index% . "`n"
	}
	tooltip, %A4A_%,A_ScreenWidth/2, A_ScreenHeight/8,2
	KeyWait, rshift
	tooltip,,,,2
	return




mark2AWindowcan_tool:
	tooltip, ,,,3
	tooltip
	return

mark2AWindowTop:
	Gui, mark2Awindow:Submit
	;GuiControl, mark2Awindow:focus, mark2A_var_top
	
	loop %A2A%
	{
		if(A33A%A_Index%==1){
			mark2AIndex := A_Index
			;change value
			A31A := %  mark2AWindowArray%A_Index%
			mark2AWindowArray%mark2AIndex% := %  mark2AWindowArray%A2A%
			mark2AWindowArray%A2A% := A31A
			; write in ini
			IniWrite, % mark2AWindowArray%A2A%, getTitle\mark2A.ini, A7A%A6A%, mark2A%A2A%
			IniWrite, % mark2AWindowArray%mark2AIndex%, getTitle\mark2A.ini, A7A%A6A%, mark2A%mark2AIndex%
			;;;;;;;;;;;;;;
			break
		}
	}
	gosub, resetA4A
	Gui, mark2Awindow:Destroy
	return
mark2AWindowDelWindow:
	Gui, mark2Awindow:Submit
	Gui, mark2Awindow:Destroy
	Gui, mark2AwindowDel:Destroy
	loop %A2A%
	{
		Gui, mark2AwindowDel:Add, CheckBox, vA18A%A_Index%, % mark2AWindowArray%A_Index%
	}
	Gui, mark2AwindowDel:Add, Button, w40 h30 gmark2AWindowDelOK, Delete
	Gui, mark2AwindowDel:Add, Button, w70 h30 x+15 gmark2AWindowDelAll, Select All
	Gui, mark2AwindowDel:+AlwaysOnTop
	Gui, mark2AwindowDel:show
	return
mark2AWindowDelAll:
	loop %A2A%
	{
		GuiControl,, A18A%A_Index%, 1
	}
	return
mark2AWindowDelOK:
	Gui, mark2AwindowDel:Submit
	gosub, mark2AWindowDelOKFunction
	gosub, A8A
	return
mark2AWindowDelOKFunction:
	A20A := 0
	;checked choice assigned to null.
	loop %A2A%
	{
		if(A18A%A_Index%==1){
			mark2AWindowArray%A_Index% := null
			A20A += 1
		}
	}
	A21A := 0
	loop %A2A%
	{
		
		if(mark2AWindowArray%A_Index%!=null){
			A21A += 1
			A31A%A21A% := % mark2AWindowArray%A_Index%
		}
	}
	A2A -= A20A
	loop %A2A%
	{
		mark2AWindowArray%A_Index% := % A31A%A_Index%
		IniWrite, % mark2AWindowArray%A_Index%, getTitle\mark2A.ini, A7A%A6A%, mark2A%A_Index%
	}
	loop %A20A%
	{
		A22A := A2A + A_Index
		IniDelete, getTitle\mark2A.ini, A7A%A6A%, mark2A%A22A%
	}
	A20A := null
	A22A := null
	A21A := null
	;if section content all delete, change last section to this section
	if(A2A == 0)
	{
		gosub, A16A
	
		;if delete last section
		if(A6A==A7ACount0){
			A7ACount0 -= 1
			IniRead, A7A, getTitle\mark2A.ini, A7A%A7ACount0%
			StringSplit, mark2AKeyCount, A7A, `n
			loop %mark2AKeyCount0%
			{
				IniRead, mark2AWindowArray%A_Index%, getTitle\mark2A.ini, A7A%A7ACount0%, mark2A%A_Index%
				
			}

			A6A -=1
			if(A6A==0){
				A6A :=1
			}
			gosub, A23A
			A24A := A6A +1

			IniDelete, getTitle\mark2A.ini, A7A%A24A%
			IniDelete, getTitle\mark2A.ini, A27A, A28A%A24A%
		}
		else{
			;counting key number in section
			IniRead, A7A, getTitle\mark2A.ini, A7A%A7ACount0%
			StringSplit, mark2AKeyCount, A7A, `n
			loop %mark2AKeyCount0%
			{
				IniRead, mark2AWindowArray%A_Index%, getTitle\mark2A.ini, A7A%A7ACount0%, mark2A%A_Index%
				IniWrite, % mark2AWindowArray%A_Index%, getTitle\mark2A.ini,A7A%A6A%, mark2A%A_Index%
			}
			IniDelete, getTitle\mark2A.ini, A7A%A7ACount0%
			;write last A28A to the delete one
			IniRead, A25A, getTitle\mark2A.ini, A27A, A28A%A7ACount0%
			IniDelete, getTitle\mark2A.ini, A27A, A28A%A7ACount0%
			IniWrite, %A25A%, getTitle\mark2A.ini,  A27A, A28A%A6A%
		}
		if(A7ACount0==0){
			mark2AFile := FileOpen("getTitle\mark2A.ini","w")
			mark2AFile.write("[DEFAULT]`ndefaultIndex=1`n[A27A]`n[A7A1]")
			mark2AFile.close
		}
		gosub,A16A

		A2A := mark2AKeyCount0
	}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	gosub, resetA4A
	return
mark2AWindowEdi:
	Gui, mark2Awindow:Submit
	Gui, mark2Awindow:destroy
	Gui, mark2AwindowEdit:New
	loop %A2A%
	{
		Gui, mark2AwindowEdit:Add, Edit, vA26A%A_Index%, %  mark2AWindowArray%A_Index%
	}
	Gui, mark2AwindowEdit:Add, Button, Default gmark2AWindowEditOK, OK
	Gui, mark2AwindowEdit:+AlwaysOnTop
	Gui, mark2AwindowEdit:show
	return
mark2AWindowEditOK:
	Gui, mark2AwindowEdit:Submit
	loop %A2A%
	{
		mark2AWindowArray%A_Index% := % A26A%A_Index%
		IniWrite, % mark2AWindowArray%A_Index%, getTitle\mark2A.ini, A7A%A6A%, mark2A%A_Index%
	}
	gosub, resetA4A
	gosub, A8A
	return
mark2AWindowSelect:
	Gui, mark2Awindow:Destroy
	Gui, mark2AwindowSelect:New
	gosub, A16A
	loop %A7ACount0%
	{
		IniRead, A27A%A_Index%, getTitle\mark2A.ini, A27A, A28A%A_Index%
		Gui, mark2AwindowSelect:Add, Radio, vA7ASECTION%A_Index% gshowA7ASECTIONCONTENT, Select%A_Index% 
		if(A27A%A_Index%!="ERROR"){
			GuiControl, text, A7ASECTION%A_Index%, % A27A%A_Index%
		}
	}
	Gui, mark2AwindowSelect:Add, Button, Default w40 h30 vmark2AwindowSelectOKButton gmark2AwindowSelectOK, OK
	GuiControl, Disable, mark2AwindowSelectOKButton
	Gui, mark2AwindowSelect:Add, Button, Default w40 h30 x+20 gmark2AwindowSelectAdd, Add
	Gui, mark2AwindowSelect:+AlwaysOnTop
	Gui, mark2AwindowSelect:show
	return
mark2AwindowSelectAdd:
	gosub, A16A
	A6A := A7ACount0 + 1
	gosub, A23A
	gosub, A30
	gosub, resetA4A
	gosub, A10A
	gosub, mark2AwindowSelectAddCloseTooltip
	Gui, mark2AwindowSelect:destroy
	Gui, mark2Awindow:destroy
	return

mark2AwindowSelectOK:
	Gui, mark2AwindowSelect:submit
	A6A := A7ASECTION_A21A
	gosub, A23A
	A2A := mark2AKeyCount0
	loop %A2A%
	{
		IniRead, mark2AWindowArray%A_Index%, getTitle\mark2A.ini, A7A%A6A%, mark2A%A_Index%
		
	}
	; tooltip 4
	SetTimer, A4A_Gui_tooltip, off
	tooltip,,,,4
	;;;;;;;;;;;;
	gosub, resetA4A
	gosub, A8A
	return

showA7ASECTIONCONTENT:
	Gui, mark2AwindowSelect:submit, nohide
	GuiControl, Enable, mark2AwindowSelectOKButton
	loop %A7ACount0%
	{
		if(A7ASECTION%A_Index% == 1){
			;counting key number in section
			IniRead, A7A, getTitle\mark2A.ini, A7A%A_Index%
			StringSplit, mark2AKeyCount, A7A, `n
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			A4A_Gui := ""
			A7ASECTION_A21A := A_Index
			loop %mark2AKeyCount0%
			{
				IniRead, mark2A%A_Index%, getTitle\mark2A.ini, A7A%A7ASECTION_A21A%, mark2A%A_Index%
				A4A_Gui := % A4A_Gui .  mark2A%A_Index% . "`n"
			}
		}
	}
	SetTimer, A4A_Gui_tooltip, 50
	return
mark2AwindowSelectGuiClose:
mark2AwindowSelectAddCloseTooltip:
	SetTimer, A4A_Gui_tooltip, off
	tooltip,, , , 4 
	Gui, mark2AwindowSelect:destroy
	return
A4A_Gui_tooltip:
	;tooltip,%A4A_Gui%,A_ScreenWidth/2, A_ScreenHeight/8, 4 
	tooltip,%A4A_Gui%,,, 4 
	return
resetA4A:
	A4A := ""
	loop %A2A%
	{
		A4A := % A4A .  mark2AWindowArray%A_Index% . "`n"
	}
	return

A10A:
	;counting key number in section
	IniRead, A7A, getTitle\mark2A.ini, A7A%A6A%
	StringSplit, mark2AKeyCount, A7A, `n
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	A2A := mark2AKeyCount0
	loop, %mark2AKeyCount0%
	{
		IniRead, mark2AWindowArray%A_Index%, getTitle\mark2A.ini, A7A%A6A%, mark2A%A_Index%
		A4A := % A4A .  mark2AWindowArray%A_Index% . "`n"
	}
	gosub, resetA4A
	return


/*
wheelSwithSectionContent:
	gosub, A16A
	wheelCountSectionNumber := A7ACount0 +1
	return
*/
A16A:
	;count number of sections
	IniRead, A7ASECTION, getTitle\mark2A.ini
	StringSplit, A7ACount, A7ASECTION, `n
	A7ACount0 -= A5A ;delete "default" section
	return
A17A:
	Gui, mark2Awindow:submit, nohide
	;gosub, A16A
	IniWrite, % A27A%A6A%, getTitle\mark2A.ini,A27A, A28A%A6A% 
	return
A23A:
	IniWrite, %A6A%, getTitle\mark2A.ini, DEFAULT, defaultIndex
	return
A30:
	IniWrite, "", getTitle\mark2A.ini, A7A%A6A%, mark2A1
	return
A11A:
	;count key number
	IniRead, A7A, getTitle\mark2A.ini, A7A%A6A%
	StringSplit, mark2AKeyCount, A7A, `n
	if(mark2AKeyCount0==1){
		IniRead, mark2A1, getTitle\mark2A.ini, A7A%A6A%, mark2A1
		if(mark2A1==""){
		IniDelete, getTitle\mark2A.ini, A7A%A6A%, mark2A1
		A2A := 0
		}
	}
	gosub, resetA4A
	
	return
mark2AwindowGuiClose:
A15A:
	Gui, mark2Awindow:Destroy
	Gui, mark2AwindowSelect:Destroy
	Gui, mark2AwindowDel:Destroy
	Gui, mark2AwindowEdit:Destroy
	return
;============== get title 2 ===============
;==========================================

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ get title 3 @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Parameter @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
getTitleParameter3:
	CoordMode, tooltip, screen
	DetectHiddenText, On
	B2B := 0
	B3B := 0
	B4B := ""
	;delete "default" section
	B5B := 2
	
	if !FileExist("getTitle"){
		FileCreateDir, getTitle	
	}
	if !FileExist("getTitle\markB2B.ini"){
		markB2BFile := FileOpen("getTitle\markB2B.ini","a")
		markB2BFile.write("[DEFAULT]`ndefaultIndex=1`n[B27B]`n[B7B1]")
		markB2BFile.close
		IniRead, B6B, getTitle\markB2B.ini, DEFAULT, defaultIndex
		;counting key number in section
		IniRead, B7B, getTitle\markB2B.ini, B7B1
		StringSplit, markB2BKeyCount, B7B, `n
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		B2B := markB2BKeyCount0
		loop, %markB2BKeyCount0%
		{
			IniRead, markB2BWindowArray%A_Index%, getTitle\markB2B.ini, B7B1, markB2B%A_Index%
			B4B := % B4B .  markB2BWindowArray%A_Index% . "`n"
		}
	}
	else{
		IniRead, B6B, getTitle\markB2B.ini, DEFAULT, defaultIndex
		;counting key number in section
		IniRead, B7B, getTitle\markB2B.ini, B7B%B6B%
		StringSplit, markB2BKeyCount, B7B, `n
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		B2B := markB2BKeyCount0
		loop, %markB2BKeyCount0%
		{
			IniRead, markB2BWindowArray%A_Index%, getTitle\markB2B.ini, B7B%B6B%, markB2B%A_Index%
			B4B := % B4B .  markB2BWindowArray%A_Index% . "`n"
		}
	}
;--------------------   Add Tray
	;Menu, Tray, add, getTitle 3, B8B
	Menu, Tray, add, getTitle 3, markB2BWindowSelect
	return

;============== Parameter ===============
;========================================


;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ HotKey @@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


ralt & esc::
	gosub, B11B
	B2B += 1
	WinGetTitle,  markB2BWindowArray%B2B%, A
	loop % B2B-1
	{
		if( markB2BWindowArray%A_Index%== markB2BWindowArray%B2B%){
			B2B -= 1
			tooltip, Haved markB2Bed,A_ScreenWidth/2, A_ScreenHeight/8,
			KeyWait, esc
			tooltip, %B4B%`n,0,0
			return
		}
	}
	B4B := % B4B .  markB2BWindowArray%B2B% . "`n"
	tooltip, %B4B%`n,0,0
	;write in file
	IniWrite, % markB2BWindowArray%B2B%, getTitle\markB2B.ini, B7B%B6B%, markB2B%B2B%
	;;;;;;;;;;;;;;
	KeyWait, esc
	KeyWait, rshift
	settimer,markB2BWindowcan_tool, -10000 
	return
lshift & sc039::
	tooltip
	;B3B := !B3B
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	/*
		-1: The window is minimized 
		1: The window is maximized
		0: The window is neither minimized nor maximized.
	*/
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	WinGet, B12B, MinMax, % markB2BWindowArray%B2B%
	if(B12B==-1){
		B3B := 1
	}
	else{
		B3B := 0
		B13B := % markB2BWindowArray%B2B%
		if !WinActive(B13B){
			B3B := 1
		}
	}
	if(B3B==1)
	{
		tooltip, Show window,A_ScreenWidth/2, A_ScreenHeight/8,3
		B14B := 0
		loop %B2B%{
			if WinExist(markB2BWindowArray%A_Index%){
				Winactive( markB2BWindowArray%A_Index%)
				WinRestore, %  markB2BWindowArray%A_Index%
				WinActivate,% markB2BWindowArray%A_Index%
				B14B += 1
				tooltip, [%B14B%/%B2B%],A_ScreenWidth/2, A_ScreenHeight/8,
			}
				tooltip, [%B14B%/%B2B%],A_ScreenWidth/2, A_ScreenHeight/8,
		}
		WinSet, AlwaysOnTop, On, %  markB2BWindowArray%B2B%
		WinSet, AlwaysOnTop, Off, %  markB2BWindowArray%B2B%
		settimer,markB2BWindowcan_tool, -5000 
	}
	else{
		tooltip, Minimize window,A_ScreenWidth/2, A_ScreenHeight/8,3
		loop %B2B%{
			if WinExist( markB2BWindowArray%A_Index%){
				Winactive( markB2BWindowArray%A_Index%)
				;Minimize
				WinMinimize, %  markB2BWindowArray%A_Index%
				;;;;;;;;;;;;;;;;;;;; WinActivate may break
				;WinSet, Bottom,, %  markB2BWindowArray%A_Index%
				;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			}
		}
	}
	settimer, markB2BWindowcan_tool, -1000
	KeyWait, tab
	return
B8B:
ralt & tab::
	try{
		; use to close exist "markB2B" window
		Gui, markB2Bwindow:Add, Button,vmarkB2B_var_top, "to check window exist"
	}
	catch{
		Gui, markB2Bwindow:destroy
		return
	}
	;check all window close
	gosub, B15B
	Gui, markB2Bwindow:New
	gosub, B16B
	if(B7BCount0>=B6B)
	{
		IniRead, markB2B1, getTitle\markB2B.ini, B7B1, markB2B1
		if(markB2B1!="ERROR"){
			Gui, markB2Bwindow:Add, Edit, w100 vB27B%B6B% gB17B,
		}
	}
	tooltip
	;guicontrol to show Select Name
	loop %B7BCount0%
	{
		IniRead, B27B%A_Index%, getTitle\markB2B.ini, B27B, B28B%A_Index%
	}
	if(B27B%B6B%!="ERROR")
	{
		guicontrol, text, B27B%B6B%, % B27B%B6B%
	}
	loop %B2B%
	{
		if(A_Index==B2B){
			Gui, markB2Bwindow:Add, Radio, y+10 vB33B%A_Index% Checked, %  markB2BWindowArray%A_Index%
		}
		else{
			Gui, markB2Bwindow:Add, Radio, y+10  vB33B%A_Index% , %  markB2BWindowArray%A_Index%
		}
	}
	Gui, markB2Bwindow:Add, Button, Default w40 h30 gmarkB2BwindowSelectAdd, &Add
	Gui, markB2Bwindow:Add, Button, Default w40 h30 x+5 gmarkB2BWindowEdi, &Edit
	Gui, markB2Bwindow:Add, Button, Default w40 h30 x+5 gmarkB2BWindowSelect, &Select
	Gui, markB2Bwindow:Add, Button, Default w40 h30 x+5 gmarkB2BWindowDelWindow, &Del
	Gui, markB2Bwindow:Add, Button, Default w40 h30 x+5 vmarkB2B_var_top gmarkB2BWindowTop, &Top
	Gui, markB2Bwindow:+AlwaysOnTop
	Gui, markB2Bwindow:show
	KeyWait, capslock
	return
ralt & rbutton::
	B4B_ := ""
	loop %B2B%
	{
		B4B_ := % B4B_ .  markB2BWindowArray%A_Index% . "`n"
	}
	tooltip, %B4B_%,A_ScreenWidth/2, A_ScreenHeight/8,2
	KeyWait, rshift
	tooltip,,,,2
	return

;============== HotKey ==============
;====================================


;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Label @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



markB2BWindowcan_tool:
	tooltip, ,,,3
	tooltip
	return

markB2BWindowTop:
	Gui, markB2Bwindow:Submit
	;GuiControl, markB2Bwindow:focus, markB2B_var_top
	
	loop %B2B%
	{
		if(B33B%A_Index%==1){
			markB2BIndex := A_Index
			;change value
			B31B := %  markB2BWindowArray%A_Index%
			markB2BWindowArray%markB2BIndex% := %  markB2BWindowArray%B2B%
			markB2BWindowArray%B2B% := B31B
			; write in ini
			IniWrite, % markB2BWindowArray%B2B%, getTitle\markB2B.ini, B7B%B6B%, markB2B%B2B%
			IniWrite, % markB2BWindowArray%markB2BIndex%, getTitle\markB2B.ini, B7B%B6B%, markB2B%markB2BIndex%
			;;;;;;;;;;;;;;
			break
		}
	}
	gosub, resetB4B
	Gui, markB2Bwindow:Destroy
	return
markB2BWindowDelWindow:
	Gui, markB2Bwindow:Submit
	Gui, markB2Bwindow:Destroy
	Gui, markB2BwindowDel:Destroy
	loop %B2B%
	{
		Gui, markB2BwindowDel:Add, CheckBox, vB18B%A_Index%, % markB2BWindowArray%A_Index%
	}
	Gui, markB2BwindowDel:Add, Button, w40 h30 gmarkB2BWindowDelOK, Delete
	Gui, markB2BwindowDel:Add, Button, w70 h30 x+15 gmarkB2BWindowDelAll, Select All
	Gui, markB2BwindowDel:+AlwaysOnTop
	Gui, markB2BwindowDel:show
	return
markB2BWindowDelAll:
	loop %B2B%
	{
		GuiControl,, B18B%A_Index%, 1
	}
	return
markB2BWindowDelOK:
	Gui, markB2BwindowDel:Submit
	gosub, markB2BWindowDelOKFunction
	gosub, B8B
	return
markB2BWindowDelOKFunction:
	B20B := 0
	;checked choice assigned to null.
	loop %B2B%
	{
		if(B18B%A_Index%==1){
			markB2BWindowArray%A_Index% := null
			B20B += 1
		}
	}
	B21B := 0
	loop %B2B%
	{
		
		if(markB2BWindowArray%A_Index%!=null){
			B21B += 1
			B31B%B21B% := % markB2BWindowArray%A_Index%
		}
	}
	B2B -= B20B
	loop %B2B%
	{
		markB2BWindowArray%A_Index% := % B31B%A_Index%
		IniWrite, % markB2BWindowArray%A_Index%, getTitle\markB2B.ini, B7B%B6B%, markB2B%A_Index%
	}
	loop %B20B%
	{
		B22B := B2B + A_Index
		IniDelete, getTitle\markB2B.ini, B7B%B6B%, markB2B%B22B%
	}
	B20B := null
	B22B := null
	B21B := null
	;if section content all delete, change last section to this section
	if(B2B == 0)
	{
		gosub, B16B
	
		;if delete last section
		if(B6B==B7BCount0){
			B7BCount0 -= 1
			IniRead, B7B, getTitle\markB2B.ini, B7B%B7BCount0%
			StringSplit, markB2BKeyCount, B7B, `n
			loop %markB2BKeyCount0%
			{
				IniRead, markB2BWindowArray%A_Index%, getTitle\markB2B.ini, B7B%B7BCount0%, markB2B%A_Index%
				
			}

			B6B -=1
			if(B6B==0){
				B6B :=1
			}
			gosub, B23B
			B24B := B6B +1

			IniDelete, getTitle\markB2B.ini, B7B%B24B%
			IniDelete, getTitle\markB2B.ini, B27B, B28B%B24B%
		}
		else{
			;counting key number in section
			IniRead, B7B, getTitle\markB2B.ini, B7B%B7BCount0%
			StringSplit, markB2BKeyCount, B7B, `n
			loop %markB2BKeyCount0%
			{
				IniRead, markB2BWindowArray%A_Index%, getTitle\markB2B.ini, B7B%B7BCount0%, markB2B%A_Index%
				IniWrite, % markB2BWindowArray%A_Index%, getTitle\markB2B.ini,B7B%B6B%, markB2B%A_Index%
			}
			IniDelete, getTitle\markB2B.ini, B7B%B7BCount0%
			;write last B28B to the delete one
			IniRead, B25B, getTitle\markB2B.ini, B27B, B28B%B7BCount0%
			IniDelete, getTitle\markB2B.ini, B27B, B28B%B7BCount0%
			IniWrite, %B25B%, getTitle\markB2B.ini,  B27B, B28B%B6B%
		}
		if(B7BCount0==0){
			markB2BFile := FileOpen("getTitle\markB2B.ini","w")
			markB2BFile.write("[DEFAULT]`ndefaultIndex=1`n[B27B]`n[B7B1]")
			markB2BFile.close
		}
		gosub,B16B

		B2B := markB2BKeyCount0
	}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	gosub, resetB4B
	return
markB2BWindowEdi:
	Gui, markB2Bwindow:Submit
	Gui, markB2Bwindow:destroy
	Gui, markB2BwindowEdit:New
	loop %B2B%
	{
		Gui, markB2BwindowEdit:Add, Edit, vB26B%A_Index%, %  markB2BWindowArray%A_Index%
	}
	Gui, markB2BwindowEdit:Add, Button, Default gmarkB2BWindowEditOK, OK
	Gui, markB2BwindowEdit:+AlwaysOnTop
	Gui, markB2BwindowEdit:show
	return
markB2BWindowEditOK:
	Gui, markB2BwindowEdit:Submit
	loop %B2B%
	{
		markB2BWindowArray%A_Index% := % B26B%A_Index%
		IniWrite, % markB2BWindowArray%A_Index%, getTitle\markB2B.ini, B7B%B6B%, markB2B%A_Index%
	}
	gosub, resetB4B
	gosub, B8B
	return
markB2BWindowSelect:
	Gui, markB2Bwindow:Destroy
	Gui, markB2BwindowSelect:New
	gosub, B16B
	loop %B7BCount0%
	{
		IniRead, B27B%A_Index%, getTitle\markB2B.ini, B27B, B28B%A_Index%
		Gui, markB2BwindowSelect:Add, Radio, vB7BSECTION%A_Index% gshowB7BSECTIONCONTENT, Select%A_Index% 
		if(B27B%A_Index%!="ERROR"){
			GuiControl, text, B7BSECTION%A_Index%, % B27B%A_Index%
		}
	}
	Gui, markB2BwindowSelect:Add, Button, Default w40 h30 vmarkB2BwindowSelectOKButton gmarkB2BwindowSelectOK, OK
	GuiControl, Disable, markB2BwindowSelectOKButton
	Gui, markB2BwindowSelect:Add, Button, Default w40 h30 x+20 gmarkB2BwindowSelectAdd, Add
	Gui, markB2BwindowSelect:+AlwaysOnTop
	Gui, markB2BwindowSelect:show
	return
markB2BwindowSelectAdd:
	gosub, B16B
	B6B := B7BCount0 + 1
	gosub, B23B
	gosub, B30B
	gosub, resetB4B
	gosub, B10B
	gosub, markB2BwindowSelectAddCloseTooltip
	Gui, markB2BwindowSelect:destroy
	Gui, markB2Bwindow:destroy
	return

markB2BwindowSelectOK:
	Gui, markB2BwindowSelect:submit
	B6B := B7BSECTION_B21B
	gosub, B23B
	B2B := markB2BKeyCount0
	loop %B2B%
	{
		IniRead, markB2BWindowArray%A_Index%, getTitle\markB2B.ini, B7B%B6B%, markB2B%A_Index%
		
	}
	; tooltip 4
	SetTimer, B4B_Gui_tooltip, off
	tooltip,,,,4
	;;;;;;;;;;;;
	gosub, resetB4B
	gosub, B8B
	return

showB7BSECTIONCONTENT:
	Gui, markB2BwindowSelect:submit, nohide
	GuiControl, Enable, markB2BwindowSelectOKButton
	loop %B7BCount0%
	{
		if(B7BSECTION%A_Index% == 1){
			;counting key number in section
			IniRead, B7B, getTitle\markB2B.ini, B7B%A_Index%
			StringSplit, markB2BKeyCount, B7B, `n
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			B4B_Gui := ""
			B7BSECTION_B21B := A_Index
			loop %markB2BKeyCount0%
			{
				IniRead, markB2B%A_Index%, getTitle\markB2B.ini, B7B%B7BSECTION_B21B%, markB2B%A_Index%
				B4B_Gui := % B4B_Gui .  markB2B%A_Index% . "`n"
			}
		}
	}
	SetTimer, B4B_Gui_tooltip, 50
	return
markB2BwindowSelectGuiClose:
markB2BwindowSelectAddCloseTooltip:
	SetTimer, B4B_Gui_tooltip, off
	tooltip,, , , 4 
	Gui, markB2BwindowSelect:destroy
	return
B4B_Gui_tooltip:
	;tooltip,%B4B_Gui%,A_ScreenWidth/2, A_ScreenHeight/8, 4 
	tooltip,%B4B_Gui%,,, 4 
	return
resetB4B:
	B4B := ""
	loop %B2B%
	{
		B4B := % B4B .  markB2BWindowArray%A_Index% . "`n"
	}
	return

B10B:
	;counting key number in section
	IniRead, B7B, getTitle\markB2B.ini, B7B%B6B%
	StringSplit, markB2BKeyCount, B7B, `n
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	B2B := markB2BKeyCount0
	loop, %markB2BKeyCount0%
	{
		IniRead, markB2BWindowArray%A_Index%, getTitle\markB2B.ini, B7B%B6B%, markB2B%A_Index%
		B4B := % B4B .  markB2BWindowArray%A_Index% . "`n"
	}
	gosub, resetB4B
	return


/*
wheelSwithSectionContent:
	gosub, B16B
	wheelCountSectionNumber := B7BCount0 +1
	return
*/
B16B:
	;count number of sections
	IniRead, B7BSECTION, getTitle\markB2B.ini
	StringSplit, B7BCount, B7BSECTION, `n
	B7BCount0 -= B5B ;delete "default" section
	return
B17B:
	Gui, markB2Bwindow:submit, nohide
	;gosub, B16B
	IniWrite, % B27B%B6B%, getTitle\markB2B.ini,B27B, B28B%B6B% 
	return
B23B:
	IniWrite, %B6B%, getTitle\markB2B.ini, DEFAULT, defaultIndex
	return
B30B:
	IniWrite, "", getTitle\markB2B.ini, B7B%B6B%, markB2B1
	return
B11B:
	;count key number
	IniRead, B7B, getTitle\markB2B.ini, B7B%B6B%
	StringSplit, markB2BKeyCount, B7B, `n
	if(markB2BKeyCount0==1){
		IniRead, markB2B1, getTitle\markB2B.ini, B7B%B6B%, markB2B1
		if(markB2B1==""){
		IniDelete, getTitle\markB2B.ini, B7B%B6B%, markB2B1
		B2B := 0
		}
	}
	gosub, resetB4B
	
	return
markB2BwindowGuiClose:
B15B:
	Gui, markB2Bwindow:Destroy
	Gui, markB2BwindowSelect:Destroy
	Gui, markB2BwindowDel:Destroy
	Gui, markB2BwindowEdit:Destroy
	return

;============== Label ===============
;====================================
;============== get title 3 ===============
;==========================================

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ edit table @@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

WhiteBoard_parameter:
	WhiteBoard_width := 250
	WhiteBoard_height := 225
	return
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@ Run edit_table2 @@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;******************
;** edit_table 2 **
;******************
capslock & /::
;capslock & sc00e:: ;sc00e >> delete
	try{
		run, edit_table2.ahk
	}
	catch{
		tooltip, "edit_table2.ahk" is not existed.
		sleep, 2000
		tooltip
	}
	return
;******************

;====================================

edit_table__:
capslock & enter::
esc & wheelup::
	try{
		;MouseGetPos, whiteboard_x, whiteboard_y ;open window position
		;/*
		whiteboard_x := A_ScreenWidth/2
		whiteboard_y := A_ScreenHeight*5/7
		;*/
		tooltip,Show WhiteBoard,% whiteboard_x - 50,% whiteboard_y - 50,10
		Gui, whiteboard:font, s12
		Gui, whiteboard:Add, Button,w50 h30 gcopy_button_whiteboard, &copy 
		Gui, whiteboard:Add, Button,w50 h30 x+15 vwhiteboardbutton gpast_button, &paste 
		Gui, whiteboard:Add, Button,w50 h30 x+15 gundo_button, &undo 
		Gui, whiteboard:Add, Button,w50 h30 x+15 gclear_button, CR
		Gui, whiteboard:Add, Button,w1 h1 x+0 Hide gfocus_edit_, &edit 
		;-VScroll -> cancel scroll
		gosub, WhiteBoard_parameter
		Gui, whiteboard:Add, Edit,w%WhiteBoard_width% h%WhiteBoard_height% r10 x15 vwhiteboardVariable gautoResizeLine -Wrap  +HScroll WantTab, ;-VScroll ;vwhiteboardVariable -> mark window exist
		Gui, whiteboard:+AlwaysOnTop
		whiteboard_x -=100
		whiteboard_y -=100
		Gui, whiteboard:show, x%whiteboard_x% y%whiteboard_y% AutoSize, temp Blank Table
		GuiControl,whiteboard:focus, whiteboardVariable
	}
	catch{
		gosub, whiteboardGuiClose
	}
	settimer, can_whiteboard, -2000
	keywait, esc
	return
clear_button:
	guicontrol, whiteboard:Text, whiteboardVariable, 
	guicontrol, whiteboard:Text, whiteboardVariable, %clipboard%
	return
focus_edit_:
	guicontrol, whiteboard:focus, whiteboardVariable
	return
copy_button_whiteboard:
	gui, whiteboard:submit, nohide
	;prevent clearing clipboard
	if(whiteboardVariable==null)
		return
	;;;;;;;;;;;;;;;;;;;;;;;;;;
	clipboard =
	clipboard := whiteboardVariable
	clipwait, 3
	tooltip,%clipboard%,,,10
	settimer, can_whiteboard,-2000
	return
whiteboardGuiClose:
;:?:wbclose.::
	;tooltip,Destroy WhiteBoard,% whiteboard_x - 50,% whiteboard_y - 50,10
	Gui, whiteboard:Destroy
	settimer, can_whiteboard, -2000
	return

can_whiteboard:
	tooltip,,,,10
	return

autoResizeLine:
	temp_using_to_undo := whiteboardVariable
	Gui, whiteboard:submit, nohide
	whiteboard_temp_string = %whiteboardVariable%
	StringSplit, lineCount, whiteboard_temp_string, `n
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	detect width
	whiteboard_width := StrSplit(whiteboardVariable, "`n")
	max_width_whiteboard := StrLen(whiteboard_width[1])
	loop, % whiteboard_width.MaxIndex()
	{
		if(max_width_whiteboard<StrLen(whiteboard_width[A_Index])){
			max_width_whiteboard := StrLen(whiteboard_width[A_Index])
		}
	}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;/*
	if(max_width_whiteboard>10){
		max_width_whiteboard -= 10
		max_width_whiteboard := max_width_whiteboard*10+250 ;WhiteBoard_width    ; WhiteBoard_width  > 250
		if(max_width_whiteboard<=(A_ScreenWidth/2))
			GuiControl, whiteboard:Move, whiteboardVariable,% "w" . max_width_whiteboard
		if(max_width_whiteboard>(A_ScreenWidth/2))
			GuiControl, whiteboard:Move, whiteboardVariable,% "w" . (A_ScreenWidth/2)
		;GuiControl, whiteboard:Text, whiteboardVariable, %whiteboardVariable%
	}
	else{
		GuiControl, whiteboard:Move, whiteboardVariable,w250  ; WhiteBoard_width  > 250

	}
	if(lineCount0>=10){
		createLine := lineCount0 - 10
		lineCount0 := WhiteBoard_height
		lineCount0 += createLine*25 
		if(lineCount0<=(A_ScreenHeight/2))
			GuiControl, whiteboard:Move, whiteboardVariable,% "h" . lineCount0
		if(lineCount0>(A_ScreenHeight/2)){
			GuiControl, whiteboard:Move, whiteboardVariable,% "h" . (A_ScreenHeight/2)
		}
		;GuiControl, whiteboard:Text, whiteboardVariable, %whiteboardVariable%
	}
	else{
		GuiControl, whiteboard:Move, whiteboardVariable,h%WhiteBoard_height%
	}

	Gui, whiteboard:+AlwaysOnTop
	Gui, whiteboard:show, AutoSize
*/

	return
past_button:
	Gui, whiteboard:submit, nohide
	whiteboard_temp_string = %whiteboardVariable%
	send, ^v
	whiteboard_temp_string = %whiteboard_temp_string%%clipboard%
	GuiControl, whiteboard:Text, whiteboardVariable, %whiteboard_temp_string%
	gosub, autoResizeLine
	return
undo_button:
	GuiControl, whiteboard:Text, whiteboardVariable, %temp_using_to_undo%
	gosub, autoResizeLine
	return
;============== edit table ==============
;========================================

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Input support @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;--------------------------
;-- push label into list --
;--------------------------

@-show_search_index:

;--------------------   check index list finish
	if(all_index_list_finish==null){
		all_index_list_finish := 0
	}
	all_list := []
	list_script_place := []

;--------------------   put file content into array

	if(ahk_name==null){
		ahk_name = ..\label.ahk
	}
	Loop, Read, %ahk_name%
	{
		If (RegExMatch(A_LoopReadLine,"U).[^`;.]*:$",label) ) 
		{
			if(!RegExMatch(label, "::|@-")){
				
;--------------------   replace ;
				label := StrReplace(label, ":")
				;list.=label "`n"
				all_list.Push(label)
			}
		}
	}
	all_index_list_finish := 1
	return

;__ push label into list __
;__________________________
;----------------
;-- input gui ---
;----------------
;--------------------   read index
read_list_search_index:
	gosub, @-show_search_index
;--------------------   Add Tray
	Menu, Tray, add, search_label_gui, search_label_gui
	return
search_label_gui:
capslock & f::


;--------------------   check index list is finished
	if(all_index_list_finish==0){
		tooltip, too quick search. wait.
		sleep, 2000
		tooltip
		return
	}

;--------------------   english
	try{
		gosub, english
	}
	;gui, __gui__sup_input:new
	try{
		try{
			gui, __gui__sup_input:Font, s10 bold, Helvetica
		}
		catch{
			gui, __gui__sup_input:Font, s10 bold, 
		}
		gui, __gui__sup_input:add, text, , Support Input 
		gui, __gui__sup_input:add, edit, vsupport_input g@-support_input ;WantTab
		gui, __gui__sup_input:add, button, x+10 -Tabstop g@-support_input_OK Default, OK

;----------------------
;-- show index label --
;----------------------
		;gui, __gui__sup_input:add, edit,w250 r10 x10 vshow_support_input_index +HScroll ;Disabled
		gui, __gui__sup_input:add, ListBox,w250 r10 x10 vshow_support_input_index +HScroll g@-choice_input_list
;__ show index label __
;______________________


;----------
;-- note --
;----------
		;gui, __gui__sup_input:add, button, x10 -Tabstop g@-note_text, &Note
		;gui, __gui__sup_input:add, button, x+10 -Tabstop g@-note_text2_, Note2

		gui, __gui__sup_input:add, button, hidden x1  w1 h1 -Tabstop g@-note_text, &b
		;gui, __gui__sup_input:add, button, hidden x+0 w1 h1 -Tabstop g@-note_text2_, Note2
		;gui, __gui__sup_input:add, button, hidden x+0 h1 w1 -Tabstop g@-note_text2_, &n
		;gui, __gui__sup_input:add, button, hidden x+0 h1 w1 -Tabstop g@-note_text2_, &1
		;--------------------   control send
		gui, __gui__sup_input:add, button, hidden x+0 h1 w1 -Tabstop g@-input_support_control_send_down, &2
		gui, __gui__sup_input:add, button, hidden x+0 h1 w1 -Tabstop g@-input_support_control_send_up, &3
;--------------------   note2 hide button
;__ note __
;__________


;__ check edit table 2 __
;________________________

		gui, __gui__sup_input: +AlwaysOnTop
		gui, __gui__sup_input:show, ,Support Input HotString
	}
	catch{
		gui, __gui__sup_input:destroy
	}
	return

@-input_support_control_send_down:
	Guicontrol, __gui__sup_input:focus, show_support_input_index
	send, {down}
	return
@-input_support_control_send_up:
	Guicontrol, __gui__sup_input:focus, show_support_input_index
	send, {up}
	return
@-note_text:
	gui, __gui__sup_input:submit, NoHide
	WinGetTitle, support_input_title, A
	gosub, edit_table__
	sleep, 100
	WinActivate, %support_input_title%
	return

@-choice_input_list:
	gui, __gui__sup_input:submit, NoHide
	;ControlGet, getStrTemp, show_support_input_index
	if(A_GuiEvent == "DoubleClick"){
		guicontrol, Text, support_input, %show_support_input_index%
	}
	else if(A_GuiEvent == "Normal"){
		gui, __gui__sup_input:submit, nohide
	}
	return
@-support_input_OK:
	gui, __gui__sup_input:submit, nohide
	try{
		if(show_support_input_index != null){
			gui, __gui__sup_input:destroy
			gosub, %show_support_input_index%
			show_support_input_index := null
		}
		else{
			;--------------------   if input null
			if(StrLen(support_input)==0){
				gui, __gui__sup_input:destroy
				;--------------------   release search variable
				support_input =
				return
			}
			;--------------------   prevent typing one character
			if(StrLen(support_input)==1){
				GuiControl, Text,support_input, 
				;--------------------   recover input gui	
				;goto, @-search_label_gui
				return
			}
			gui, __gui__sup_input:destroy
			gosub, %support_input%
			;--------------------   release search variable
			support_input =
		}
	}
	catch{
		gui, __gui__sup_input:destroy
		tooltip, Index faliure
		sleep, 700
		tooltip
	}
	;--------------------   release search variable
	support_input =
	return
@-support_input:
	gui, __gui__sup_input:submit, NoHide

;--------------------   search array element
	show_information_element = 
	guicontrol, text, show_support_input_index, |
	for index, element in all_list
	{
		if(RegExMatch(element, "i)"support_input)){
			;show_information_element.= element "`n"
			show_information_element.= element "|"
		}
	}
	guicontrol, text, show_support_input_index, % show_information_element

;--------------------   if input is null
	if(support_input==null){
		guicontrol, text, show_support_input_index, |
	}
	return

__gui__sup_inputGuiClose:
	gui, __gui__sup_input:destroy
	;--------------------   release search variable
	support_input =
	;--------------------   release search  index variable
	show_support_input_index =
	return

;__ input gui ___
;________________

;============== Input support ===============
;============================================
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

;#################################################	file management
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
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Third @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;--------------
;-- language --
;--------------
;https://stackoom.com/question/3y7ml/%E5%88%87%E6%8D%A2%E9%94%AE%E7%9B%98%E5%B8%83%E5%B1%80%E6%9C%89%E6%95%88-%E4%BD%86%E5%B9%B6%E9%9D%9E%E6%80%BB%E6%98%AF%E5%A6%82%E6%AD%A4
/*
Lang := { "EN": 0x4090409 , "RU": 0x4190419 }
WinGetActiveTitle , CurrentActive
WinActivate , Program Manager
ControlGet , CtrlID , Hwnd ,, SysListView321 , Program Manager
InputLocaleID := DllCall( "GetKeyboardLayout" , "UInt" , DllCall( "GetWindowThreadProcessId" , "Ptr" , CtrlID , "Ptr", 0 ) , "Ptr" )
SendMessage , 0x50 ,, % ( InputLocaleID = Lang.EN ? Lang.RU : Lang.EN ) ,, ahk_id %CtrlID%
WinActivate , % CurrentActive
Return
*/
chinese:
	;Lang := { "EN": 0x4090409 , "RU": 0x4190419 }
	WinGetActiveTitle , CurrentActive
	WinActivate , Program Manager
	ControlGet , CtrlID , Hwnd ,, SysListView321 , Program Manager
	InputLocaleID := DllCall( "GetKeyboardLayout" , "UInt" , DllCall( "GetWindowThreadProcessId" , "Ptr" , CtrlID , "Ptr", 0 ) , "Ptr" )
	SendMessage , 0x50 ,, 0x4040404 ,, ahk_id %CtrlID%
	WinActivate , % CurrentActive
	Return
english:
	;Lang := { "EN": 0x4090409 , "RU": 0x4190419 }
	WinGetActiveTitle , CurrentActive
	WinActivate , Program Manager
	ControlGet , CtrlID , Hwnd ,, SysListView321 , Program Manager
	InputLocaleID := DllCall( "GetKeyboardLayout" , "UInt" , DllCall( "GetWindowThreadProcessId" , "Ptr" , CtrlID , "Ptr", 0 ) , "Ptr" )
	SendMessage , 0x50 ,, 0x4090409 ,, ahk_id %CtrlID%
	WinActivate , % CurrentActive
	Return
;__ language __
;______________







;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ clip_image @@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;----------------
;-- parameter ---
;----------------
clip_image_parameter:
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
return   ; End of Auto-Execute Section.
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


pasteImage:
	tooltip, paste image, , , 19
	return


;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;__ clip_image_hotkey ___
;________________________

;============== clip_image ==============
;========================================








;============== Third ===============
;====================================
