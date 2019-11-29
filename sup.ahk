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
Space::Click
i::Click
o::Click Right
RAlt::
Click 2
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
keywait, tab
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
<!f::
Send ^+w
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
SC15D::
Click
return
SC15D & RControl::
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
SC15D & m::
Send, ^t
return
SC15D & shift::
Send, ^w
return
SC15D & SC14b::AltTab
SC15D & SC150::ShiftAltTab
Sc15d & `;::
Send,!{F4}
return
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
Gui, PG_SL:Destroy
gosub call_Select_Program_Gui
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
~LButton & WheelUp::
Send ^{WheelUp}
return
~LButton & WheelDown::
Send, ^{WheelDown}
return
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
if(GetKeyState("Alt","P")!=1)
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
Click
Tooltip,wait shift(copy and close snip),0,0
Keywait, shift,D
Tooltip,
Send, ^c
sleep, 200
Winclose, Snip & Sketch
return
sc15d & enter::
SetStoreCapsLockMode,OFF
Send,#+s
sleep, 250
Click, Down
KeyWait, enter
Click, up
tex := A_ScreenWidth -80
tey := A_ScreenHeight -100
MouseMove, tex, tey,0
Tooltip,wait enter(click),0,0
KeyWait, enter, D
Click
Tooltip,wait shift(copy and close snip),0,0
Keywait, shift,D
Tooltip,
Send, ^c
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
`::
SPI_GETMOUSESPEED = 0x70
SPI_SETMOUSESPEED = 0x71
DllCall("SystemParametersInfo", UInt, SPI_GETMOUSESPEED, UInt, 0, UIntP, OrigMouseSpeed, UInt, 0)
DllCall("SystemParametersInfo", UInt, SPI_SETMOUSESPEED, UInt, 0, UInt, 5, UInt, 0)
Click, Down
KeyWait SC029
Click, Up
DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, OrigMouseSpeed, UInt, 0)
return
capslock & LShift::
suspend, toggle
return