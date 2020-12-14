#singleinstance, force
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

