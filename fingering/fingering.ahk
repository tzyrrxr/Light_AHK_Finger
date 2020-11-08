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
