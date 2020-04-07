#SingleInstance, Force
#MaxHotKeysPerInterval 200
CoordMode, ToolTip, Screen
CoordMode, Mouse, Screen
DetectHiddenWindows On
SetTitleMatchMode 2
Menu, Tray, Add
Menu, Tray, Add, Reload, call_reload
Menu, Tray, Add
Menu, Tray, Add, Shortcut setting, call_gui_ps
FormatTime, TimeString,, Time
getPowerState()
Life_Time:=GetFormatedTime(batteryLifeTime)
Gui, show_battery: +E0x20 +AlwaysOnTop -Caption +ToolWindow  +LastFound
Gui, show_battery:add, text, vbattery_info,%batteryLifePercent%`%`n%Life_Time%`nMark time: %TimeString%
gui, show_battery:show,x0 y0 ,transparent_text
WinSet, transparent, 0, transparent_text
settimer, assist_battery, 60000
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
touchpad_mouse_wheel_pr :=0
WN := 9999
multi_select := 1
num_ps:= 20
Autotrim, on
Toggle:= 0
window_xpos:=A_ScreenWidth/2
window_ypos:=(A_ScreenHeight/2)+50
Gui, NS_ck:-Caption +AlwaysOnTop +E0x20 +LastFound +ToolWindow
Gui, NS_ck:Color, 0004FF
Gui, NS_ck:Show, w100 h20 x%window_xpos% y%window_ypos%, NS_tr_ck
WinSet, Transparent, 0, NS_tr_ck
window_xpos:=A_ScreenWidth/2
window_ypos:=A_ScreenHeight/2
Gui, MS_100:-Caption +AlwaysOnTop +E0x20 +LastFound +ToolWindow
Gui, MS_100:color,32FE00
Gui, MS_100:Show, w100 h20 x%window_xpos% y%window_ypos%, MS_tr_100
WinSet, Transparent, 0, MS_tr_100
window_xpos2:=(A_ScreenWidth/2)-100
window_ypos2:=A_ScreenHeight/2
Gui, MS_5:-Caption +AlwaysOnTop +E0x20 +LastFound +ToolWindow
Gui, MS_5:color, FE8E00
Gui, MS_5:Show, w100 h20 x%window_xpos2% y%window_ypos2%, MS_tr_5
WinSet, Transparent, 0, MS_tr_5
window_xpos3:=(A_ScreenWidth/2)+100
window_ypos3:=A_ScreenHeight/2
Gui, MS_350:-Caption +AlwaysOnTop +E0x20 +LastFound +ToolWindow
Gui, MS_350:color, FE0F00
Gui, MS_350:Show, w100 h20 x%window_xpos3% y%window_ypos3%, MS_tr_350
WinSet, Transparent, 0, MS_tr_350
Mouse1 := 0
SdMax:= 200
Sd:= 100
Hotkey, LAlt  & sc039 , CreateCapWindow , On
Hotkey, sc15d & n , CreateCapWindow, On
Hotkey, tab & Lalt, CreateCapWindow, On
SaveToFile := 1
ShowCloseButton := 1
SetBatchLines, -1
IfNotExist, %A_ScriptDir%\Saved Clips
FileCreateDir, %A_ScriptDir%\Saved Clips
SetWorkingDir, %A_ScriptDir%\Saved Clips
Handles := []
Index := 0
return
RControl & Down::
Capslock & c::
if(GetKeyState("z","P")==1)
return
else
Send {Volume_Up 3}
return
RControl & Left::
Capslock & x::
Send {Volume_Down 2}
return
RControl::
goto MouseKey_label
return
LAlt & z::
goto MouseKey_label
return
Capslock & '::
goto MouseKey_label
return
MouseKey_label:
Mouse1 := !Mouse1
Show_ToolTip(Mouse1,Sd)
if(Mouse1 == 1)
{
MouseGetPos, Mouse_MouseKey_CK_Xpos, Mouse_MouseKey_CK_Ypos
SetTimer, Mouse_MouseKey_CK, 20
goto MS_RM
}
else
{
goto MS_RM_close
}
return
#if Mouse1 = 1
Enter::
goto MouseKey_label
return
n::
if(GetKeyState("Alt")!=1)
Send, {WheelDown}
return
m::
if(GetKeyState("Alt")!=1)
Send, {WheelUp}
return
,::WheelLeft
.::WheelRight
w::
goto MouseKey_WD
return
q::
goto MouseKey_WU
return
e::
goto MouseKey_ST
return
CK_Mouse_Mv:
MouseGetPos, Mouse_MouseKey_CK_Xpos, Mouse_MouseKey_CK_Ypos
SetTimer, Mouse_MouseKey_CK, 20
goto MS_RM
return
h::
MouseMove, -Sd,0,0,R
goto CK_Mouse_Mv
return
l::
MouseMove, Sd,0,0,R
goto CK_Mouse_Mv
return
k::
MouseMove, 0,-Sd,0,R
goto CK_Mouse_Mv
return
j::
MouseMove, 0,Sd,0,R
goto CK_Mouse_Mv
return
u::
send, {mbutton}
return
sc039::Click
sc039 & n::
send, {end}
return
sc039 & m::
send, {home}
return
i::Click
o::Click Right
RAlt::
if(hold_mouse == null)
{
hold_mouse := 0
}
hold_mouse := !hold_mouse
if(hold_mouse == 1)
{
Click, Down
}
else
{
Click, Up
}
return
RWin::
Click 2
return
LAlt::
Click 2
return
b::
Click 2
return
a::
Send {PgUp}
return
s::
Send {PgDn}
return
v::
Click down
return
c::
Click up
return
x::
goto MouseKey_label
return
return
f::
Sd:=100
Show_ToolTip(1,Sd)
goto CK_Mouse_Mv
return
g::
Sd:=350
Show_ToolTip(1,Sd)
goto CK_Mouse_Mv
return
d::
Sd:=5
Show_ToolTip(1,Sd)
goto CK_Mouse_Mv
return
`;::
Sd:=5
Show_ToolTip(1,Sd)
goto CK_Mouse_Mv
return
p::
Sd:=350
Show_ToolTip(1,Sd)
goto CK_Mouse_Mv
return
'::
Sd:=100
Show_ToolTip(1,Sd)
goto CK_Mouse_Mv
return
1::
Send ^t
return
2::
Send ^+n
return
3::
Send ^n
return
#if
#tab::
Send, #{tab}
return
tab::
Send, {tab}
return
tab & h::
MouseMove, -Sd, 0, 0, R
Tooltip, %Sd%
SetTimer, ca_tool, -2000
return
tab & j::
MouseMove, 0, Sd, 0, R
Tooltip, %Sd%
SetTimer, ca_tool, -2000
return
tab & k::
MouseMove, 0, -Sd, 0, R
Tooltip, %Sd%
SetTimer, ca_tool, -2000
return
tab & l::
MouseMove, Sd, 0, 0, R
Tooltip, %Sd%
SetTimer, ca_tool, -2000
return
tab & f::
Sd := 100
Tooltip, %Sd%
return
tab & d::
Sd := 5
Tooltip, %Sd%
return
tab & g::
Sd := 350
Tooltip, %Sd%
return
tab & u::
Click, Middle
return
tab & i::
Click, Left
return
tab & o::
Click, Right
return
tab & n::
Send, {WheelDown}
return
tab & m::
Send, {WheelUp}
return
tab & ,::
Send, {WheelLeft}
return
tab & .::
Send, {WheelRight}
return
tab & s::
Send, {WheelDown 6}
return
tab & a::
Send, {WheelUp 6}
return
ca_tool:
tooltip
return
tab & w::
goto MouseKey_WD
return
tab & q::
goto MouseKey_WU
return
tab & e::
goto MouseKey_ST
return
tab & `;::
click, Down
tooltip,click down,0,0,2
keywait, tab
tooltip,,,,2
click, up
return
tab & r::
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
x_r++
if(x_r>=4)
x_r := 0
return
Capslock & e::
Click 2
return
Capslock & r::
Click right
return
Capslock & s::
Click
return
Capslock & d::
Send ^{LButton}
return
Capslock & f::
Send +{LButton}
return
Capslock & a::
Click, down
return
Capslock & z::
Click, up
return
Capslock::ESC
ESC::Capslock
Capslock & w::
Send ^{Tab}
return
Capslock & q::
Send ^+{Tab}
return
Capslock & 3::
Send ^n
return
Capslock & 1::
Send ^t
return
Capslock & 2::
Send ^+n
return
Capslock & o::
Send {F5}
return
Capslock & u::
Send, ^c
return
Capslock & i::
Send, ^v
return
Capslock & n::
Send, ^s
return
Capslock & m::
Send, ^z
return
Capslock & b::
Send, ^a
return
Capslock & y::
Send, ^x
return
Capslock & h::
Send, +{left}
return
Capslock & j::
Send, +{down}
return
Capslock & k::
Send, +{up}
return
Capslock & l::
Send, +{right}
return
>!l::
Send, +^{right}
return
>!h::
Send, +^{left}
return
LAlt & 0::
Gui, PG_SL:Destroy
gosub call_Select_Program_Gui
return
<!c::
Send ^w
return
<!s::
Send ^+t
return
LAlt & Tab::AltTab
WinMaximize
<!`::ShiftAltTab
<!F1::
DllCall("SetCursorPos", int, 631, int, -477)
return
<!F2::
DllCall("SetCursorPos", int, 631, int, 359)
return
<!F3::
DllCall("SetCursorPos", int, 2027, int, 251)
return
<!j::
Send {Down}
return
<!k::
Send {Up}
return
<!l::
Send {Right}
return
<!h::
Send {Left}
return
<!u::
Send {Home}
return
<!i::
Send {PgUp}
return
<!o::
Send {PgDn}
return
<!;::
Send {End}
return
<!e::
Send, !{up}
return
<!r::
Send, !{down}
return
RAlt::
PostMessage, 0x50, 0, 0x4090409,, A
return
LAlt::
PostMessage, 0x50, 0, 0x4040404,, A
Tooltip,,,,5
WN := 1000
return
~LWin::
PostMessage, 0x50, 0, 0x4090409,, A
return
<!q::
Send !{Left}
return
<!w::
Send !{Right}
return
~LAlt & ~d::
PostMessage, 0x50, 0, 0x4090409,, A
return
<!n::
Send {BackSpace}
return
<!m::
Send {Delete}
return
<!b::
Send ^{BackSpace}
return
<!,::
Send ^{Delete}
return
<!a::
Send {Enter}
return
<!x::
Send !{F4}
return
LAlt & Tab::AltTab
<!`::ShiftAltTab
>!]::
Send +#{Right}
return
>![::
Send +#{Left}
return
>!'::
Send #{Down}
return
>!`;::
Send #{Up}
return
RAlt & o::
Send, ^{WheelUp}
return
RAlt & p::
Send, ^{WheelDown}
return
RAlt & u::
Send, {|}
return
RAlt & i::
Send, {\}
return
>!j::
Send ^{Left}
return
>!k::
Send ^{Right}
return
NS_toggle:
Toggle := !Toggle
if(Toggle=1)
{
Show_ToolTip(Toggle+2,null)
WinSet, Transparent, 100, NS_tr_ck
}
else
{
Show_ToolTip(Toggle+2,null)
WinSet, Transparent, 0, NS_tr_ck
}
return
sc15d::
Click
return
Ralt & sc15d::
Click, Right
return
SC15D & RAlt::
Click, Middle
return
SC15D & SC039::
Click,Down
Tooltip,wait appskey(release click),0,0
KeyWait, sc15d
Click, Up
Tooltip
return
SC15D & ,::
Send, ^{tab}
return
SC15D & .::
Send, ^+{tab}
return
RAlt & m::
Send, ^t
return
RAlt & SC039::
Send, ^w
return
SC15D & SC14b::AltTab
SC15D & SC150::ShiftAltTab
sc15d & wheelup::
Send,{Alt down}{Tab}
keywait,sc15d
if WinExist("ahk_class #32771")
Send "!{Escape}{Alt up}"
Send, {Alt up}
SetStoreCapsLockMode,OFF
return
SC15d & m::
Send, ^v
tooltip,paste
settimer,can_too,-1000
return
sc15d & Rbutton::
Send, ^c
tooltip,copy
settimer,can_too,-1000
return
sc15d & n::
Send, ^x
keywait, sc15d
return
Sc15d & `;::
Send,!{F4}
return
RAlt & /::
if(arrow_switch==null)
arrow_switch := 0
arrow_switch := !arrow_switch
arrow_off:
if(arrow_switch==1)
{
tooltip, arrow on
tooltip, arrow on, 0, 0, 3
}
else
{
tooltip, arrow off
tooltip,,,,3
}
settimer, can_too, -1000
return
#if arrow_switch = 1
n::
send, {left}
return
m::
send, {down}
return
.::
send, {right}
return
,::
send, {up}
return
/::
arrow_switch := 0
settimer, arrow_off, -100
return
#if
Capslock & `;::
goto NS_toggle
return
LAlt & RAlt::
goto NS_toggle
return
sc039::
send,{space}
return
sc039 & a::
send,{1}
return
sc039 & s::
send,{2}
return
sc039 & d::
send,{3}
return
sc039 & f::
send,{4}
return
sc039 & g::
send,{5}
return
sc039 & h::
send,{6}
return
sc039 & j::
send,{7}
return
sc039 & k::
send,{8}
return
sc039 & l::
send,{9}
return
sc039 & `;::
send,{0}
return
sc039 & q::
send,{!}
return
sc039 & w::
send,{@}
return
sc039 & e::
send,{#}
return
sc039 & r::
send,{$}
return
sc039 & t::
send,{`%}
return
sc039 & y::
send,{^}
return
sc039 & u::
send,{&}
return
sc039 & i::
send,{*}
return
sc039 & o::
send,{(}
return
sc039 & p::
send,{)}
return
sc039 & z::
send,{+}
return
sc039 & x::
send,{-}
return
sc039 & c::
send,{*}
return
sc039 & v::
send,{{}
return
sc039 & b::
send,{}}
return
sc039 & n::
send,{=}
return
sc039 & m::
send,{_}
return
#if Toggle = 1
a::
Send, {1}
return
s::
Send, {2}
return
d::
Send, {3}
return
f::
Send, {4}
return
g::
Send, {5}
return
h::
Send, {6}
return
j::
Send, {7}
return
k::
Send,{8}
return
l::
Send,{9}
return
`;::
Send,{0}
return
q::
Send,{!}
return
w::
Send,{@}
return
e::
Send,{#}
return
r::
Send,{$}
return
t::
Send, {`%}
return
y::
Send, {^}
return
u::
Send,{&}
return
i::
Send, {*}
return
o::
Send,{(}
return
p::
Send,{)}
return
z::
Send,{+}
return
x::
Send,{-}
return
c::
Send,{*}
return
v::
Send,{/}
return
n::
Send,{=}
return
m::
Send,{_}
return
enter::
goto NS_toggle
return
#if
RAlt & q::
Send, {F1}
return
RAlt & w::
Send, {F2}
return
RAlt & e::
Send, {F3}
return
RAlt & r::
Send, {F4}
return
RAlt & a::
Send, {F5}
return
RAlt & s::
Send, {F6}
return
RAlt & d::
Send, {F7}
return
RAlt & f::
Send, {F8}
return
RAlt & z::
Send, {F9}
return
RAlt & x::
Send, {F10}
return
RAlt & c::
Send, {F11}
return
RAlt & v::
Send, {F12}
return
RButton::
touchpad_mouse_wheel_pr := 1
Right_Volume := 0
Check_Right_Working := 1
Prevent_Wheel_Volume := 0
Alt_Tab_Stop :=0
Touch_Keyboard := 0
MouseGetPos, X_Start_RightClick, Y_Start_RightClick
RButton_Loop := 1
MButton_Loop := 0
if (RButton_Loop == 1 && MButton_Loop ==0)
{
Loop 1000
{
MouseGetPos, X_Move_RightClick, Y_Move_RightClick
deci := X_Move_RightClick-X_Start_RightClick
if(GetKeyState("RButton","P")==1 && deci>0 && Prevent_Wheel_Volume==0 && Touch_Keyboard == 0)
{
Send {Volume_Up 1}
Right_Volume := 1
}
else if(GetKeyState("RButton","P")==1 && deci<0 && Prevent_Wheel_Volume==0 && Touch_Keyboard == 0)
{
Send {Volume_Down 1}
Right_Volume := 1
}
else if(!GetKeyState("RButton","P")==1)
{
Check_Right_Working := 0
Touch_Keyboard := 0
if(Alt_Tab_Stop==1)
{
Send {Alt up}
}
break
}
else if(Touch_Keyboard == 1)
{
Right_Volume := 1
Check_Right_Working := 0
touchpad_mouse_wheel_pr :=0
gosub, chrome_search
break
}
Sleep, 100
}
}
if(deci=0 && Right_Volume==0 && Check_Right_Working==0)
{
MouseClick, right
touchpad_mouse_wheel_pr :=0
}
return
#if touchpad_mouse_wheel_pr = 1
WheelUp::
if(Check_Right_Working=1)
{
Send {WheelLeft}
}
else
{
Send {WheelUp}
touchpad_mouse_wheel_pr := 0
}
Wheel_work := 1
Right_Volume := 1
Prevent_Wheel_Volume := 1
return
WheelDown::
if(Check_Right_Working=1)
Send {WheelRight}
else
{
Send {WheelDown}
touchpad_mouse_wheel_pr := 0
}
Wheel_work := 1
Right_Volume := 1
Prevent_Wheel_Volume := 1
return
#if
~LButton::
if(Check_Right_Working==1)
{
Sleep, 100
Send {Alt Down}{Tab}
Alt_Tab_Stop := 1
}
Right_Volume :=1
Prevent_Wheel_Volume :=1
return
~MButton::
RButton_Loop := 0
MButton_Loop := 1
Wheel_work := 0
MouseGetPos, X_Start_MClick, Y_Start_MClick
if(Check_Right_Working==1)
{
Touch_Keyboard := 1
sleep, 200
return
}
Check_Right_Working := 0
Sleep, 100
if(RButton_Loop==0 && MButton_Loop==1 && Check_Right_Working==0 && Wheel_work==0)
{
Loop 1000
{
MouseGetPos, X_Move_MClick, Y_Move_MClick
Middle_Button_Distance_x := X_Move_MClick - X_Start_MClick
if(GetKeyState("MButton","P")==1 && Middle_Button_Distance_x>0)
{
Send, !{right}
break
}
else if(GetKeyState("MButton","P")==1 && Middle_Button_Distance_x<0)
{
Send, !{left}
break
}
else if(!GetKeyState("MButton","P")==1)
{
break
}
}
}
Right_Volume := 1
Prevent_Wheel_Volume := 1
return
MButton & RButton::
Send ^{Tab}
return
MButton & LButton::
Send ^+{Tab}
return
~LButton & RButton::
Send ^t
return
~LButton & MButton::
Send ^w
return
del & sc00e::
if(mouse_zoom_check=null)
mouse_zoom_check:=0
mouse_zoom_check:=!mouse_zoom_check
if(mouse_zoom_check=1)
tooltip, mouse zoom on,,,8
else
tooltip, mouse zoom off,,,8
settimer, tooltip_cancel_8, -1000
return
tooltip_cancel_8:
tooltip,,,,8
return
#if mouse_zoom_check=1
~LButton & WheelUp::
Send ^{WheelUp}
return
~LButton & WheelDown::
Send, ^{WheelDown}
return
#if
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
Gui, PG_SL:Add, button, w48 h25 x423 y350 vapply_var gsave_apply, Apply
Gui, PG_SL:Add, button, w55 h25 x310 y350 vconfirm_var gsave_confirm, Confirm
Gui, PG_SL:Font, s20, System
Gui, PG_SL:Add, GroupBox, w465 h320 x10 y5
Gui, PG_SL:Add, text, x15 y0, Name:
Gui, PG_SL:Add, text, x110 y0, Path:
Gui, PG_SL:Add, edit, w80 h25 x30 y20 vName_1 ,%Name_1%
num :=3
counter_ps :=2
temp_ar :=[]
loop 9
{
temp_ar[counter_ps] := Name_%counter_ps%
Gui, PG_SL:Add, edit, w80 h25 x30 y+5 vName_%counter_ps% ,% temp_ar[counter_ps]
num :=num+2
counter_ps++
}
Gui, PG_SL:Font, normal
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
Gui, PG_SL:Font, s10, Corbel
counter_ps :=1
Gui, PG_SL:Add, button, w43 h25 x+5 y20 vB_%counter_ps% gB_%counter_ps%, Blank
loop 9
{
counter_ps++
Gui, PG_SL:Add, button, w43 h25 y+5 vB_%counter_ps% gB_%counter_ps%, Blank
}
counter_ps := 1
Gui, PG_SL:Add, button, w48 h25 x+5 y20 vCh_%counter_ps% gCh_%counter_ps%, Check
loop, 9
{
counter_ps++
Gui, PG_SL:Add, button, w48 h25 y+5 vCh_%counter_ps% gCh_%counter_ps%, Check
}
Gui, PG_SL:Font, normal
Gui, PG_SL:Add, button, w65 h25 x5 y350 greset_button, Reset All
Gui, PG_SL:Add, button, w48 h25 x370 y350 vcancel_var gcancel_button , Cancel
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
capslock & esc::
call_reload:
Reload
return
call_gui_ps:
gui, PG_SL:Destroy
gosub call_Select_Program_Gui
return
can_tool:
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
SetTimer, can_tool, -2000
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
SetTimer, can_tool, -2000
return
MouseKey_ST:
LAlt & RButton::
if(mu==null)
{
mu :=1
}
multi_select := 1
SetTimer, Openfile_set_program, -100
Tooltip,OK`nIt will open the last one`, you have chosen.,,,6
SetTimer, can_tool_6, -1000
return
Openfile_set_program:
IniRead, RL_Program, Path\path.ini,Path,Path_%mu%
multi_select := !multi_select
Loop
{
if(GetKeyState("Alt","P")!=1 || GetKeyState("tab","P")!=1)
{
PostMessage, 0x50, 0, 0x4090409,, A
Run, %RL_Program%, % Explorer_GetSelection() , UseErrorLevel
if ErrorLevel
{
msgbox, It cannot work.
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
Mouse_MouseKey_CK:
MouseGetPos, Mouse_MouseKey_CK2x, Mouse_MouseKey_CK2y
if(Mouse_MouseKey_CK_Xpos != Mouse_MouseKey_CK2x && Mouse_MouseKey_CK_Ypos != Mouse_MouseKey_CK2y)
{
MS_GUI_cancel_transparent :=1
goto MS_RM_close
}
return
capslock & sc056::
capslock & Lalt::
capslock & RButton::
SetStoreCapsLockMode,OFF
Send,#+s
sleep, 250
Click, Down
KeyWait, capslock
Click, up
tex := A_ScreenWidth -80
tey := A_ScreenHeight -100
MouseMove, tex, tey,0
Tooltip,wait capslock(click),0,0
KeyWait, capslock, D
keywait, capslock
Click
Tooltip,wait capslock(copy and close snip),0,0
Keywait, capslock,D
Tooltip,
Send, ^c
Keywait, capslock
sleep, 200
Winclose, Snip & Sketch
return
capslock & Lwin::
SetStoreCapsLockMode,OFF
Gosub, MS_RM_close
tooltip
sleep, 200
Send,#+s
sleep, 200
Click, Down
Mouse1 := 1
tooltip,wait c,0,0
KeyWait, c, D
tx := A_ScreenWidth - 80
ty := A_ScreenHeight - 100
sleep,200,
MouseMove, tx, ty, 0
tooltip,wait capslock,0,0
keywait, capslock,d
Click
tooltip,wait enter,0,0
KeyWait, enter, D
tooltip
SetStoreCapsLockMode,OFF
Send, ^c
sleep, 200
keywait, enter
Winclose, Snip & Sketch
return
capslock & sc039::
SetTimer, AlwaysOnTop_set, -300
FileSelectFile, file, M3
Loop, parse, file,`n
{
if(A_Index==1)
index1 := A_LoopField
else if(A_Index>=2)
{
run, %index1%\%A_LoopField%
}
}
return
AlwaysOnTop_set:
WinSet,AlwaysOnTop,On, Select File
return
capslock & tab::
clipboard := ""
Send, ^c
ClipWait
Run, %Clipboard%,,UseErrorLevel
if ErrorLevel
tooltip,something wrong
sleep,2000
tooltip
return
chrome_search:
sc039 & RAlt::
tab & 1::
clipboard := ""
Keywait, rbutton
Send, ^c
if(clipboard==null && GetKeyState("sc039", "P")==0)
{
tooltip, chrome search on, 0,0
Keywait, rbutton, D
Keywait, rbutton
Send, ^c
tooltip,
if(clipboard==null)
{
goto, chrome_inco_search
return
}
}
ClipWait
googleSearch:="http://www.google.com/search?q="
httpRegEx:="https?://"
clip := % """" . (regExMatch(clipboard,"i)" . httpRegEx)=1?"":googleSearch) . clipboard . """"
Run, chrome.exe %clip%
return
sc039 & sc15d::
tab & 4::
clipboard := ""
chrome_inco_search:
Send, ^c
if(clipboard==null && GetKeyState("sc039", "P")==0)
{
tooltip, chrome incognito search on, 0,0
Keywait, rbutton, D
Send, ^c
tooltip,
if(clipboard==null)
return
}
ClipWait
googleSearch:="http://www.google.com/search?q="
httpRegEx:="https?://"
clip := % """" . (regExMatch(clipboard,"i)" . httpRegEx)=1?"":googleSearch) . clipboard . """"
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -incognito %clip%
return
tab & 3::
clipboard := ""
Send, ^c
ClipWait
googleSearch:="http://www.google.com/search?q="
httpRegEx:="https?://"
clip := % """" . (regExMatch(clipboard,"i)" . httpRegEx)=1?"":googleSearch) . clipboard . """"
Run, firefox.exe %clip%
return
sc039 & RControl::
tab & 2::
clipboard := ""
Send, ^c
ClipWait
Run http://en.wikipedia.org/w/wiki.phtml?search=%clipboard%
return
Rcontrol & enter::
tab & enter::
gui, google_search: destroy
gui, google_search:add, edit, vnormal_search
gui, google_search:+AlwaysOnTop -Caption
gui, google_search:show,,google search
keywait, enter
Loop
{
if(GetKeyState("enter","P")==1)
{
keywait,enter
Gui, google_search:submit, hide
if(normal_search==null)
break
googleSearch:="http://www.google.com/search?q="
httpRegEx:="https?://"
nor_search := % """" . (regExMatch(normal_search,"i)" . httpRegEx)=1?"":googleSearch) . normal_search . """"
Run, chrome.exe %nor_search%
break
}
}
return
Rcontrol & Rshift::
tab & shift::
gui, incognito_google_search: destroy
gui, incognito_google_search:add, edit, vincognito_search
gui, incognito_google_search:color, gray
gui, incognito_google_search:+AlwaysOnTop -Caption
gui, incognito_google_search:show,,incognito google search
keywait, shift
Loop
{
if(GetKeyState("enter","P")==1)
{
keywait,enter
Gui, incognito_google_search:submit, hide
if(incognito_search==null)
break
googleSearch:="http://www.google.com/search?q="
httpRegEx:="https?://"
inc_search := % """" . (regExMatch(incognito_search,"i)" . httpRegEx)=1?"":googleSearch) . incognito_search . """"
Run, chrome.exe --incognito %inc_search%
break
}
}
return
tab & F1::
sw := !sw
if(sw==1)
{
tooltip, slow
}
else
tooltip, quick
settimer, can_too, -1000
return
can_too:
ToolTip
return
`::
if(sw==null)
sw := 0
if(sw==1)
{
SPI_GETMOUSESPEED = 0x70
SPI_SETMOUSESPEED = 0x71
DllCall("SystemParametersInfo", UInt, SPI_GETMOUSESPEED, UInt, 0, UIntP, OrigMouseSpeed, UInt, 0)
DllCall("SystemParametersInfo", UInt, SPI_SETMOUSESPEED, UInt, 0, UInt, 5, UInt, 0)
Click, Down
KeyWait SC029
Click, Up
DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, OrigMouseSpeed, UInt, 0)
}
else
{
Click, Down
KeyWait SC029
Click, Up
}
return
capslock & LShift::
suspend, toggle
return
tab & x::
Send, ^{Pgdn}
return
tab & z::
Send, ^{Pgup}
return
SC039 & tab::
send, ^#{RIGHT}
return
sc039 & capslock::
send, ^#{left}
return
RCONTROL & \::
esc & f1::
FormatTime, TimeString,, Time
Gui, show_time:add, text, ,%TimeString%
Gui, show_time: +AlwaysOnTop -Caption +ToolWindow
Gui, show_time:show
keywait, rcontrol
keywait, esc
Settimer, time_destroy, -100
return
esc & f2::
rcontrol & sc00e::
FormatTime, TimeString,, LongDate
Gui, show_time:add, text, ,%TimeString%
Gui, show_time: +AlwaysOnTop -Caption +ToolWindow
Gui, show_time:show
keywait, esc
keywait, rcontrol
Settimer, time_destroy, -100
return
time_destroy:
Gui, show_time:destroy
return
LAlt & F12::
Run, %A_ScriptDir%\Saved Clips
return
LAlt & F11::
FileRecycle, %A_ScriptDir%\Saved Clips\*.png
return
CloseClip:
hwnd := WinActive()
Gui, % Handles[hwnd] ": Destroy"
return
MoveWindow:
PostMessage, 0xA1 , 2
return
CreateCapWindow:
Index++
Gui, %Index% : New , +AlwaysOnTop -Caption -DPIScale +ToolWindow +LastFound +Border hwndHwnd
Handles[hwnd] := Index
Gui, %Index% : Color , 123456
WinSet, TransColor , 123456
Gui, %Index% : Font, cMaroon s10 Bold Q5 , Segoe UI
Active := 1
ToolTip, Capture On
SetTimer, Tooltips , 30
return
Tooltips:
ToolTip, Capture On
return
DrawCapArea:
if( !FirstPosition ){
FirstPosition := 1
MouseGetPos, SX , SY
}else	{
MouseGetPos, EX , EY
if( SX <= EX && SY <= EY )
WinPos := { X: SX , Y: SY , W: EX - SX , H: EY - SY }
else if( SX > EX && SY <= EY )
WinPos := { X: EX , Y: SY , W: SX - EX , H: EY - SY }
else if( SX <= EX && SY > EY)
WinPos := { X: SX , Y: EY , W: EX - SX , H: SY - EY }
else if( SX > EX && SY > EY)
WinPos := { X: EX , Y: EY , W: SX - EX , H: SY - EY }
}
if( WinPos.W )
Gui, %Index% : Show , % "x" WinPos.X " y" WinPos.Y " w" WinPos.W " h" WinPos.H " NA"
return
hide_open_picture:
tab & wheeldown::
LAlt & sc00e::
sc039 & wheeldown::
LAlt & sc15d::
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
return
tab & wheelup::
sc039 & mbutton::
LAlt & RControl::
if(Ind==null)
Ind := 0
if(Index == 0)
{
gosub,op_picture
return
}
loop
{
Gui, %Ind% : +ToolWindow
Gui, %Ind% : Show
Ind++
if(Ind>Index)
{
Ind := Index
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
return
tab & mbutton::
sc039 & wheelup::
sc15d & wheeldown::
LAlt & RShift::
if(Ind==null)
Ind :=0
if(Index==0)
{
gosub, des_picture
return
}
if(Index!=0 && Ind==0)
gosub, hide_open_picture
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
return
TakeScreenShot:
pToken := Gdip_Startup()
ClipBitmap := Gdip_BitmapFromScreen( WinPos.X "|" WinPos.Y "|" WinPos.W "|" WinPos.H)
Gdip_SaveBitmapToFile( ClipBitmap , A_WorkingDir "\" ( ( SaveToFile = 1 ) ? ( ClipName := "Saved Clip " A_Now ) : ( ClipName := "Temp Clip") ) ".png", 100 )
Gdip_DisposeImage( ClipBitmap )
Gdip_Shutdown(pToken)
return
LControl::
Send, {control}
return
LControl & sc039::
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
LShift::
Send, {shift}
return
LShift & sc039::
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
LShift & sc15d::
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
LShift & RControl::
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
LShift & RShift::
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
!v::
sleep, 200
FileCopy, %Image_copy_path%, % Explorer_GetSelection()
return
#If (Active)
LAlt & sc039::
WinPos := ""
FirstPosition := 0
SetTimer, DrawCapArea , 30
keywait, LAlt
Active := 0
SetTimer, DrawCapArea , Off
SetTimer, Tooltips , Off
ToolTip,
if( WinPos.W < 10 || WinPos.H < 10 ) {
Gui, %Index% : Destroy
return
}
Gui, %Index% : -Border
gosub, TakeScreenShot
Gui, %Index% : +Border
Gui, %Index% : Add , Text , % ( ( ShowCloseButton ) ? ( " Center 0x200 Border " ) : ( "" ) ) " x" WinPos.W - 20 " y0 w20 h20 BackgroundTrans gCloseClip" , % ( ( ShowCloseButton ) ? ( "X" ) : ( "" ) )
Gui, %Index% : Add , Text , % "x0 y0 w" WinPos.W " h" WinPos.H " BackgroundTrans gMoveWindow"
Gui, %Index% : Add , Picture , % "x0 y0 w" WinPos.W " h" WinPos.H ,% ClipName ".png"
Image_copy_path := % A_WorkingDir "\"  ClipName ".png"
settimer, copyImage, -1000
return
copyImage:
pToken := Gdip_Startup()
Gdip_SetBitmapToClipboard(pBitmap := Gdip_CreateBitmapFromFile(Image_copy_path))
Gdip_DisposeImage_copyToclipboard(pBitmap)
Gdip_Shutdown_copyToclipboard(pToken)
return
~sc15d & n::
WinPos := ""
FirstPosition := 0
SetTimer, DrawCapArea , 30
keywait, sc15d
Active := 0
SetTimer, DrawCapArea , Off
SetTimer, Tooltips , Off
ToolTip,
if( WinPos.W < 10 || WinPos.H < 10 ) {
Gui, %Index% : Destroy
return
}
Gui, %Index% : -Border
gosub, TakeScreenShot
Gui, %Index% : +Border
Gui, %Index% : Add , Text , % ( ( ShowCloseButton ) ? ( " Center 0x200 Border " ) : ( "" ) ) " x" WinPos.W - 20 " y0 w20 h20 BackgroundTrans gCloseClip" , % ( ( ShowCloseButton ) ? ( "X" ) : ( "" ) )
Gui, %Index% : Add , Text , % "x0 y0 w" WinPos.W " h" WinPos.H " BackgroundTrans gMoveWindow"
Gui, %Index% : Add , Picture , % "x0 y0 w" WinPos.W " h" WinPos.H ,% ClipName ".png"
Image_copy_path := % A_WorkingDir "\"  ClipName ".png"
settimer, copyImage, -1000
return
Lbutton::
WinPos := ""
FirstPosition := 0
SetTimer, DrawCapArea , 30
keywait, Lbutton
Active := 0
SetTimer, DrawCapArea , Off
SetTimer, Tooltips , Off
ToolTip,
if( WinPos.W < 10 || WinPos.H < 10 ) {
Gui, %Index% : Destroy
return
}
Gui, %Index% : -Border
gosub, TakeScreenShot
Gui, %Index% : +Border
Gui, %Index% : Add , Text , % ( ( ShowCloseButton ) ? ( " Center 0x200 Border " ) : ( "" ) ) " x" WinPos.W - 20 " y0 w20 h20 BackgroundTrans gCloseClip" , % ( ( ShowCloseButton ) ? ( "X" ) : ( "" ) )
Gui, %Index% : Add , Text , % "x0 y0 w" WinPos.W " h" WinPos.H " BackgroundTrans gMoveWindow"
Gui, %Index% : Add , Picture , % "x0 y0 w" WinPos.W " h" WinPos.H ,% ClipName ".png"
Image_copy_path := % A_WorkingDir "\"  ClipName ".png"
settimer, copyImage, -1000
return
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
DllCall("GetObject", Ptr, hbm, "int", A_PtrSize = 8 ? 104 : 84, Ptr, &dib)
Stride := NumGet(dib, 12, "Int"), Bits := NumGet(dib, 20 + (A_PtrSize = 8 ? 4 : 0))
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
x::
WinPos := ""
FirstPosition := 0
SetTimer, DrawCapArea , 30
return
z::
Active := 0
SetTimer, DrawCapArea , Off
SetTimer, Tooltips , Off
ToolTip,
if( WinPos.W < 10 || WinPos.H < 10 ) {
Gui, %Index% : Destroy
return
}
Gui, %Index% : -Border
gosub, TakeScreenShot
Gui, %Index% : +Border
Gui, %Index% : Add , Text , % ( ( ShowCloseButton ) ? ( " Center 0x200 Border " ) : ( "" ) ) " x" WinPos.W - 20 " y0 w20 h20 BackgroundTrans gCloseClip" , % ( ( ShowCloseButton ) ? ( "X" ) : ( "" ) )
Gui, %Index% : Add , Text , % "x0 y0 w" WinPos.W " h" WinPos.H " BackgroundTrans gMoveWindow"
Gui, %Index% : Add , Picture , % "x0 y0 w" WinPos.W " h" WinPos.H ,% ClipName ".png"
Image_copy_path := % A_WorkingDir "\"  ClipName ".png"
settimer, copyImage, -1000
return
#tab::
Send, #{tab}
return
h::
MouseMove, -Sd, 0, 0, R
Tooltip, %Sd%
SetTimer, ca_tool, -2000
return
j::
MouseMove, 0, Sd, 0, R
Tooltip, %Sd%
SetTimer, ca_tool, -2000
return
k::
MouseMove, 0, -Sd, 0, R
Tooltip, %Sd%
SetTimer, ca_tool, -2000
return
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
w::
goto MouseKey_WD
return
q::
goto MouseKey_WU
return
e::
goto MouseKey_ST
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
x_r++
if(x_r>=4)
x_r := 0
return
enter::
RButton::
Active := 0
SetTimer, DrawCapArea , Off
SetTimer, Tooltips , Off
ToolTip,
Gui, %Index% : Destroy
return
#If
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
capslock & WheelUp::
SetStoreCapsLockMode,OFF
Send, ^v
tooltip,Paste
SetTimer, can_tool_paper,-1000
keywait, capslock
return
capslock & WheelDown::
SetStoreCapsLockMode,OFF
Send, ^z
Tooltip, Undo
SetTimer,can_tool_paper,-1000
keywait, capslock
return
capslock & sc15d::
capslock & LButton::
SetStoreCapsLockMode,OFF
Send, ^c
Tooltip,Copy
SetTimer,can_tool_paper,-1000
return
can_tool_paper:
tooltip,
return
powerPlanAutoManage()
{
Global
getPowerState()
if ( loopCounter < 1)
loopCounter := 0
if ( loopCounter = 0 )
Gosub, getactivePOWERscheme
loopCounter += 1
If acLineStatus = 0
{
IfNotEqual, powerStateChange, 1
{
IfNotEqual, currentPowerScheme, %powerSaver%
{
loggingSystem("switching to powersaver")
Run, %comspec% /c powercfg -setactive %powerSaver%, , Hide
powerStateChange:=1
}
}
}
Else If acLineStatus = 1
{
IfNotEqual, powerStateChange, 2
{
IfNotEqual, currentPowerScheme, %highPerformance%
{
loggingSystem("switching to high performance")
Run, %comspec% /c powercfg -setactive %highPerformance%, , Hide
powerStateChange:=2
}
}
}
}
getactivePOWERscheme:
currentPowerScheme := StdOutToVar("powercfg -getactivescheme")
StringSplit, stringOut, currentPowerScheme, %A_Space%
currentPowerScheme = %stringOut4%
return
powerPlanStateInfo()
{
Global
If acLineStatus = 0
acLineStatus = Offline
Else If acLineStatus = 1
acLineStatus = Online
Else If acLineStatus = 255
acLineStatus = Unknown
If batteryFlag = 0
batteryFlag = Not being charged - Between 33 and 66 percent
Else If batteryFlag = 1
batteryFlag =  High - More than 66 percent
Else If batteryFlag = 2
batteryFlag = Low - Less than 33 percent
Else If batteryFlag = 4
batteryFlag = Critical - Less than 5 percent
Else If batteryFlag = 8
batteryFlag = Charging
Else If batteryFlag = 128
batteryFlag = No system battery
Else If batteryFlag = 255
batteryFlag = Unknown
If batteryLifePercent = 255
batteryLifePercent = Unknown
Else
batteryLifePercent = %batteryLifePercent%`%
If batteryLifeTime = -1
batteryLifeTime = Unknown
Else
batteryLifeTime := GetFormatedTime(batteryLifeTime)
If batteryFullLifeTime = -1
batteryFullLifeTime = Unknown
Else
batteryFullLifeTime := GetFormatedTime(batteryFullLifeTime)
output =
(

AC Status: %acLineStatus%

Battery state and capacity: %batteryFlag%

Battery Life: %batteryLifePercent%

Remaining Battery Life: %batteryLifeTime%

Full Battery Life: %batteryFullLifeTime%

)
Msg(output , "br", 1, 5)
Return
}
Msg(title, body="", loc="bl", fixedwidth=0, time=0) {
global msgtransp, hwndmsg, MonBottom, MonRight
SetTimer, MsgStay, Off
SetTimer, MsgFadeOut, Off
Gui,77:Destroy
Gui,77:+AlwaysOnTop +ToolWindow -SysMenu -Caption +LastFound
hwndmsg := WinExist()
WinSet, ExStyle, +0x20
WinSet, Transparent, 160
msgtransp := 160
Gui,77:Color, 000000
Gui,77:Font, c5C5CF0 s17 wbold, Arial
Gui,77:Add, Text, x20 y12, %title%
If(body) {
Gui,77:Font, cF0F0F0 s15 wnorm
Gui,77:Add, Text, x20 y56, %body%
}
If(fixedwidth) {
Gui,77:Show, NA W700
} else {
Gui,77:Show, NA
}
WinGetPos,ix,iy,w,h, ahk_id %hwndmsg%
if(loc) {
x := InStr(loc,"l") ? 0 : InStr(loc,"c") ? (MonRight-w)/2 : InStr(loc,"r") ? A_ScreenWidth-w : 0
y := InStr(loc,"t") ? 0 : InStr(loc,"m") ? (MonBottom-h)/2 : InStr(loc,"b") ? MonBottom - h : MonBottom - h
} else {
x := 0
y := MonBottom - h
}
WinMove, ahk_id %hwndmsg%,,x,y
If(time) {
time *= 1000
SetTimer, MsgStay, %time%
} else {
SetTimer, MsgFadeOut, 500
}
}
MsgStay:
SetTimer, MsgStay, Off
SetTimer, MsgFadeOut, 100
Return
MsgFadeOut:
If(msgtransp > 0) {
msgtransp -= 4
WinSet, Transparent, %msgtransp%, ahk_id %hwndmsg%
} Else {
SetTimer, MsgFadeOut, Off
Gui,77:Destroy
}
Return
del::
send, {del}
return
del & sc045::
getPowerState()
Life_Time:=GetFormatedTime(batteryLifeTime)
Gui, show_battery2:add, text, ,%batteryLifePercent%`%`,%Life_Time%
Gui, show_battery2: +AlwaysOnTop -Caption +ToolWindow
Gui, show_battery2:show
keywait, del
Settimer, battery_destroy2 , -250
return
battery_destroy2:
Gui, show_battery2:destroy
return
del & sc137::
if(show_battery_window=null)
show_battery_window:=0
if(show_battery_window=1)
{
WinSet, transparent, 240, transparent_text
getPowerState()
Life_Time:=GetFormatedTime(batteryLifeTime)
FormatTime, TimeString,,Time
GuiControl,show_battery:text, battery_info, %batteryLifePercent%`%`n%Life_Time%`nMark time: %TimeString%
}
else
WinSet, transparent, 0, transparent_text
show_battery_window:=!show_battery_window
return
assist_battery:
getPowerState()
Life_Time:=GetFormatedTime(batteryLifeTime)
FormatTime, TimeString,,Time
if(temp_battery=null)
temp_battery:=batteryLifeTime
if(batteryLifeTime!=temp_battery)
{
GuiControl,show_battery:text, battery_info, %batteryLifePercent%`%`n%Life_Time%`nMark time: %TimeString%
}
temp_battery:=batteryLifeTime
if(batteryLifePercent>100)
{
WinSet, transparent, 0, transparent_text
}
else if(batteryLifePercent>=85 || batteryLifePercent<=20)
{
WinSet, transparent, 240, transparent_text
}
else if(batteryLifePercent<85 && batteryLifePercent>20)
{
WinSet, transparent,0, transparent_text
if(batteryLifePercent<=60 && batteryLifePercent>59)
{
tooltip,60`%,,,8
sleep,1000
tooltip,,,,8
}
else if(batteryLifePercent<=50 && batteryLifePercent>49)
{
tooltip,50`%,,,8
sleep,1000
tooltip,,,,8
}
else if(batteryLifePercent<=40 && batteryLifePercent>39)
{
tooltip,40`%,,,8
sleep,1000
tooltip,,,,8
}
else if(batteryLifePercent<=30 && batteryLifePercent>28)
{
tooltip,30`%,,,8
sleep,1000
tooltip,,,,8
}
}
return
loggingSystem(messageToLog)
{
IfNotExist, %A_ScriptName%.ini
{
IniWrite, 1, %A_ScriptName%.ini, LOGGING, logActivation
}
IniRead, logStat, %A_ScriptName%.ini, LOGGING, logActivation, 1
IfEqual, logStat, 1
{
FileAppend,
(
`n`n[%A_DDDD%.%A_DD%.%A_MMMM%.%A_YYYY%] %A_Username% [%A_Hour%:%A_Min%:%A_Sec%]     %messageToLog%
), %A_ScriptName%.log.log
}
}
StdOutToVar(cmd)
{
DllCall("CreatePipe", "PtrP", hReadPipe, "PtrP", hWritePipe, "Ptr", 0, "UInt", 0)
DllCall("SetHandleInformation", "Ptr", hWritePipe, "UInt", 1, "UInt", 1)
VarSetCapacity(PROCESS_INFORMATION, (A_PtrSize == 4 ? 16 : 24), 0)
cbSize := VarSetCapacity(STARTUPINFO, (A_PtrSize == 4 ? 68 : 104), 0)
NumPut(cbSize, STARTUPINFO, 0, "UInt")
NumPut(0x100, STARTUPINFO, (A_PtrSize == 4 ? 44 : 60), "UInt")
NumPut(hWritePipe, STARTUPINFO, (A_PtrSize == 4 ? 60 : 88), "Ptr")
NumPut(hWritePipe, STARTUPINFO, (A_PtrSize == 4 ? 64 : 96), "Ptr")
if !DllCall(
	(Join Q C
		"CreateProcess",             ; http://goo.gl/9y0gw
		"Ptr",  0,                   ; lpApplicationName
		"Ptr",  &cmd,                ; lpCommandLine
		"Ptr",  0,                   ; lpProcessAttributes
		"Ptr",  0,                   ; lpThreadAttributes
		"UInt", true,                ; bInheritHandles
		"UInt", 0x08000000,          ; dwCreationFlags
		"Ptr",  0,                   ; lpEnvironment
		"Ptr",  0,                   ; lpCurrentDirectory
		"Ptr",  &STARTUPINFO,        ; lpStartupInfo
		"Ptr",  &PROCESS_INFORMATION ; lpProcessInformation
)) {
DllCall("CloseHandle", "Ptr", hWritePipe)
DllCall("CloseHandle", "Ptr", hReadPipe)
return ""
}
DllCall("CloseHandle", "Ptr", hWritePipe)
VarSetCapacity(buffer, 4096, 0)
while DllCall("ReadFile", "Ptr", hReadPipe, "Ptr", &buffer, "UInt", 4096, "UIntP", dwRead, "Ptr", 0)
sOutput .= StrGet(&buffer, dwRead, "CP0")
DllCall("CloseHandle", "Ptr", NumGet(PROCESS_INFORMATION, 0))
DllCall("CloseHandle", "Ptr", NumGet(PROCESS_INFORMATION, A_PtrSize))
DllCall("CloseHandle", "Ptr", hReadPipe)
return sOutput
}
getPowerState()
{
Global
VarSetCapacity(powerStatus, 1+1+1+1+4+4)
success := DllCall("GetSystemPowerStatus", "UInt", &powerStatus)
If (ErrorLevel != 0 OR success = 0)
{
MsgBox 16, Power Status, Can't get the power status...
Exit
}
acLineStatus := GetInteger(powerStatus, 0, false, 1)
batteryFlag := GetInteger(powerStatus, 1, false, 1)
batteryLifePercent := GetInteger(powerStatus, 2, false, 1)
batteryLifeTime := GetInteger(powerStatus, 4, true)
batteryFullLifeTime := GetInteger(powerStatus, 8, true)
}
powerStateMessage()
{
Global
If acLineStatus = 0
acLineStatus = Offline
Else If acLineStatus = 1
acLineStatus = Online
Else If acLineStatus = 255
acLineStatus = Unknown
If batteryFlag = 0
batteryFlag = Not being charged - Between 33 and 66 percent
Else If batteryFlag = 1
batteryFlag =  High - More than 66 percent
Else If batteryFlag = 2
batteryFlag = Low - Less than 33 percent
Else If batteryFlag = 4
batteryFlag = Critical - Less than 5 percent
Else If batteryFlag = 8
batteryFlag = Charging
Else If batteryFlag = 128
batteryFlag = No system battery
Else If batteryFlag = 255
batteryFlag = Unknown
If batteryLifePercent = 255
batteryLifePercent = Unknown
Else
batteryLifePercent = %batteryLifePercent%`%
If batteryLifeTime = -1
batteryLifeTime = Unknown
Else
batteryLifeTime := GetFormatedTime(batteryLifeTime)
If batteryFullLifeTime = -1
batteryFullLifeTime = Unknown
Else
batteryFullLifeTime := GetFormatedTime(batteryFullLifeTime)
output =
(

AC Status: %acLineStatus%

Battery state and capacity: %batteryFlag%

Battery Life: %batteryLifePercent%

Remaining Battery Life: %batteryLifeTime%

Full Battery Life: %batteryFullLifeTime%

)
MsgBox 262208, Power Status, %output%
Return
}
GetInteger(ByRef @source, _offset = 0, _bIsSigned = false, _size = 4)
{
local result
Loop %_size%
{
result += *(&@source + _offset + A_Index-1) << 8*(A_Index-1)
}
If (!_bIsSigned OR _size > 4 OR result < 0x80000000)
Return result
return -(0xFFFFFFFF - result + 1)
}
GetFormatedTime(_seconds)
{
local h, m, s, t
h := _seconds // 3600
_seconds -= h * 3600
m := _seconds // 60
s := _seconds - m * 60
If (h > 1)
t := h . " hours"
Else IF (h = 1)
t := "1 hour"
If (t != "" and m + s > 0)
t := t . " "
If (m > 1)
t := t . m . " minutes"
Else If (m = 1)
t := t . "1 minute"
If (t != "" and s > 0)
t := t . " "
If (s > 1)
t := t . s . " seconds"
Else If (s = 1)
t := t . "1 second"
Else If (t = "")
t := "0 seconds"
Return t
}
sc039 & LShift::
winset, alwaysontop, , A
WinSet, Style, -0xC00000, A
return
sc039 & Rshift::
winset, style, +0xc00000, A
winset, alwaysontop, , A
return
LWin & capslock::
SetCapsLockState, on
send, ^#{right}
return
LWin & LShift::
send, ^#{left}
return