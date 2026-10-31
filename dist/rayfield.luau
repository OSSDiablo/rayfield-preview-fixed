-- Rayfield Preview Fixed v1.2.0 by Astris Hub (69d1f63, 2026-11-01)
local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au={function()local b,c,d=a(1)local e return(
function(...)local f,g,h,i,j=d(c.utility.variables),d(c.utility.image),d(c.utility.locale),d(c.utility.constants),d(c.
types)export type Theme=j.Theme export type Translator=j.Translator export type Translations=j.Translations export type
WindowConfiguration=j.WindowConfiguration export type WindowProps=j.WindowProps export type TabProps=j.TabProps export
type TagProps=j.TagProps export type SectionProps=j.SectionProps export type GroupProps=j.GroupProps export type
ButtonProps=j.ButtonProps export type ToggleProps=j.ToggleProps export type SliderProps=j.SliderProps export type
DropdownProps=j.DropdownProps export type InputProps=j.InputProps export type KeybindProps=j.KeybindProps export type
ColorPickerProps=j.ColorPickerProps export type StatProps=j.StatProps export type ProgressProps=j.ProgressProps export
type ConsoleProps=j.ConsoleProps export type TextProps=j.TextProps export type DividerProps=j.DividerProps export type
NotifyProps=j.NotifyProps export type ToastProps=j.ToastProps export type PopupBox=j.PopupBox export type PopupOption=j.
PopupOption export type PopupProps=j.PopupProps export type Moveable=j.Moveable export type Lockable=j.Lockable export
type Window=j.Window export type Tab=j.Tab export type Group=j.Group export type Button=j.Button export type Toggle=j.
Toggle export type Slider=j.Slider export type Dropdown=j.Dropdown export type Input=j.Input export type Keybind=j.
Keybind export type ColorPicker=j.ColorPicker export type Stat=j.Stat export type Progress=j.Progress export type
Console=j.Console export type Section=j.Section export type TabSection=j.TabSection export type Text=j.Text export type
Divider=j.Divider export type Tag=j.Tag export type Popup=j.Popup export type Rayfield=j.Rayfield type WindowModule={new
:(j.WindowProps)->j.Window}local k={}::Rayfield function k.CreateWindow(l,m:j.WindowProps):j.Window local n:j.Window?,o:
(()->())?if f.secureMode then g.preload(function(p)if p<=0 then return end local function q()if not n or n.unloaded then
return end n:Notify{title=h.resolve'Secure mode',content=if p==1 then h.resolve
"An asset couldn't be cached and won't appear."else h.resolve"Some assets couldn't be cached and won't appear."}end if n
then q()else o=q end end)end local p,q=d(c.utility.relayout).session(m,function(p)local q,r=pcall(function()return(d(c.
components.window)::WindowModule).new(p)end)if not q then error(r,0)end return r end)local r=q::j.Window n=r if o then
task.spawn(o)o=nil end if f.secureMode then task.spawn(function()local s,t=f.fontManager:loadFont(i.fontAsset,Enum.
FontWeight.Medium),f.fontManager:loadFont(i.fontAsset,Enum.FontWeight.SemiBold)if not r.unloaded and s and t and s~=f.
fallbackFont and t~=f.fallbackFont then r:ChangeTheme{Font=s,TitleFont=t}end end)end task.spawn(function()task.wait(0.5)
if not r.unloaded then r:Show()end end)return p end return k end)()end,[3]=function()local b,c,d=a(3)local e return(
function(...)local f={}f.__index=f f.__type='Action'local g=c.Parent.Parent.utility local h,i,j=d(g.variables),d(g.log),
d(g.HapticEngine)function f.new(k,l)l=if typeof(l)=='table'then l else{}local m=setmetatable({window=assert(k,
'Missing argument #1 (Window expected)'),name=l.name or l.Name or'Action',icon=assert(l.icon or l.Icon,
'Missing argument (Icon expected)'),callback=assert(l.callback or l.Callback,'Missing argument (Function expected)'),
linkedTab=l.linkedTab or l.LinkedTab},f)m.action=m.window:Create('Frame',{Name=m.name,BorderSizePixel=0,LayoutOrder=-(l.
order or 0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Parent=m.window.actionContainer})m.iconLabel=m.window:
Create('ImageLabel',{Image=m.icon,Size=UDim2.fromOffset(20,20),BorderSizePixel=0,AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,ImageTransparency=1,Parent=m.action},{ImageColor3=
'ActionColor'})m.interact=m.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),
BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=m.action}
)local function n()if not m.window:_settled()then return end if m.linkedTab and m.window.selectedTab==m.linkedTab then
return end if m.isLit and m:isLit()then return end h.tweenService:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle
.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end m.window:Connect(m.interact.MouseButton1Click,
function()j.click()task.spawn(function()local o,p=pcall(m.callback)if not o then i.warn(`Rayfield encountered an error, with the callback for a {
m.__type} component named '{m.name}':`)i.print(p)end n()end)end)m.window:Connect(m.interact.MouseEnter,function()if not
m.window:_interactive()then return end h.tweenService:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.2}):Play()end)m.window:Connect(m.interact.MouseLeave,n)m.window:
_applyActionSize()return m end return f end)()end,[4]=function()local b,c,d=a(4)local e return(function(...)local f={}f.
__index=f f.__type='Button'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o=d(g.variables),d(g.functions),d(g.
moveable),d(g.lockable),d(g.locale),d(g.HapticEngine),d(g.imageCache),0.35 function f.new(p,q)q=if typeof(q)=='table'
then q else{}local r=setmetatable({tab=assert(p,'Missing argument #1 (Tab expected)'),window=p.window,name=q.name or q.
Name or'Button',icon=d(c.Parent.Parent.utility.image).iconFrom(q),description=q.description or q.Description,compact=p.
compact or false,callback=q.callback or q.Callback or function()end},f)r.rowHeight=r.window:_richHeight(r,43)if r.
compact then r:_buildCompact()else r:_buildFull()end if r.description and not r.compact then r.descriptor=d(c.Parent.
descriptor).new(r.tab,{description=r.description})end r.window:_decorate(r,q,50)return r end function f._runCallback(p)p
.window:_runGuarded(p,p.callback)end function f._buildFull(p)p.main=p.window:Create('Frame',{Size=UDim2.new(1,-20,0,p.
rowHeight),BorderSizePixel=0,Name=p.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=p.
tab.tabPage},{BackgroundTransparency='ElementTransparency'})p.stroke=p.window:StyleElementBody(p.main)p.hoverOverlay=p.
window:CreateHoverOverlay(p.main)p.container=p.window:Create('Frame',{BorderSizePixel=0,Parent=p.main,Size=UDim2.new(0,
170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1})p.containerLayout=p.
window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=p.container})if p.icon then p.
iconLabel=p.window:Create('ImageLabel',{Image=p.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=p.container},{ImageColor3='ContentColor'})end p.title=p.window:
Create('TextLabel',{Text=l.t(p.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=
16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=p.container},{TextColor3='ContentColor',FontFace='Font'})local q=n.clickIcon()if q then p.
clickLabel=p.window:Create('ImageLabel',{Name='Click',Image=q,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-18,
0.5,0),Size=UDim2.fromOffset(20,20),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=p.main},{
ImageColor3='ContentColor'})end p.interact=p.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1
,1),BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=p.
main})p.window:_wireElementHover(p)p.window:ConnectFor(p,p.interact.MouseButton1Click,function()m.click()h.tweenService:
Create(p.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()p.window:
_pressSqueeze(p,true)p:_runCallback()task.wait(0.11)p.window:_pressSqueeze(p,false)h.tweenService:Create(p.stroke,
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=p.window.theme.
ElementStrokeTransparency}):Play()end)end function f._buildCompact(p)local q=p.window p.main,p.stroke,p.interact=q:
_buildCompactRow(p.tab,p.name)p.hoverOverlay=p.interact q:Create('UIPadding',{PaddingLeft=UDim.new(0,16),PaddingRight=
UDim.new(0,16),Parent=p.interact})q:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment
=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=UDim.new(0,6),Parent=p.
interact})if p.icon then p.iconLabel=q:Create('ImageLabel',{Image=p.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,Parent=p.interact},{ImageColor3='ContentColor'})end p.title=q
:Create('TextLabel',{Text=l.t(p.name),Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,
LayoutOrder=1,TextTransparency=1,Parent=p.interact},{TextColor3='ContentColor',FontFace='Font'})q:Create('UIFlexItem',{
FlexMode=Enum.UIFlexMode.Shrink,Parent=p.title})p.window:_wireElementHover(p)p.window:ConnectFor(p,p.interact.
MouseButton1Click,function()m.click()h.tweenService:Create(p.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Transparency=1}):Play()p:_runCallback()task.wait(0.11)h.tweenService:Create(p.stroke,TweenInfo.
new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=p.window.theme.ElementStrokeTransparency}):Play(
)end)end function f._setShown(p,q,r)if q then p.window:_revealCommon(p,r)else p.window:_hideCommon(p,r)end p.window:
_reveal(p.clickLabel,{ImageTransparency=if q then o else 1},r)end function f._minWidth(p)local q=32 if p.icon then q+=22
end q+=i.textWidth(p.window.theme.Font,16,l.resolve(p.name))return q end j(f)k(f)return f end)()end,[5]=function()local
b,c,d=a(5)local e return(function(...)local f=c.Parent.Parent.utility local g,h,i,j,k,l,m,n=d(f.variables),d(f.pointer),
d(f.filesystem),d(f.constants),d(f.locale),d(f.HapticEngine),{},5 function m.buildCollapsedFace(o)local p=o.showIconOnly
o.collapsedIcon=o:Create('ImageLabel',{Name='CollapsedIcon',AnchorPoint=if p then Vector2.new(0.5,0.5)else Vector2.new(0
,0.5),Position=if p then UDim2.fromScale(0.5,0.5)else UDim2.new(0,16,0.5,0),Size=UDim2.fromOffset(24,24),
BackgroundTransparency=1,Image=o.showIcon,ZIndex=j.zIndex.restoreContent,ImageTransparency=1,Parent=o.main},{ImageColor3
='TitlingColor'})o:Create('UICorner',{Parent=o.collapsedIcon},{CornerRadius='PillCornerRadius'})local q=o:Create('Frame'
,{Name='CollapsedText',Visible=not p,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,50,0.5,0),Size=UDim2.new(1,-60,
0,32),BackgroundTransparency=1,ZIndex=j.zIndex.restoreContent,Parent=o.main})o:Create('UIListLayout',{Padding=UDim.new(0
,1),VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=q})o.collapsedTitle=o:
Create('TextLabel',{Name='Title',Text=o.showName,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,FontFace=g.brandFont(
Enum.FontWeight.Medium),RichText=true,TextSize=16,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1
,ZIndex=j.zIndex.restoreContent,TextTransparency=1,Parent=q},{TextColor3='TitlingColor'})o.collapsedSubtitle=o:Create(
'TextLabel',{Name='Subtitle',Text=k.t'Tap to show',Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,FontFace=g.
brandFont(Enum.FontWeight.Medium),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,ZIndex=j.zIndex.
restoreContent,TextTransparency=1,Parent=q},{TextColor3='TitlingColor'})o.collapsedInteract=o:Create('TextButton',{Name=
'CollapsedInteract',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,Visible=false,ZIndex=j
.zIndex.restoreInteract,Parent=o.main})m.bindCollapsedDrag(o)end function m.bindCollapsedDrag(o)local p,q,r,s,t,u=g.
userInputService,false,false,Vector2.zero,(Vector2.zero)local function v()if o.screenGui and o.screenGui.IgnoreGuiInset
then return g.guiService:GetGuiInset()end return Vector2.zero end o:Connect(o.collapsedInteract.InputBegan,function(w,x)
if x or not o.hidden or o.animating then return end local y=w.UserInputType.Name if y~='MouseButton1'and y~='Touch'then
return end q,r=true,false u=w t=h.location(w)s=o.main.AbsolutePosition+o.main.AbsoluteSize*o.main.AnchorPoint-t end)o:
Connect(p.InputEnded,function(w)local x=w.UserInputType.Name if x~='MouseButton1'and x~='Touch'then return end if not q
then return end q=false if r then o._collapsedPosition=o.main.Position return end l.click()o:ToggleHide()end)o:Connect(p
.WindowFocusReleased,function()q=false end)o:Connect(g.runService.RenderStepped,function()if not q then return end if
not o.hidden or o.animating then q=false return end local w=h.location(u)if not r and(w-t).Magnitude<n then return end r
=true local x=w+s+v()local y,z=o:_fitCenter(x.X,x.Y,o.main.AbsoluteSize)o.main.Position=UDim2.fromOffset(y,z)end)end
function m.isNewUser()local o=g.localPlayer if not o then return false end if typeof(i.isfile)~='function'or typeof(i.
writefile)~='function'then return true end local p,q,r=g.fileSystemManager:getPath'lastuser.txt',tostring(o.UserId),true
pcall(function()if i.isfile(p)then r=i.readfile(p)~=q end end)pcall(function()i.writefile(p,q)end)return r end function
m.setCollapsedShown(o,p,q)local r={[o.collapsedIcon]={ImageTransparency=if p then 0 else 1}}if not o.showIconOnly then r
[o.collapsedTitle]={TextTransparency=if p then 0 else 1}r[o.collapsedSubtitle]={TextTransparency=if p then 0.5 else 1}
end for s,t in r do if q then g.tweenService:Create(s,q,t):Play()else for u,v in t do s[u]=v end end end end return m
end)()end,[6]=function()local b,c,d=a(6)local e return(function(...)local f={}f.__index=f f.__type='ColorPicker'local g=
c.Parent.Parent.utility local h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A=d(g.variables),d(g.pointer),d(g.functions),d(g.
moveable),d(g.lockable),d(g.constants),d(g.locale),d(g.HapticEngine),ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.17,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(0.33,Color3
.fromRGB(0,255,0)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.67,Color3.
fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.83,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(
255,0,0))},41,52,Vector2.new(150,120),184,10,214,10,240,62,8,400 local B,C,D,E,F,G,H,I={wide={height=190,previewPos=
UDim2.new(1,-20,0,r+39),previewSize=UDim2.new(1,-(x+20),0,78),hexPos=UDim2.new(0,x,0,r+90),hexSize=UDim2.new(1,-(x+20+y+
z),0,30),alphaFieldPos=UDim2.new(1,-(20+y),0,r+90),alphaFieldSize=UDim2.new(0,y,0,30)},narrow={height=296,previewPos=
UDim2.new(1,-20,0,r+s.Y+40),previewSize=UDim2.new(1,-40,0,56),hexPos=UDim2.new(0,20,0,r+s.Y+78),hexSize=UDim2.new(1,-(40
+y+z),0,30),alphaFieldPos=UDim2.new(1,-(20+y),0,r+s.Y+78),alphaFieldSize=UDim2.new(0,y,0,30)}},UDim2.new(1,-16,0,q/2),
UDim2.fromOffset(40,22),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo
.new(0.12,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection
.Out)local function J(K)return math.clamp(K,0,1)end local function K(L)return math.clamp(math.round(L),0,255)end local L
={black=Color3.fromRGB(0,0,0),white=Color3.fromRGB(255,255,255),red=Color3.fromRGB(255,0,0),green=Color3.fromRGB(0,255,0
),blue=Color3.fromRGB(0,0,255),yellow=Color3.fromRGB(255,255,0),cyan=Color3.fromRGB(0,255,255),magenta=Color3.fromRGB(
255,0,255),orange=Color3.fromRGB(255,165,0),purple=Color3.fromRGB(128,0,128),pink=Color3.fromRGB(255,105,180),brown=
Color3.fromRGB(139,69,19),gray=Color3.fromRGB(128,128,128),grey=Color3.fromRGB(128,128,128)}local function M(N,O,P)if O
<=0 then return Color3.new(P,P,P)end local function Q(R,S,T)T=T%1 if T<0.16666666666666666 then return R+(S-R)*6*T
elseif T<0.5 then return S elseif T<0.6666666666666666 then return R+(S-R)*(0.6666666666666666-T)*6 end return R end
local R=if P<0.5 then P*(1+O)else P+O-P*O local S=2*P-R return Color3.new(Q(S,R,N+0.3333333333333333),Q(S,R,N),Q(S,R,N-
0.3333333333333333))end local function N(O)local P={}for Q in O:gmatch'[%d%.]+'do table.insert(P,tonumber(Q))end return
P end local function O(P)if typeof(P)~='string'then return nil end local Q=(P:lower():match'^%s*(.-)%s*$')or''if Q==''
then return nil end if L[Q]then return L[Q]end local R,S=Q:match'^(%a+)',N(Q)if(R=='hsv'or R=='hsb')and#S>=3 then local
T,U,V=(S[1]%360)/360,if S[2]>1 then S[2]/100 else S[2],if S[3]>1 then S[3]/100 else S[3]return Color3.fromHSV(T,J(U),J(V
))end if R=='hsl'and#S>=3 then local T,U,V=(S[1]%360)/360,if S[2]>1 then S[2]/100 else S[2],if S[3]>1 then S[3]/100 else
S[3]return M(T,J(U),J(V))end if(R=='rgb'or R=='rgba')and#S>=3 then return Color3.fromRGB(K(S[1]),K(S[2]),K(S[3]))end
local T=Q:match'^#?(%x%x%x%x%x%x)$'or Q:match'^#?(%x%x%x)$'or Q:match'^0x(%x%x%x%x%x%x)$'if T then local U,V=pcall(
Color3.fromHex,T)if U then return V end end if#S>=3 and not R then if S[1]<=1 and S[2]<=1 and S[3]<=1 then return Color3
.new(J(S[1]),J(S[2]),J(S[3]))end return Color3.fromRGB(K(S[1]),K(S[2]),K(S[3]))end return nil end local function P(Q,R)
if typeof(Q)=='Color3'then return Q end if typeof(Q)=='string'then return O(Q)or R end return R end function f.new(Q,R)R
=if typeof(R)=='table'then R else{}local S=setmetatable({tab=assert(Q,'Missing argument #1 (Tab expected)'),window=Q.
window,name=R.name or R.Name or'Color Picker',icon=R.icon or R.Icon,description=R.description or R.Description,
forgetState=R.forgetState or R.ForgetState or Q.forgetState,callback=R.callback or R.Callback or function()end,_isOpen=
false},f)S.rowHeight=41 S.value=P(R.color or R.Color or R.value or R.Value or R.default,Color3.fromRGB(255,255,255))S.
hue,S.sat,S.val=S.value:ToHSV()local T=R.alpha or R.Alpha S.alpha=if type(T)=='number'then J(T)else 1 S.flag=R.flag or R
.Flag or(not S.forgetState and j.deriveFlagFromName(S.name)or nil)S.window:_registerControl(S)S.main=S.window:Create(
'Frame',{Size=UDim2.new(1,-20,0,q),BorderSizePixel=0,Name=S.name,BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,Parent=S.tab.tabPage},{BackgroundTransparency='ElementTransparency'})S.stroke=S.window:
StyleElementBody(S.main)S.hoverOverlay=S.window:CreateHoverOverlay(S.main)S:_buildHeader()S:_buildPicker()S.window:
ConnectFor(S,S.interact.MouseButton1Click,function()o.click()if S._isOpen then S:_close()else S:_open()end end)S.window:
ConnectFor(S,S.main.MouseEnter,function()if S._isOpen or not S.window:_interactive()then return end local U=S.window.
theme h.tweenService:Create(S.stroke,F,{Transparency=U.ElementStrokeHoverTransparency,Color=U.ElementStrokeHover}):Play(
)h.tweenService:Create(S.title,F,{TextColor3=U.ElementTextHoverColor}):Play()h.tweenService:Create(S.hoverOverlay,F,{
BackgroundTransparency=0.97}):Play()end)S.window:ConnectFor(S,S.main.MouseLeave,function()local U=S.window.theme h.
tweenService:Create(S.stroke,F,{Transparency=U.ElementStrokeTransparency,Color=U.ElementStroke}):Play()h.tweenService:
Create(S.title,F,{TextColor3=U.ContentColor}):Play()h.tweenService:Create(S.hoverOverlay,F,{BackgroundTransparency=1}):
Play()end)if S.description then S.descriptor=d(c.Parent.descriptor).new(S.tab,{description=S.description})end S:
_applyPickerVisibility(false,false)S:_setControlsVisible(false)S.window:ConnectFor(S,S.main:GetPropertyChangedSignal
'AbsoluteSize',function()if S.window.animating or(S.window.hidden and S.window.hasShownOnce)then return end S:
_applyLayout()end)S:_applyLayout()S:_render'instant'return S end function f._buildHeader(Q)Q.container=Q.window:Create(
'Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0,q/2),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency
=1,BorderSizePixel=0,ZIndex=5,Parent=Q.main})Q.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=Q.
container})if Q.icon then Q.iconLabel=Q.window:Create('ImageLabel',{Image=Q.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=Q.container},{ImageColor3='ContentColor'}
)end Q.title=Q.window:Create('TextLabel',{Text=n.t(Q.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=Q.container},{TextColor3='ContentColor',FontFace='Font'})Q.preview=Q.
window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=C,Size=D,BackgroundColor3=Q.value,BorderSizePixel=0,
ZIndex=3,BackgroundTransparency=1,Parent=Q.main})Q.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=Q.preview
})Q.previewShadow=Q.window:CreateGlow(Q.preview,Q.value,20,1)Q.invisibleGroup=Q.window:Create('Frame',{Size=UDim2.
fromScale(1,1),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=5,Parent=Q.preview})Q.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal
,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=UDim.new(0,
6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=Q.invisibleGroup})Q.invisibleIcon=Q.window:Create('ImageLabel',{Image=m.
icons.colorpicker,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,ImageTransparency=1,
Parent=Q.invisibleGroup},{ImageColor3='ContentColor'})Q.invisibleText=Q.window:Create('TextLabel',{Text=n.t'Invisible',
Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=Q.invisibleGroup},{TextColor3='ContentColor',FontFace='Font'})Q.
interact=Q.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,q),Position=UDim2.fromScale(0,0),
BorderSizePixel=0,Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=10,Parent=Q.main})end function f._buildMap(Q)Q
.map=Q.window:Create('Frame',{Position=UDim2.fromOffset(20,r),Size=UDim2.fromOffset(s.X,s.Y),BackgroundColor3=Color3.
fromHSV(Q.hue,1,1),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=Q.main})Q.window:Create('UICorner',{
CornerRadius=UDim.new(0,8),Parent=Q.map})Q.mapStroke=Q.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),
Transparency=1,Parent=Q.map})Q.satOverlay=Q.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,ZIndex=3,BackgroundTransparency=1,Parent=Q.map})Q.window:Create('UICorner',{
CornerRadius=UDim.new(0,8),Parent=Q.satOverlay})Q.window:Create('UIGradient',{Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)},Parent=Q.satOverlay})Q.valOverlay=Q.window:Create(
'Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,ZIndex=4,
BackgroundTransparency=1,Parent=Q.map})Q.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=Q.valOverlay})Q.
window:Create('UIGradient',{Rotation=90,Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,0)},Parent=Q.valOverlay})end function f._buildPicker(Q)Q:_buildMap()Q.satCursor=Q.window:
Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromOffset(12,12),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,ZIndex=6,BackgroundTransparency=1,Parent=Q.map})Q.window:Create('UICorner',{CornerRadius=UDim.
new(1,0),Parent=Q.satCursor})Q.satCursorStroke=Q.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=2
,Transparency=1,Parent=Q.satCursor})Q.mapInteract=Q.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.
fromScale(1,1),Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=7,Parent=Q.map})Q.hueBar=Q.window:Create('Frame',
{Position=UDim2.fromOffset(t,r),Size=UDim2.fromOffset(u,s.Y),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=Q.main})Q.window:Create('UICorner',{CornerRadius=UDim.new(1,0
),Parent=Q.hueBar})Q.window:Create('UIGradient',{Color=p,Rotation=90,Parent=Q.hueBar})Q.hueHandle=Q.window:Create(
'Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(u+8,8),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=Q.hueBar})Q.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=Q.hueHandle})Q.hueHandleStroke=Q.window:Create('UIStroke',{Color=Color3.
fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=Q.hueHandle})Q.hueInteract=Q.window:Create('TextButton',{
BackgroundTransparency=1,Size=UDim2.new(1,16,1,8),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),
Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=6,Parent=Q.hueBar})Q.alphaBar=Q.window:Create('Frame',{Position=
UDim2.fromOffset(v,r),Size=UDim2.fromOffset(w,s.Y),BackgroundColor3=Q.value,BorderSizePixel=0,ZIndex=2,
BackgroundTransparency=1,Parent=Q.main})Q.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=Q.alphaBar})Q.
alphaGradient=Q.window:Create('UIGradient',{Rotation=90,Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1)},Parent=Q.alphaBar})Q.alphaHandle=Q.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(w+8,8),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=Q.alphaBar})Q.window:Create('UICorner',{CornerRadius=UDim.
new(1,0),Parent=Q.alphaHandle})Q.alphaHandleStroke=Q.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),
Thickness=2,Transparency=1,Parent=Q.alphaHandle})Q.alphaInteract=Q.window:Create('TextButton',{BackgroundTransparency=1,
Size=UDim2.new(1,16,1,8),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),Text='',TextTransparency=1,
AutoButtonColor=false,ZIndex=6,Parent=Q.alphaBar})Q.hexBox=Q.window:Create('Frame',{Position=UDim2.new(0,x,0,r+90),Size=
UDim2.new(1,-(x+20),0,30),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency
=1,Parent=Q.main})Q.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=Q.hexBox})Q.hexBoxStroke=Q.window:
Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=Q.hexBox})Q.hexInput=Q.window:Create(
'TextBox',{Text='#'..Q.value:ToHex():upper(),PlaceholderText=n.t'Smart Input',Size=UDim2.new(1,-14,1,0),Position=UDim2.
fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,ZIndex=3,TextTransparency=1,Parent=Q.hexBox},{
TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})Q.alphaBox=Q.window:Create('Frame',{
Position=UDim2.new(0,x,0,r+90),Size=UDim2.fromOffset(y,30),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=
0,ZIndex=2,BackgroundTransparency=1,Parent=Q.main})Q.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=Q.
alphaBox})Q.alphaBoxStroke=Q.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=Q.
alphaBox})Q.alphaInput=Q.window:Create('TextBox',{Text=tostring(math.round(Q.alpha*100))..'%',PlaceholderText='100%',
Size=UDim2.new(1,-10,1,0),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,ZIndex=3,TextTransparency
=1,Parent=Q.alphaBox},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})Q.window:
ConnectFor(Q,Q.mapInteract.InputBegan,function(R)if R.UserInputType==Enum.UserInputType.MouseButton1 or R.UserInputType
==Enum.UserInputType.Touch then Q._dragInput=R Q:_beginDrag('sat',R.UserInputType==Enum.UserInputType.MouseButton1)end
end)Q.window:ConnectFor(Q,Q.hueInteract.InputBegan,function(R)if R.UserInputType==Enum.UserInputType.MouseButton1 or R.
UserInputType==Enum.UserInputType.Touch then Q._dragInput=R Q:_beginDrag('hue',R.UserInputType==Enum.UserInputType.
MouseButton1)end end)Q.window:ConnectFor(Q,Q.alphaInteract.InputBegan,function(R)if R.UserInputType==Enum.UserInputType.
MouseButton1 or R.UserInputType==Enum.UserInputType.Touch then Q._dragInput=R Q:_beginDrag('alpha',R.UserInputType==Enum
.UserInputType.MouseButton1)end end)Q.window:ConnectFor(Q,h.userInputService.InputEnded,function(R)if(R.UserInputType==
Enum.UserInputType.MouseButton1 or R.UserInputType==Enum.UserInputType.Touch)and Q._drag then Q:_endDrag()end end)Q.
window:ConnectFor(Q,Q.hexInput.FocusLost,function()local R=O(Q.hexInput.Text)if R then Q:Set(R)else Q.hexInput.Text='#'
..Q.value:ToHex():upper()end end)Q.window:ConnectFor(Q,Q.alphaInput.FocusLost,function()local R=tonumber((Q.alphaInput.
Text:gsub('[^%d%.]','')))if R then Q:SetAlpha(J(R/100))else Q.alphaInput.Text=tostring(math.round(Q.alpha*100))..'%'end
end)end function f._beginDrag(Q,R,S)if not Q._isOpen then return end Q._drag=R Q._dragIsMouse=S Q:_setHeld(R)Q:_pump()if
Q._dragConnection then Q._dragConnection:Disconnect()Q._dragConnection=nil end Q._dragConnection=h.runService.
RenderStepped:Connect(function()local T=Q._dragIsMouse and not h.userInputService:IsMouseButtonPressed(Enum.
UserInputType.MouseButton1)if Q.window.unloaded or not Q._drag or T then if T then Q:_endDrag()return end if Q.
_dragConnection then Q._dragConnection:Disconnect()Q._dragConnection=nil end return end Q:_pump()end)end function f.
_endDrag(Q)Q._drag=nil Q:_setHeld(nil)if Q._dragConnection then Q._dragConnection:Disconnect()Q._dragConnection=nil end
Q.window:_persist(Q)end function f._setHeld(Q,R)local S,T,U=if R=='sat'then UDim2.fromOffset(16,16)else UDim2.
fromOffset(12,12),if R=='hue'then UDim2.fromOffset(u+12,10)else UDim2.fromOffset(u+8,8),if R=='alpha'then UDim2.
fromOffset(w+12,10)else UDim2.fromOffset(w+8,8)h.tweenService:Create(Q.satCursor,I,{Size=S}):Play()h.tweenService:
Create(Q.hueHandle,I,{Size=T}):Play()h.tweenService:Create(Q.alphaHandle,I,{Size=U}):Play()end function f._mouseLocation
(Q)local R,S=i.location(Q._dragInput),Q.window.screenGui if S and S.IgnoreGuiInset then return R-h.guiService:
GetGuiInset()end return R end function f._pump(Q)local R,S,T,U=Q.hue,Q.sat,Q.val,Q.alpha if Q._drag=='sat'then local V=Q
.map.AbsoluteSize if V.X<=0 or V.Y<=0 then return end local W=Q:_mouseLocation()Q.sat=J((W.X-Q.map.AbsolutePosition.X)/V
.X)Q.val=1-J((W.Y-Q.map.AbsolutePosition.Y)/V.Y)elseif Q._drag=='hue'then local V=Q.hueBar.AbsoluteSize.Y if V<=0 then
return end local W=Q:_mouseLocation()Q.hue=J((W.Y-Q.hueBar.AbsolutePosition.Y)/V)elseif Q._drag=='alpha'then local V=Q.
alphaBar.AbsoluteSize.Y if V<=0 then return end local W=Q:_mouseLocation()Q.alpha=1-J((W.Y-Q.alphaBar.AbsolutePosition.Y
)/V)else return end if Q.hue==R and Q.sat==S and Q.val==T and Q.alpha==U then return end Q.value=Color3.fromHSV(Q.hue,Q.
sat,Q.val)Q:_render'drag'Q:_fireCallback()end function f._render(Q,R)local S,T,U,V,W,X=Color3.fromHSV(Q.hue,1,1),UDim2.
new(Q.sat,0,1-Q.val,0),UDim2.new(0.5,0,Q.hue,0),UDim2.new(0.5,0,1-Q.alpha,0),1-Q.alpha,1-0.4*Q.alpha if R=='instant'then
Q.map.BackgroundColor3=S Q.satCursor.Position,Q.satCursor.BackgroundColor3=T,Q.value Q.hueHandle.Position,Q.hueHandle.
BackgroundColor3=U,S Q.alphaBar.BackgroundColor3=Q.value Q.alphaHandle.Position,Q.alphaHandle.BackgroundColor3=V,Q.value
Q.preview.BackgroundColor3=Q.value Q.previewShadow.Color=Q.value if not Q.window.hidden then Q.preview.
BackgroundTransparency=W Q.previewShadow.Transparency=X end else local Y=if R=='drag'then H else G h.tweenService:
Create(Q.map,Y,{BackgroundColor3=S}):Play()h.tweenService:Create(Q.satCursor,Y,{Position=T,BackgroundColor3=Q.value}):
Play()h.tweenService:Create(Q.hueHandle,Y,{Position=U,BackgroundColor3=S}):Play()h.tweenService:Create(Q.alphaHandle,Y,{
Position=V,BackgroundColor3=Q.value}):Play()h.tweenService:Create(Q.alphaBar,G,{BackgroundColor3=Q.value}):Play()local Z
,_={BackgroundColor3=Q.value},{Color=Q.value}if not Q.window.hidden then Z.BackgroundTransparency=W _.Transparency=X end
h.tweenService:Create(Q.preview,G,Z):Play()h.tweenService:Create(Q.previewShadow,G,_):Play()end if not Q.hexInput:
IsFocused()then Q.hexInput.Text='#'..Q.value:ToHex():upper()end if not Q.alphaInput:IsFocused()then Q.alphaInput.Text=
tostring(math.round(Q.alpha*100))..'%'end Q:_renderInvisible(R~='instant')end function f._renderInvisible(Q,R)local S=0
if Q._isOpen and not Q.window.hidden then S=J((0.12-Q.alpha)/0.12)end local T=1-S if R then h.tweenService:Create(Q.
invisibleIcon,F,{ImageTransparency=T}):Play()h.tweenService:Create(Q.invisibleText,F,{TextTransparency=T}):Play()else Q.
invisibleIcon.ImageTransparency=T Q.invisibleText.TextTransparency=T end end function f._fireCallback(Q)Q.window:
_runGuarded(Q,Q.callback,Q.value,Q.alpha)end function f._open(Q)if Q._isOpen then return end Q._isOpen=true Q:
_setControlsVisible(true)if Q._outsideClickConn then Q.window:Disconnect(Q._outsideClickConn)end Q._outsideClickConn=Q.
window:Connect(h.userInputService.InputBegan,function(R)if R.UserInputType~=Enum.UserInputType.MouseButton1 and R.
UserInputType~=Enum.UserInputType.Touch then return end local S,T,U=R.Position,Q.main.AbsolutePosition,Q.main.
AbsoluteSize if S.X<T.X or S.X>T.X+U.X or S.Y<T.Y or S.Y>T.Y+U.Y then Q:_close()end end)h.tweenService:Create(Q.main,E,{
Size=UDim2.new(1,-20,0,Q._openHeight)}):Play()h.tweenService:Create(Q.preview,E,{Position=Q._previewOpenPos,Size=Q.
_previewOpenSize}):Play()Q:_applyPickerVisibility(true,true)Q:_renderInvisible(true)end function f._close(Q)if not Q.
_isOpen then return end Q._isOpen=false if Q._outsideClickConn then Q.window:Disconnect(Q._outsideClickConn)Q.
_outsideClickConn=nil end if Q._drag then Q:_endDrag()end if Q.hexInput:IsFocused()then Q.hexInput:ReleaseFocus()end if
Q.alphaInput:IsFocused()then Q.alphaInput:ReleaseFocus()end Q:_applyPickerVisibility(false,true)Q:_renderInvisible(true)
h.tweenService:Create(Q.preview,E,{Position=C,Size=D}):Play()h.tweenService:Create(Q.main,E,{Size=UDim2.new(1,-20,0,q)})
:Play()task.delay(F.Time,function()if not Q._isOpen then Q:_setControlsVisible(false)end end)end function f.
_applyPickerVisibility(Q,R,S)local T={[Q.map]={BackgroundTransparency=if R then 0 else 1},[Q.satOverlay]={
BackgroundTransparency=if R then 0 else 1},[Q.valOverlay]={BackgroundTransparency=if R then 0 else 1},[Q.mapStroke]={
Transparency=if R then 0.9 else 1},[Q.satCursor]={BackgroundTransparency=if R then 0 else 1},[Q.satCursorStroke]={
Transparency=if R then 0 else 1},[Q.hueBar]={BackgroundTransparency=if R then 0 else 1},[Q.hueHandle]={
BackgroundTransparency=if R then 0 else 1},[Q.hueHandleStroke]={Transparency=if R then 0 else 1},[Q.alphaBar]={
BackgroundTransparency=if R then 0 else 1},[Q.alphaHandle]={BackgroundTransparency=if R then 0 else 1},[Q.
alphaHandleStroke]={Transparency=if R then 0 else 1},[Q.hexBox]={BackgroundTransparency=if R then 0.9 else 1},[Q.
hexBoxStroke]={Transparency=if R then 0.85 else 1},[Q.hexInput]={TextTransparency=if R then 0.4 else 1},[Q.alphaBox]={
BackgroundTransparency=if R then 0.9 else 1},[Q.alphaBoxStroke]={Transparency=if R then 0.85 else 1},[Q.alphaInput]={
TextTransparency=if R then 0.4 else 1}}for U,V in T do if S then h.tweenService:Create(U,F,V):Play()else for W,X in V do
U[W]=X end end end end function f._setControlsVisible(Q,R)for S,T in{Q.map,Q.hueBar,Q.alphaBar,Q.hexBox,Q.alphaBox}do T.
Visible=R end end function f._applyLayout(Q)local R=Q.main.AbsoluteSize.X/Q.window.scale local S=if R>0 and R<A then
'narrow'else'wide'if S==Q._layoutMode then return end Q._layoutMode=S local T=B[S]Q._openHeight=T.height Q.
_previewOpenPos=T.previewPos Q._previewOpenSize=T.previewSize Q.hexBox.Position=T.hexPos Q.hexBox.Size=T.hexSize Q.
alphaBox.Position=T.alphaFieldPos Q.alphaBox.Size=T.alphaFieldSize if Q._isOpen then h.tweenService:Create(Q.main,E,{
Size=UDim2.new(1,-20,0,Q._openHeight)}):Play()h.tweenService:Create(Q.preview,E,{Position=Q._previewOpenPos,Size=Q.
_previewOpenSize}):Play()end end function f.Set(Q,R,S)Q.value=P(R,Q.value)Q.hue,Q.sat,Q.val=Q.value:ToHSV()Q:_render(if
Q._isOpen then'animate'else'instant')if not S then Q:_fireCallback()Q.window:_persist(Q)end end function f.SetAlpha(Q,R,
S)Q.alpha=J(if type(R)=='number'then R else Q.alpha)Q:_render(if Q._isOpen then'animate'else'instant')if not S then Q:
_fireCallback()Q.window:_persist(Q)end end function f._serialize(Q)return Q.value:ToHex()..string.format('%02x',math.
clamp(math.round((Q.alpha or 1)*255),0,255))end function f._deserialize(Q,R)local S,T=(tostring(R))if#S>=8 then T=(
tonumber(S:sub(7,8),16)or 255)/255 S=S:sub(1,6)end local U,V=pcall(Color3.fromHex,S)if not U then return end if T then Q
:SetAlpha(T,true)end Q:Set(V)end function f._setShown(Q,R,S)local T=Q.window if R then T:_revealCommon(Q,S)T:_reveal(Q.
preview,{BackgroundTransparency=1-Q.alpha},S)T:_reveal(Q.previewShadow,{Transparency=1-0.4*Q.alpha},S)else T:
_hideCommon(Q,S)T:_reveal(Q.preview,{BackgroundTransparency=1},S)T:_reveal(Q.previewShadow,{Transparency=1},S)if Q.
_isOpen then Q:_close()end end end k(f)l(f)return f end)()end,[7]=function()local b,c,d=a(7)local e return(function(...)
local f={}f.__index=f f.__type='Console'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o,p,q,r=d(g.moveable),d(g.
locale),120,48,24,17,12,12,1.25,200,Font.fromEnum(Enum.Font.Code)function f.new(s,t)t=if typeof(t)=='table'then t else{}
local u=setmetatable({tab=assert(s,'Missing argument #1 (Tab expected)'),window=s.window,name=t.name or t.Name,
description=t.description or t.Description,height=math.max(tonumber(t.height or t.Height)or j,k),follow=t.follow or t.
Follow or false,maxLines=math.max(tonumber(t.maxLines or t.MaxLines)or q,1),lines={},lineLabels={},head=1,nextOrder=1,
textDirty=true},f)u:_build()u:_setLines(t.text or t.Text or'')if u.description then u.descriptor=d(c.Parent.descriptor).
new(u.tab,{description=u.description})end return u end function f.Get(s):string if s.textDirty then s.text=table.concat(
s.lines,'\n')s.textDirty=false end return s.text end function f._setLines(s,t)t=if type(t)=='string'then t else
tostring(t)table.clear(s.lines)if t~=''then for u in string.gmatch(t..'\n','([^\n]*)\n')do table.insert(s.lines,u)end
end s:_trim()s:_flush()end function f._trim(s)local t=#s.lines-s.maxLines if t<=0 then return end table.move(s.lines,t+1
,#s.lines,1)for u=#s.lines,#s.lines-t+1,-1 do s.lines[u]=nil end end function f._makeLabel(s)return s.window:Create(
'TextLabel',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,
FontFace=r,TextSize=o,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,
LineHeight=p,RichText=false,TextTransparency=s._textTransparency or 1,Parent=s.scroll},{TextColor3='ContentColor'})end
local function s(t:string):string return if t==''then' 'else t end function f._flush(t)t.textDirty=true for u,v in t.
lines do local w=t.lineLabels[u]if not w then w=t:_makeLabel()t.lineLabels[u]=w end w.LayoutOrder=u w.Text=s(v)w.Visible
=true end for u=#t.lines+1,#t.lineLabels do t.lineLabels[u].Visible=false end t.head=1 t.nextOrder=#t.lines+1 t:_follow(
)end function f._pushLine(t,u:string)t.textDirty=true if#t.lines<t.maxLines then table.insert(t.lines,u)local v=#t.lines
local w=t.lineLabels[v]if not w then w=t:_makeLabel()t.lineLabels[v]=w end w.LayoutOrder=t.nextOrder w.Text=s(u)w.
Visible=true t.nextOrder+=1 return end table.move(t.lines,2,#t.lines,1)t.lines[#t.lines]=u local v=t.lineLabels[t.head]v
.LayoutOrder=t.nextOrder v.Text=s(u)v.Visible=true t.nextOrder+=1 t.head=(t.head%#t.lineLabels)+1 end function f._build(
t)local u=if t.name then l else 0 t.main=t.window:Create('Frame',{Size=UDim2.new(1,-20,0,t.height+u+m*2),BorderSizePixel
=0,Name=t.name or'Console',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=t.tab.tabPage},{
BackgroundTransparency='ElementTransparency'})t.stroke=t.window:StyleElementBody(t.main)if t.name then t.container=t.
window:Create('Frame',{Size=UDim2.new(1,-m*2,0,16),Position=UDim2.new(0,m,0,m),BackgroundTransparency=1,BorderSizePixel=
0,Parent=t.main})t.title=t.window:Create('TextLabel',{Text=i.t(t.name),Size=UDim2.fromScale(1,1),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=t.container},{
TextColor3='ContentColor',FontFace='Font'})end t.panel=t.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=
UDim2.new(0.5,0,1,-m),Size=UDim2.new(1,-m*2,0,t.height),BorderSizePixel=0,ClipsDescendants=true,BackgroundTransparency=1
,Parent=t.main},{BackgroundColor3='StatBackground'})t.window:Create('UICorner',{Parent=t.panel},{CornerRadius=
'ElementCornerRadius'})t.panelStroke=t.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Transparency=1,Parent=t.panel},{Color='SurfaceStroke'})t.scroll=t.window:Create('ScrollingFrame',{Size=UDim2.new(1,-n*2,
1,-n*2),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.
ScrollingDirection.Y,Parent=t.panel})t.scrollLayout=t.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=t.scroll})t:_watchCanvas()end function f._pin(t)local u=t.scroll if not u or not u.Parent
then return end u.CanvasPosition=Vector2.new(0,u.AbsoluteCanvasSize.Y)end function f._follow(t)if not t.follow then
return end t:_pin()task.defer(function()t:_pin()end)end function f._watchCanvas(t)t.window:ConnectFor(t,t.scrollLayout:
GetPropertyChangedSignal'AbsoluteContentSize',function()if t.follow then t:_pin()end end)end function f.Set(t,u)t:
_setLines(u)end function f.Append(t,u)u=if type(u)=='string'then u else tostring(u)for v in string.gmatch(u..'\n',
'([^\n]*)\n')do t:_pushLine(v)end t:_follow()end function f.Clear(t)table.clear(t.lines)t:_flush()end function f.Copy(t)
:boolean local u=(getgenv and getgenv().setclipboard)or setclipboard if typeof(u)~='function'then return false end
return(pcall(u,t:Get()))end function f.SetHeight(t,u)t.height=math.max(tonumber(u)or j,k)local v=if t.name then l else 0
t.panel.Size=UDim2.new(1,-m*2,0,t.height)t.main.Size=UDim2.new(1,-20,0,t.height+v+m*2)end function f._setShown(t,u,v)
local w=t.window w:_reveal(t.main,{BackgroundTransparency=if u then w.theme.ElementTransparency or 0 else 1},v)w:
_reveal(t.stroke,{Transparency=if u then w.theme.ElementStrokeTransparency else 1},v)w:_reveal(t.panel,{
BackgroundTransparency=if u then 0 else 1},v)w:_reveal(t.panelStroke,{Transparency=if u then 0.9 else 1},v)t.
_textTransparency=if u then 0.15 else 1 for x,y in t.lineLabels do w:_reveal(y,{TextTransparency=t._textTransparency},v)
end if t.title then w:_reveal(t.title,{TextTransparency=if u then 0 else 1},v)end if t.descriptor then w:_reveal(t.
descriptor.titleLabel,{TextTransparency=if u then 0.7 else 1},v)end end function f.Remove(t)if t.descriptor then t.
descriptor:Remove()end t.main:Destroy()end h(f)return f end)()end,[8]=function()local b,c,d=a(8)local e return(function(
...)local f={}f.__index=f f.__type='Descriptor'local g=d(c.Parent.Parent.utility.locale)function f.new(h,i)i=if typeof(i
)=='table'then i else{}local j=setmetatable({tab=assert(h,'Missing argument #1 (Tab expected)'),window=h.window,
description=i.description or i.Description or''},f)j.main=j.window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,Size=UDim2.new(1,-30,0,0),Parent=j.tab.tabPage})j.window:Create('UIListLayout',{SortOrder=Enum.
SortOrder.LayoutOrder,Parent=j.main})j.titleLabel=j.window:Create('TextLabel',{AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,RichText=true,Size=UDim2.new(1,-90,0,0),Text=g.t(j.description),TextSize=12,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=j.main},{TextColor3='ContentColor',FontFace='Font'})j.
window:Create('Frame',{BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,Size=UDim2.fromOffset(0,15),Parent=j.
main})return j end return f end)()end,[9]=function()local b,c,d=a(9)local e return(function(...)local f={}f.__index=f f.
__type='Discord'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w=d(g.moveable),d(g.locale),d(g.
network),d(g.variables),d(g.imageCache),d(g.HapticEngine),64,40,0.45,Color3.fromRGB(88,101,242),Color3.fromRGB(255,255,
255),Color3.fromRGB(226,226,230),'https://discord.com/api/v10/invites/%s?with_counts=true',
'https://cdn.discordapp.com/icons/%s/%s.png?size=128','http://127.0.0.1:6463/rpc?v=1',
[[Join our Discord to report bugs, give suggestions or ask a question!]]local function x(y:string):string return string.
match(y,'discord%.gg/([%w%-_]+)')or string.match(y,'discord%.com/invite/([%w%-_]+)')or string.match(y,'^([%w%-_]+)$')or
y end local function y(z:number):string local A,B=(tostring(math.floor(z)))repeat A,B=string.gsub(A,'^(%d+)(%d%d%d)',
'%1,%2')until B==0 return A end local function z(A:string):boolean local B=getfenv()local C=(B.getgenv and B.getgenv().
setclipboard)or B.setclipboard or B.toclipboard if type(C)~='function'then return false end return(pcall(C,A))end
local function A(B:string)local C,D=pcall(function()return game:HttpGet(string.format(t,B))end)if not C or type(D)~=
'string'then return nil end local E,F=pcall(function()return k.httpService:JSONDecode(D)end)if not E or type(F)~='table'
or type(F.guild)~='table'then return nil end return F end local function B(C:string):boolean local D=j.getRequestFn()if
not D then return false end local E,F=pcall(D,{Url=v,Method='POST',Headers={['Content-Type']='application/json',Origin=
'https://discord.com'},Body=k.httpService:JSONEncode{cmd='INVITE_BROWSER',nonce=k.httpService:GenerateGUID(false),args={
code=C}}})return E and type(F)=='table'and F.StatusCode==200 end function f.new(C,D)D=if typeof(D)=='table'then D else{}
local E=tostring(D.invite or D.Invite or'')local F=setmetatable({tab=assert(C,'Missing argument #1 (Tab expected)'),
window=C.window,invite=E,code=x(E),name=tostring(D.name or D.Name or'Discord'),text=tostring(D.text or D.Text or w),
buttonText=tostring(D.buttonText or D.ButtonText or'Join Server'),callback=D.callback or D.Callback,showMembers=D.
showMembers~=false and D.ShowMembers~=false,shown=false},f)F.main=F.window:Create('Frame',{Size=UDim2.new(1,-20,0,0),
AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,Name='Discord',BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,Parent=F.tab.tabPage},{BackgroundTransparency='ElementTransparency'})F.stroke=F.window:
StyleElementBody(F.main)F.window:Create('UIPadding',{PaddingTop=UDim.new(0,16),PaddingBottom=UDim.new(0,16),PaddingLeft=
UDim.new(0,16),PaddingRight=UDim.new(0,16),Parent=F.main})F.window:Create('UIListLayout',{Padding=UDim.new(0,14),
SortOrder=Enum.SortOrder.LayoutOrder,Parent=F.main})local G=F.window:Create('Frame',{Name='Header',Size=UDim2.new(1,0,0,
0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=1,Parent=F.main})F.window:
Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,14),SortOrder=Enum.SortOrder.
LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top,Parent=G})F.serverIcon=F.window:Create('ImageLabel',{Name=
'ServerIcon',Size=UDim2.fromOffset(n,n),BorderSizePixel=0,BackgroundColor3=q,ScaleType=Enum.ScaleType.Crop,Image='',
LayoutOrder=1,BackgroundTransparency=1,ImageTransparency=1,Parent=G})F.window:Create('UICorner',{CornerRadius=UDim.new(0
,16),Parent=F.serverIcon})F.mark=F.window:Create('ImageLabel',{Name='Mark',Image=l.discordIcon()or'',AnchorPoint=Vector2
.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(34,34),BorderSizePixel=0,BackgroundTransparency=1,
ImageColor3=Color3.fromRGB(255,255,255),ImageTransparency=1,Parent=F.serverIcon})local H=F.window:Create('Frame',{Name=
'Info',Size=UDim2.new(1,-(n+14),0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,
LayoutOrder=2,Parent=G})F.window:Create('UIListLayout',{Padding=UDim.new(0,3),SortOrder=Enum.SortOrder.LayoutOrder,
Parent=H})local function I(J,K,L,M)return F.window:Create('TextLabel',{Text=K,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum
.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,TextSize=L,TextWrapped=true,TextXAlignment=
Enum.TextXAlignment.Left,LayoutOrder=J,TextTransparency=1,Parent=H},M)end F.title=I(1,F.name,17,{TextColor3=
'TitlingColor',FontFace='Font'})F.members=I(2,'',14,{TextColor3='ContentColor',FontFace='Font'})F.members.Visible=false
F.body=I(3,i.t(F.text),14,{TextColor3='ContentColor',FontFace='Font'})F.button=F.window:Create('TextButton',{Name='Join'
,Text=i.t(F.buttonText),Size=UDim2.new(1,0,0,o),BorderSizePixel=0,AutoButtonColor=false,BackgroundColor3=r,TextColor3=
Color3.fromRGB(0,0,0),TextSize=16,LayoutOrder=2,BackgroundTransparency=1,TextTransparency=1,Parent=F.main},{FontFace=
'Font'})F.window:Create('UICorner',{CornerRadius=UDim.new(0,10),Parent=F.button})F.window:ConnectFor(F,F.button.
MouseEnter,function()k.tweenService:Create(F.button,TweenInfo.new(0.15),{BackgroundColor3=s}):Play()end)F.window:
ConnectFor(F,F.button.MouseLeave,function()k.tweenService:Create(F.button,TweenInfo.new(0.15),{BackgroundColor3=r}):
Play()end)F.window:ConnectFor(F,F.button.MouseButton1Click,function()m.click()F:Join()end)task.spawn(function()F:
Refresh()end)return F end function f.Join(C)local D=if string.find(C.invite,'^https?://')then C.invite else
'https://discord.gg/'..C.code local E,F=z(D),B(C.code)if F then C.window:Toast{title='Opened in Discord',subtitle=
'Accept the invite in the app'}elseif E then C.window:Toast{title='Invite copied',subtitle=
'Paste it in your browser or Discord'}else C.window:Toast{title=D,subtitle=
"Your executor can't copy, type it in instead"}end if type(C.callback)=='function'then task.spawn(C.callback,D)end end
function f.Refresh(C)local D=A(C.code)if not D or not C.main.Parent then return end local E=D.guild if type(E.name)==
'string'then C.name=E.name C.title.Text=E.name end local F=D.approximate_member_count if C.showMembers and type(F)==
'number'then local G='Member Count : '..y(F)if type(D.approximate_presence_count)=='number'then G..=
'  \u{b7}  Online : '..y(D.approximate_presence_count)end C.members.Text=G C.members.Visible=true end if type(E.id)==
'string'and type(E.icon)=='string'then local G=l.remote('discord_'..E.id..'_'..E.icon,string.format(u,E.id,E.icon))if G
and C.main.Parent then C.iconLoaded=true C.serverIcon.Image=G C.serverIcon.BackgroundTransparency=1 C.mark.Visible=false
end end end function f._setShown(C,D,E)C.shown=D if D then C.window:_revealCommon(C,E)else C.window:_hideCommon(C,E)end
local F,G=C.window,if D then 0 else 1 F:_reveal(C.serverIcon,{BackgroundTransparency=if C.iconLoaded then 1 else G,
ImageTransparency=G},E)F:_reveal(C.mark,{ImageTransparency=G},E)F:_reveal(C.members,{TextTransparency=if D then p else 1
},E)F:_reveal(C.body,{TextTransparency=if D then p else 1},E)F:_reveal(C.button,{BackgroundTransparency=G,
TextTransparency=G},E)end h(f)return f end)()end,[10]=function()local b,c,d=a(10)local e return(function(...)local f={}f
.__index=f f.__type='Divider'local g,h,i,j,k,l,m,n,o=d(c.Parent.Parent.utility.moveable),d(c.Parent.Parent.utility.
locale),1,12,10,14,12,0.88,0.55 function f.new(p,q)q=if typeof(q)=='table'then q else{}local r,s=q.spacing or q.Spacing,
q.text or q.Text local t=setmetatable({tab=assert(p,'Missing argument #1 (Tab expected)'),window=p.window,text=if s~=nil
then tostring(s)else'',spacing=if type(r)=='number'then math.max(r,0)else j,line=q.line~=false and q.Line~=false},f)t.
main=t.window:Create('Frame',{Size=UDim2.new(1,-40,0,0),BorderSizePixel=0,Name='Divider',BackgroundTransparency=1,Parent
=t.tab.tabPage})t.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,k),
SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,Parent=t.main})if t.line then t.left=t:_buildHalf(1)end if t.text~=''then t:_buildLabel()end
t:_applyHeight()return t end function f._buildHalf(p,q)local r=p.window:Create('Frame',{Size=UDim2.new(0,0,0,i),
BorderSizePixel=0,LayoutOrder=q,BackgroundTransparency=1,Parent=p.main},{BackgroundColor3='ContentColor'})p.window:
Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=r})return r end function f._buildLabel(p)p.title=p.window:
Create('TextLabel',{Text=h.t(p.text),Size=UDim2.fromOffset(0,l),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,
BackgroundTransparency=1,TextSize=m,TextXAlignment=Enum.TextXAlignment.Center,LayoutOrder=2,TextTransparency=1,Parent=p.
main},{TextColor3='ContentColor',FontFace='Font'})if p.line then p.right=p:_buildHalf(3)end end function f._applyHeight(
p)local q=if p.text~=''then l elseif p.line then i else 0 p.main.Size=UDim2.new(1,-40,0,p.spacing*2+q)end function f.Set
(p,q)p.text=if q~=nil then tostring(q)else''if p.text~=''and not p.title then p:_buildLabel()if not p.window.hidden then
p:_setShown(true,true)end end if p.title then p.window:_bindLocale(p.title,'Text',p.text)local r=p.text~=''p.title.
Visible=r if p.right then p.right.Visible=r end end p:_applyHeight()end function f._setShown(p,q,r)local s,t=p.window,if
q then n else 1 s:_reveal(p.left,{BackgroundTransparency=t},r)s:_reveal(p.right,{BackgroundTransparency=t},r)s:_reveal(p
.title,{TextTransparency=if q then o else 1},r)end g(f)return f end)()end,[11]=function()local b,c,d=a(11)local e return
(function(...)local f={}f.__index=f f.__type='Drag'local g=c.Parent.Parent.utility local h,i,j=d(g.variables),d(g.
pointer),d(g.constants)function f.new(k,l)l=if typeof(l)=='table'then l else{}local m=setmetatable({window=assert(k,
'Missing argument #1 (Window expected)')},f)m.drag=m.window:Create('Frame',{BackgroundTransparency=1,Size=UDim2.
fromOffset(150,20),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,m.window.size.Y.Offset*m.window.scale/2
+15),ZIndex=j.zIndex.drag,Visible=false,Parent=m.window.screenGui})m.dragCosmetic=m.window:Create('Frame',{
BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.3),ZIndex=j
.zIndex.drag,BackgroundTransparency=1,Size=UDim2.fromOffset(0,4),Parent=m.drag})m.window:Create('UICorner',{CornerRadius
=UDim.new(0,20),Parent=m.dragCosmetic})m.window:CreateGlow(m.dragCosmetic,Color3.fromRGB(255,255,255),10,0.5)m.
dragInteract=m.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),TextTransparency=1,ZIndex=
j.zIndex.drag,Parent=m.drag})local n,o,p,q,r=false,Vector2.zero,(m.window.screenGui)if p and p.IgnoreGuiInset then o=h.
guiService:GetGuiInset()end local function s()local t,u,v=if h.userInputService then i.location(r)else Vector2.new(0,0),
q or Vector2.new(0,0),o or Vector2.new(0,0)return t+u+v end local function t()local u=s()local v,w=u.X,u.Y v,w=m.window:
_fitCenter(v,w,m.window.main.AbsoluteSize)local x,y=UDim2.fromOffset(v,w),UDim2.fromOffset(v,w+(m.window.main.Size.Y.
Offset*m.window.scale/2+15))return x,y end m.window:Connect(m.drag.MouseEnter,function()if not n and not m.window.hidden
then h.tweenService:Create(m.dragCosmetic,TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
BackgroundTransparency=0.5,Size=UDim2.new(0,120,0,4)}):Play()end end)m.window:Connect(m.drag.MouseLeave,function()if not
n and not m.window.hidden then h.tweenService:Create(m.dragCosmetic,TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.
EasingDirection.Out),{BackgroundTransparency=0.7,Size=UDim2.new(0,100,0,4)}):Play()end end)local function u()if not n
then return end n=false if not m.window:_interactive()then return end h.tweenService:Create(m.dragCosmetic,TweenInfo.
new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,100,0,4),BackgroundTransparency=0.7}):Play()
local v,w,x=TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),t()h.tweenService:Create(m.window.main,v,
{Position=w}):Play()h.tweenService:Create(m.drag,v,{Position=x}):Play()end m.window:Connect(m.dragInteract.InputBegan,
function(v,w)if w then return end local x=v.UserInputType.Name if x=='MouseButton1'or x=='Touch'then if not m.window:
_interactive()then return end n=true r=v if p and p.IgnoreGuiInset then o=h.guiService:GetGuiInset()end q=m.window.main.
AbsolutePosition+m.window.main.AbsoluteSize*m.window.main.AnchorPoint-i.location(v)if not m.window.hidden then h.
tweenService:Create(m.dragCosmetic,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,
110,0,4),BackgroundTransparency=0}):Play()end end end)m.window:Connect(h.userInputService.InputEnded,function(v)local w=
v.UserInputType.Name if w=='MouseButton1'or w=='Touch'then u()end end)m.window:Connect(h.userInputService.
WindowFocusReleased,u)local v,w=1e-7,1e-60 m.window:Connect(h.runService.RenderStepped,function(x)if not n then return
end if not m.window:_interactive()then u()return end local y,z=t()m.window.main.Position=m.window.main.Position:Lerp(y,1
-v^x)m.drag.Position=m.drag.Position:Lerp(z,1-w^x)end)return m end return f end)()end,[12]=function()local b,c,d=a(12)
local e return(function(...)local f={}f.__index=f f.__type='Dropdown'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n
,o=d(g.variables),d(g.functions),d(g.image),d(g.constants),d(g.locale),d(g.HapticEngine),d(g.windowSizing),d(g.lockable)
local p,q,r,s,t,u,v,w,x,y,z,A,B,C=k.icons.chevron,k.icons.check,k.icons.dot,k.icons.search,UDim.new(0,12),UDim.new(0,7),
30,38,38,5,2,6,7,6 local D,E,F,G,H,I,J=B+C,4,22,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),0.4,TweenInfo.new(0.35,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out)local function K(L)local M,N={},{}for O,P in L do if typeof(P)=='string'and not M[P]then M[P]=
true table.insert(N,P)end end return N end local function L(M,N)if M==nil then return{}end if typeof(M)=='string'then
return{M}end if typeof(M)=='table'then local O=K(M)if not N and#O>1 then return{O[1]}end return O end return{}end
local function M(N,O)local P={}for Q,R in N do if table.find(O,R)then table.insert(P,R)end end return P end
local function N(O,P)if#O~=#P then return false end for Q,R in O do if not table.find(P,R)then return false end end
return true end function f.new(O,P)P=if typeof(P)=='table'then P else{}local Q,R=P.options or P.Options or{},P.
multiSelect or P.MultiSelect or P.MultipleOptions or false local S=setmetatable({tab=assert(O,
'Missing argument #1 (Tab expected)'),window=O.window,name=P.name or P.Name or'Dropdown',icon=d(c.Parent.Parent.utility.
image).iconFrom(P),description=P.description or P.Description,forgetState=P.forgetState or P.ForgetState or O.
forgetState,flag=P.flag or P.Flag or(not(P.forgetState or P.ForgetState or O.forgetState)and i.deriveFlagFromName(P.name
or P.Name or'Dropdown')or nil),callback=P.callback or P.Callback or function()end,options=K(Q),multiSelect=R,
placeholderText=l.resolve(P.placeholder or P.Placeholder or'None'),value=L(P.value or P.Value or P.currentOption or P.
CurrentOption,R),_isOpen=false,_optionFrames={}},f)S.rowHeight=S.window:_richHeight(S,41)S._desiredValue=S.value S.value
=M(S.value,S.options)S.window:_registerControl(S)S.main=S.window:Create('Frame',{Size=UDim2.new(1,-20,0,S.rowHeight),
BorderSizePixel=0,Name=S.name,BackgroundTransparency=1,Parent=S.tab.tabPage})S.top=S.window:Create('Frame',{Size=UDim2.
new(1,0,0,S.rowHeight),Position=UDim2.fromScale(0,0),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,ZIndex=1,Parent=S.main},{BackgroundTransparency='ElementTransparency'})S.stroke=S.window:
StyleElementBody(S.top)S.hoverOverlay=S.window:CreateHoverOverlay(S.top)S.flashTarget=S.top S.container=S.window:Create(
'Frame',{BorderSizePixel=0,Parent=S.top,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.
new(0,0.5),BackgroundTransparency=1,ZIndex=5})S.containerLayout=S.window:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,Parent=S.container})if S.icon then S.iconLabel=S.window:Create('ImageLabel',{Image=S.icon,Size=
UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,ZIndex=5,Parent=S.container},{
ImageColor3='ContentColor'})end S.title=S.window:Create('TextLabel',{Text=l.t(S.name),Size=UDim2.fromOffset(150,16),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,ZIndex=5,Parent=S.container},{TextColor3=
'ContentColor',FontFace='Font'})S.selectedLabel=S.window:Create('TextLabel',{AnchorPoint=Vector2.new(1,0.5),Position=
UDim2.new(1,-41,0.5,0),Size=UDim2.fromOffset(168,15),BorderSizePixel=0,BackgroundTransparency=1,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Right,TextWrapped=true,TextTransparency=1,ZIndex=5,Parent=S.top},{TextColor3=
'ContentColor',FontFace='Font'})S.chevron=S.window:Create('ImageLabel',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.
new(1,-18,0.5,0),Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,Image='rbxassetid://'..
tostring(p),Rotation=180,ImageTransparency=1,ZIndex=5,Parent=S.top},{ImageColor3='ContentColor'})S.interact=S.window:
Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,S.rowHeight),Position=UDim2.fromScale(0,0),
BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=10,AutoButtonColor=false,Parent=S.main})S.panel=S.window:Create(
'Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,0,1,0),Size=UDim2.new(1,0,1,-(S.rowHeight+A)),BorderSizePixel
=0,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=1,BackgroundTransparency=1,Parent=S.main})S
.panelStroke=S.window:StyleElementPanel(S.panel)S.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum
.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center
,SortOrder=Enum.SortOrder.LayoutOrder,Parent=S.panel})S.window:Create('UIPadding',{PaddingTop=UDim.new(0,B),
PaddingBottom=UDim.new(0,C),Parent=S.panel})S:_buildSearch()S:_buildActions()S.list=S.window:Create('ScrollingFrame',{
Active=true,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=true,AutomaticCanvasSize
=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(),ScrollBarImageColor3=Color3.fromRGB(240,240,240),ScrollBarThickness=3,
ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=3,ZIndex=1,Parent=S.panel})S.
window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=S.list})S.window:ConnectFor(S,S.list:
GetPropertyChangedSignal'CanvasPosition',function()S:_syncScrollHint()end)S.window:ConnectFor(S,S.list:
GetPropertyChangedSignal'AbsoluteCanvasSize',function()S:_syncScrollHint()end)S.window:ConnectFor(S,S.list:
GetPropertyChangedSignal'AbsoluteWindowSize',function()S:_syncScrollHint()end)S.listLayout=S.window:Create(
'UIListLayout',{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.
Center,Parent=S.list})S.window:Create('UIPadding',{PaddingTop=UDim.new(0,z),PaddingBottom=UDim.new(0,z),Parent=S.list})S
.emptyLabel=S.window:Create('TextLabel',{Name='Empty',Size=UDim2.new(1,-12,0,x),BackgroundTransparency=1,Text=l.t
'No matches',TextSize=14,TextTransparency=0.55,Visible=false,LayoutOrder=1,Parent=S.list},{TextColor3='ContentColor',
FontFace='Font'})local function T(U)return table.find(S.value,U)~=nil end local function U(V,W)local X=T(V.name)local Y,
Z,_,aa=if S._isOpen then(X and 0.9 or 0.95)else 1,if S._isOpen then(X and 0 or 0.3)else 1,if S._isOpen then(X and 0 or
0.7)else 1,if S._isOpen then(X and 0.85 or 0.93)else 1 j.assign(V.checkIcon,'Image',if X then q else r)if W then local
ab=TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)h.tweenService:Create(V.frame,ab,{
BackgroundTransparency=Y}):Play()h.tweenService:Create(V.title,ab,{TextTransparency=Z}):Play()h.tweenService:Create(V.
checkIcon,ab,{ImageTransparency=_}):Play()h.tweenService:Create(V.stroke,ab,{Transparency=aa}):Play()else V.frame.
BackgroundTransparency=Y V.title.TextTransparency=Z V.checkIcon.ImageTransparency=_ V.stroke.Transparency=aa end end
local function aa()if S.multiSelect then local ab=#S.value if ab==0 then S.selectedLabel.Text=S.placeholderText elseif
ab==1 then S.selectedLabel.Text=S.value[1]else S.selectedLabel.Text=l.resolve'Various'end else S.selectedLabel.Text=S.
value[1]or S.placeholderText end end S._renderOptionState=U S._updateSelectedLabel=aa local function ab(V)local W=S.
window:Create('Frame',{Size=UDim2.new(1,-12,0,x),BorderSizePixel=0,LayoutOrder=#S._optionFrames+1,BackgroundTransparency
=1,Parent=S.list},{BackgroundColor3='DropdownHighlight'})local X,Y,Z,_=S.window:Create('UICorner',{CornerRadius=u,Parent
=W}),S.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=W}),S.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=50,Parent=W}),S.
window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,14,0.5,0),Size=UDim2.fromOffset(170,16),
BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,Parent=W})S.window:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.
LayoutOrder,Parent=_})local ac,ad=S.window:Create('ImageLabel',{Image='rbxassetid://'..tostring(q),Size=UDim2.
fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,ZIndex=5,Parent=_},{ImageColor3=
'ContentColor'}),S.window:Create('TextLabel',{Text=V,Size=UDim2.fromOffset(170,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,ZIndex=5,Parent=_},{TextColor3='ContentColor',FontFace='Font'})local ae={name=V,frame=W,interact=Z,
title=ad,checkIcon=ac,container=_,stroke=Y,corner=X,connections={}}table.insert(ae.connections,S.window:ConnectFor(S,W.
MouseEnter,function()if not S._isOpen or not S.window:_interactive()then return end if T(ae.name)then return end h.
tweenService:Create(W,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=0.9}):
Play()h.tweenService:Create(ad,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=0.15
}):Play()end))table.insert(ae.connections,S.window:ConnectFor(S,W.MouseLeave,function()if not S._isOpen then return end
if T(ae.name)then return end h.tweenService:Create(W,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{BackgroundTransparency=0.95}):Play()h.tweenService:Create(ad,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{TextTransparency=0.3}):Play()end))table.insert(ae.connections,S.window:ConnectFor(S,Z.
MouseButton1Click,function()if not S._isOpen then return end m.click()local af=T(ae.name)if not S.multiSelect then if af
then S:_close()return end table.clear(S.value)table.insert(S.value,ae.name)else if af then local ag=table.find(S.value,
ae.name)if ag then table.remove(S.value,ag)end else table.insert(S.value,ae.name)end end S._desiredValue=table.clone(S.
value)for ag,ah in S._optionFrames do U(ah,true)end aa()S.window:_runGuarded(S,S.callback,S:_callbackValue())S.window:
_persist(S)if not S.multiSelect then task.wait(0.1)S:_close()end end))return ae end S._buildOption=ab for ac,ad in S.
options do local ae=ab(ad)table.insert(S._optionFrames,ae)end aa()S:_updateCorners()S.window:ConnectFor(S,S.interact.
MouseButton1Click,function()m.click()if S._isOpen then S:_close()else S:_open()end end)S.window:ConnectFor(S,S.main.
MouseEnter,function()if S._isOpen or not S.window:_interactive()then return end h.tweenService:Create(S.title,H,{
TextColor3=S.window.theme.ElementTextHoverColor}):Play()h.tweenService:Create(S.hoverOverlay,H,{BackgroundTransparency=
0.97}):Play()h.tweenService:Create(S.stroke,H,{Transparency=S.window.theme.ElementStrokeHoverTransparency,Color=S.
tintStrokeHover or S.window.theme.ElementStrokeHover}):Play()end)S.window:ConnectFor(S,S.main.MouseLeave,function()h.
tweenService:Create(S.title,H,{TextColor3=S.window.theme.ContentColor}):Play()h.tweenService:Create(S.hoverOverlay,H,{
BackgroundTransparency=1}):Play()h.tweenService:Create(S.stroke,H,{Transparency=S.window.theme.ElementStrokeTransparency
,Color=S.tintStroke or S.window.theme.ElementStroke}):Play()end)if S.description then S.descriptor=d(c.Parent.descriptor
).new(S.tab,{description=S.description})end S.window:_decorate(S,P,160)return S end function f._callbackValue(aa)if aa.
multiSelect then return table.clone(aa.value)end return aa.value[1]end function f._buildSearch(aa)aa._searchOpen=false
aa.searchbar=aa.window:Create('Frame',{Name='Search',Size=UDim2.new(1,-12,0,v),BorderSizePixel=0,BackgroundColor3=Color3
.fromRGB(255,255,255),BackgroundTransparency=1,LayoutOrder=1,ClipsDescendants=false,ZIndex=1,Parent=aa.panel})aa.window:
Create('UICorner',{CornerRadius=UDim.new(0,12),Parent=aa.searchbar})aa.searchStroke=aa.window:Create('UIStroke',{Color=
Color3.fromRGB(255,255,255),Transparency=1,Parent=aa.searchbar})aa.searchShadow=aa.window:CreateGlow(aa.searchbar,Color3
.fromRGB(255,255,255),20,1)aa.searchToggle=aa.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(
1,1),Text='',TextTransparency=1,ZIndex=51,Parent=aa.searchbar})aa.searchInput=aa.window:Create('TextBox',{Text='',
PlaceholderText=l.t'Search...',Size=UDim2.new(1,-58,0,16),Position=UDim2.new(0,44,0.5,0),AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,TextEditable=false,
Interactable=false,ZIndex=52,TextTransparency=1,Parent=aa.searchbar},{TextColor3='ContentColor',FontFace='Font',
PlaceholderColor3='PlaceholderColor'})aa.searchIcon=aa.window:Create('ImageButton',{Image='rbxassetid://'..tostring(s),
Size=UDim2.fromOffset(20,20),Position=UDim2.new(0,24,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
ScaleType=Enum.ScaleType.Fit,AutoButtonColor=false,ZIndex=53,ImageTransparency=1,Parent=aa.searchbar},{ImageColor3=
'ContentColor'})aa.window:ConnectFor(aa,aa.searchToggle.MouseButton1Click,function()if not aa._searchOpen then aa:
_expandSearch()end end)aa.window:ConnectFor(aa,aa.searchIcon.MouseButton1Click,function()if aa._searchOpen then aa:
_collapseSearch()else aa:_expandSearch()end end)aa.window:ConnectFor(aa,aa.searchInput:GetPropertyChangedSignal'Text',
function()aa:_applyFilter(aa.searchInput.Text)end)aa.window:ConnectFor(aa,aa.searchInput.FocusLost,function()if aa.
searchInput.Text==''then aa:_collapseSearch()end end)end function f._expandSearch(aa)if aa._searchOpen then return end
aa._searchOpen=true aa.searchInput.TextEditable=true aa.searchInput.Interactable=true h.tweenService:Create(aa.searchbar
,J,{Size=UDim2.new(1,-12,0,w),BackgroundTransparency=0.92}):Play()h.tweenService:Create(aa.searchStroke,J,{Transparency=
0.86}):Play()h.tweenService:Create(aa.searchShadow,J,{Transparency=0.92}):Play()h.tweenService:Create(aa.searchInput,J,{
TextTransparency=0.3}):Play()aa:_resizeToOptions()aa.searchInput:CaptureFocus()end function f._collapseSearch(aa)if not
aa._searchOpen then return end aa._searchOpen=false aa.searchInput.TextEditable=false aa.searchInput.Interactable=false
aa.searchInput:ReleaseFocus()aa.searchInput.Text=''h.tweenService:Create(aa.searchbar,J,{Size=UDim2.new(1,-12,0,v),
BackgroundTransparency=1}):Play()h.tweenService:Create(aa.searchStroke,J,{Transparency=1}):Play()h.tweenService:Create(
aa.searchShadow,J,{Transparency=1}):Play()h.tweenService:Create(aa.searchInput,J,{TextTransparency=1}):Play()aa:
_resizeToOptions()end function f._applyFilter(aa,ab)ab=string.lower(ab or'')local ac=0 for ad,ae in aa._optionFrames do
local af=ab==''or string.find(string.lower(ae.name),ab,1,true)~=nil ae.frame.Visible=af if af then ac+=1 end end aa.
emptyLabel.Visible=ac==0 and ab~=''aa:_updateCorners()aa:_resizeToOptions()aa:_syncScrollHint()end function f.
_syncScrollHint(aa)local ab,ac,ad=aa.list.AbsoluteCanvasSize,aa.list.AbsoluteWindowSize,aa.list.CanvasPosition if not ab
or not ac or not ad then return end local ae=aa._isOpen and ac.Y>0 and ab.Y-(ad.Y*aa.window.scale+ac.Y)>1 h.tweenService
:Create(aa.list,G,{ScrollBarImageTransparency=if ae then I else 1}):Play()end function f._visibleOptions(aa):{string}
local ab={}for ac,ad in aa._optionFrames do if ad.frame.Visible then table.insert(ab,ad.name)end end return ab end
function f._buildActions(aa)if not aa.multiSelect then return end aa.actions=aa.window:Create('Frame',{Name='Actions',
Size=UDim2.new(1,-12,0,F),BackgroundTransparency=1,LayoutOrder=2,Parent=aa.panel})aa.window:Create('UIListLayout',{
Padding=UDim.new(0,12),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=aa.actions})local function ab(ac:string,ad:number,ae:()->())local af=aa.
window:Create('TextButton',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,F),BackgroundTransparency=1,Text=
l.t(ac),TextSize=13,TextTransparency=0.45,LayoutOrder=ad,Parent=aa.actions},{TextColor3='ContentColor',FontFace='Font'})
aa.window:ConnectFor(aa,af.MouseEnter,function()h.tweenService:Create(af,G,{TextTransparency=0.15}):Play()end)aa.window:
ConnectFor(aa,af.MouseLeave,function()h.tweenService:Create(af,G,{TextTransparency=0.45}):Play()end)aa.window:
ConnectFor(aa,af.MouseButton1Click,function()ae()aa:_afterBulkChange()end)return af end ab('Select all',1,function()
local ac=aa:_visibleOptions()for ad,ae in ac do if not table.find(aa.value,ae)then table.insert(aa.value,ae)end end end)
ab('Clear',2,function()local ac=aa:_visibleOptions()for ad=#aa.value,1,-1 do if table.find(ac,aa.value[ad])then table.
remove(aa.value,ad)end end end)end function f._afterBulkChange(aa)aa._desiredValue=table.clone(aa.value)for ab,ac in aa.
_optionFrames do aa._renderOptionState(ac,true)end aa:_updateSelectedLabel()aa:_updateCorners()aa.window:_runGuarded(aa,
aa.callback,aa:_callbackValue())aa.window:_persist(aa)m.click()end function f._resizeToOptions(aa)if not aa._isOpen then
return end h.tweenService:Create(aa.main,J,{Size=UDim2.new(1,-20,0,aa:_openHeight())}):Play()end function f.
_updateCorners(aa)local ab={}for ac,ad in aa._optionFrames do if ad.frame.Visible then table.insert(ab,ad)end end for ac
,ad in ab do local ae,af=if ac==1 then t else u,if ac==#ab then t else u ad.corner.TopLeftRadius=ae ad.corner.
TopRightRadius=ae ad.corner.BottomLeftRadius=af ad.corner.BottomRightRadius=af end end local function aa(ab:number):
number return ab*x+math.max(0,ab-1)*y+z*2 end local function ab(ac:number):number return math.max(math.floor((ac-z*2+y)/
(x+y)),1)end function f._pageHeight(ac):number local ad=ac.window.size return n.pageHeight(ad and ad.Y.Offset,ac.window.
layout.mode)end function f._openHeight(ac)local ad=0 for ae,af in ac._optionFrames do if af.frame.Visible then ad+=1 end
end local ae=if ac._searchOpen then w else v local af,ag=ac.rowHeight+A+D+ae+y+(if ac.actions then F+y else 0),ac:
_pageHeight()local ah=math.min(math.max(ad,1),E,ab(ag-af))return math.min(af+aa(ah),ag)end function f._open(ac)if ac.
_isOpen then return end ac._isOpen=true if ac._outsideClickConn then ac.window:Disconnect(ac._outsideClickConn)end ac.
_outsideClickConn=ac.window:Connect(h.userInputService.InputBegan,function(ad)if ad.UserInputType~=Enum.UserInputType.
MouseButton1 and ad.UserInputType~=Enum.UserInputType.Touch then return end local ae,af,ag=ad.Position,ac.main.
AbsolutePosition,ac.main.AbsoluteSize if ae.X<af.X or ae.X>af.X+ag.X or ae.Y<af.Y or ae.Y>af.Y+ag.Y then ac:_close()end
end)h.tweenService:Create(ac.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.
new(1,-20,0,ac:_openHeight())}):Play()h.tweenService:Create(ac.chevron,TweenInfo.new(0.7,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),{Rotation=0}):Play()h.tweenService:Create(ac.panel,TweenInfo.new(0.4,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),{BackgroundTransparency=ac.window.theme.ElementTransparency or 0}):Play()h.tweenService:
Create(ac.panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=ac.window.theme.
ElementStrokeTransparency}):Play()h.tweenService:Create(ac.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.5}):Play()for ad,ae in ac._optionFrames do ac._renderOptionState(ae,true)end
ac:_syncScrollHint()ac:_bringIntoView()end function f._bringIntoView(ac)local ad=ac.tab and ac.tab.tabPage if not ad
then return end local ae,af,ag,ah=ad.AbsoluteWindowSize,ad.CanvasPosition,ad.AbsolutePosition,ac.main.AbsolutePosition
if not ae or not af or not ag or not ah or ae.Y<=0 then return end local O=ac.window.scale local P=(ah.Y-ag.Y)/O+af.Y
local Q=P+ac:_openHeight()local R=Q-(af.Y+ae.Y/O)if R<=0 then return end local S=math.min(af.Y+R+8,P)h.tweenService:
Create(ad,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{CanvasPosition=Vector2.new(af.X,S)}):Play(
)end function f._close(ac)if not ac._isOpen then return end ac._isOpen=false if ac._outsideClickConn then ac.window:
Disconnect(ac._outsideClickConn)ac._outsideClickConn=nil end ac:_collapseSearch()ac:_syncScrollHint()h.tweenService:
Create(ac.chevron,TweenInfo.new(0.7,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Rotation=180}):Play()h.
tweenService:Create(ac.panel,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=
1}):Play()h.tweenService:Create(ac.panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
Transparency=1}):Play()h.tweenService:Create(ac.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection
.Out),{ImageTransparency=1}):Play()for ad,ae in ac._optionFrames do ac._renderOptionState(ae,true)end h.tweenService:
Create(ac.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-20,0,ac.
rowHeight)}):Play()end function f._destroyOption(ac,ad)if ad.connections then for ae,af in ad.connections do local ag=
table.find(ac.connections,af)if ag then table.remove(ac.connections,ag)end ac.window:Disconnect(af)end ad.connections=
nil end ac.window:DestroySubtree(ad.frame)end function f._deriveSelection(ac)local ad=ac.value ac.value=M(ac.
_desiredValue or ac.value,ac.options)return not N(ac.value,ad)end function f._reindexOptions(ac)for ad,ae in ac.
_optionFrames do ae.frame.LayoutOrder=ad end end function f._rebindOption(ac,ad,ae,af)ad.name=ae ad.title.Text=ae ad.
frame.LayoutOrder=af end function f._destroyOptionsFrom(ac,ad)local ae,af={},{}for ag=#ac._optionFrames,ad,-1 do local
ah=ac._optionFrames[ag]table.insert(ae,ah.frame)if ah.connections then table.move(ah.connections,1,#ah.connections,#af+1
,af)ah.connections=nil end ac._optionFrames[ag]=nil end ac.window:DisconnectMany(ac,af)ac.window:DestroySubtrees(ae)end
function f.Refresh(ac,ad)ac.options=K(ad or{})local ae,af,ag=ac:_deriveSelection(),#ac._optionFrames,#ac.options for ah=
1,math.min(af,ag)do ac:_rebindOption(ac._optionFrames[ah],ac.options[ah],ah)end for ah=af+1,ag do local O=ac.
_buildOption(ac.options[ah])O.frame.LayoutOrder=ah table.insert(ac._optionFrames,O)end if ag<af then ac:
_destroyOptionsFrom(ag+1)end for ah,O in ac._optionFrames do ac._renderOptionState(O,false)end ac._updateSelectedLabel()
ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else'')if ae then ac.window:_runGuarded(ac,ac.callback,ac:
_callbackValue())ac.window:_persist(ac)end end function f.Add(ac,ad)if typeof(ad)~='string'or ad==''then return end if
table.find(ac.options,ad)then return end table.insert(ac.options,ad)local ae=ac._buildOption(ad)table.insert(ac.
_optionFrames,ae)local af=ac:_deriveSelection()if ac._isOpen then ac._renderOptionState(ae,true)end ac:_applyFilter(if
ac._searchOpen then ac.searchInput.Text else'')if af then ac._updateSelectedLabel()ac.window:_runGuarded(ac,ac.callback,
ac:_callbackValue())ac.window:_persist(ac)end end function f.Remove(ac,ad)local ae=table.find(ac.options,ad)if not ae
then return end table.remove(ac.options,ae)for af,ag in ac._optionFrames do if ag.name==ad then ac:_destroyOption(ag)
table.remove(ac._optionFrames,af)ac:_reindexOptions()break end end if ac._desiredValue then local af=table.find(ac.
_desiredValue,ad)if af then table.remove(ac._desiredValue,af)end end local af=table.find(ac.value,ad)if af then table.
remove(ac.value,af)ac._updateSelectedLabel()ac.window:_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(
ac)end ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else'')end function f.Set(ac,ad,ae)local af=L(ad,ac.
multiSelect)ac._desiredValue=af ac.value=M(af,ac.options)for ag,ah in ac._optionFrames do ac._renderOptionState(ah,true)
end ac._updateSelectedLabel()if not ae then ac.window:_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(
ac)end end function f._setRichHeight(ac,ad)ac.top.Size=UDim2.new(1,0,0,ad)ac.interact.Size=UDim2.new(1,0,0,ad)ac.panel.
Size=UDim2.new(1,0,1,-(ad+A))if not ac._isOpen then ac.main.Size=UDim2.new(1,-20,0,ad)end end function f._setShown(ac,ad
,ae)local af=ac.window af:_reveal(ac.stroke,{Transparency=if ad then af.theme.ElementStrokeTransparency else 1},ae)af:
_reveal(ac.title,{TextTransparency=if ad then 0 else 1},ae)af:_reveal(ac.top,{BackgroundTransparency=if ad then(af.theme
.ElementTransparency or 0)else 1},ae)if ac.iconLabel then af:_reveal(ac.iconLabel,{ImageTransparency=if ad then 0 else 1
},ae)end if ac.descriptor then af:_reveal(ac.descriptor.titleLabel,{TextTransparency=if ad then 0.7 else 1},ae)end if ac
.richDescription then af:_reveal(ac.richDescription,{TextTransparency=if ad then 0.45 else 1},ae)end af:_reveal(ac.
selectedLabel,{TextTransparency=if ad then 0.5 else 1},ae)af:_reveal(ac.chevron,{ImageTransparency=if ad then 0.5 else 1
},ae)if not ad and ac._isOpen then ac:_close()end end function f.MoveTo(ac,ad)ac.tab:_moveElement(ac,ad)end function f.
MoveToTop(ac)ac.tab:_moveElement(ac,1)end function f.MoveToBottom(ac)ac.tab:_moveElement(ac,#ac.tab.elements)end
function f.MoveUp(ac)local ad=table.find(ac.tab.elements,ac)if ad then ac.tab:_moveElement(ac,ad-1)end end function f.
MoveDown(ac)local ad=table.find(ac.tab.elements,ac)if ad then ac.tab:_moveElement(ac,ad+1)end end o(f)return f end)()end
,[13]=function()local aa,ab,ac=a(13)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Gallery'local af=ab
.Parent.Parent.utility local ag,ah,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q=ac(af.moveable),ac(af.locale),ac(af.variables),ac(af.
HapticEngine),ac(af.constants),ac(af.image),8,36,0.92,0.15,38,34,30,0.45,TweenInfo.new(0.18,Enum.EasingStyle.Quint),
TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),TweenInfo.new(0.12,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function r(s,t)local u=
Instance.new(s)for v,w in t do if v~='Parent'then u[v]=w end end u.Parent=t.Parent return u end local function s(t)
return string.lower(tostring(t or''))end function ae.new(t,u)u=if typeof(u)=='table'then u else{}local v=setmetatable({
tab=assert(t,'Missing argument #1 (Tab expected)'),window=t.window,name=tostring(u.name or u.Name or'Gallery'),text=
tostring(u.text or u.Text or'{count} items'),placeholder=tostring(u.placeholder or u.Placeholder or'Search...'),tileSize
=tonumber(u.tileSize or u.TileSize)or 96,pageSize=tonumber(u.pageSize or u.PageSize)or 48,callback=u.callback or u.
Callback,filterGroups=u.filterGroups or u.FilterGroups,fixedFilters=u.filters or u.Filters,items={},matches={},
shownCount=0,query='',picks={},groups={},pills={},tiles={},shown=false},ae)v.main=v.window:Create('Frame',{Size=UDim2.
new(1,-20,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,Name='Gallery',BackgroundTransparency=1,Parent=v.tab
.tabPage})v.window:Create('UIListLayout',{Padding=UDim.new(0,10),SortOrder=Enum.SortOrder.LayoutOrder,Parent=v.main})v:
_buildSearch()v:_buildChips()v:_buildHeader()v:_buildGrid()v:SetItems(u.items or u.Items or{})return v end function ae.
_buildSearch(t)t.field=t.window:Create('Frame',{Name='Search',Size=UDim2.new(1,0,0,j),BorderSizePixel=0,LayoutOrder=1,
BackgroundTransparency=1,Parent=t.main},{BackgroundColor3='FieldBackground'})t.window:Create('UICorner',{CornerRadius=
UDim.new(0,10),Parent=t.field})t.searchIcon=t.window:Create('ImageLabel',{Name='Icon',Image=d.icons.search,AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,14,0.5,0),Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=
1,ImageTransparency=1,Parent=t.field},{ImageColor3='ContentColor'})t.search=t.window:Create('TextBox',{Text='',
PlaceholderText=ah.t(t.placeholder),Size=UDim2.new(1,-54,1,0),Position=UDim2.fromOffset(40,0),BackgroundTransparency=1,
BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,
ClearTextOnFocus=false,TextTransparency=1,Parent=t.field},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3=
'PlaceholderColor'})t.window:ConnectFor(t,t.search:GetPropertyChangedSignal'Text',function()t.query=s(t.search.Text)t:
_applyFilter()end)end function ae._buildChips(t)t.chipRow=t.window:Create('Frame',{Name='Filters',Size=UDim2.new(1,0,0,k
),BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=2,Parent=t.main})t.window:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder,Parent=t.chipRow})t.optionPanel
=t.window:Create('Frame',{Name='Options',Size=UDim2.new(1,0,0,0),BorderSizePixel=0,BackgroundTransparency=1,
ClipsDescendants=true,Visible=false,LayoutOrder=3,Parent=t.main})t.optionLayout=t.window:Create('UIGridLayout',{
CellPadding=UDim2.fromOffset(6,6),CellSize=UDim2.new(0.3333333333333333,-4,0,l),SortOrder=Enum.SortOrder.LayoutOrder,
Parent=t.optionPanel})end function ae._buildHeader(t)local u=t.window:Create('Frame',{Name='Header',Size=UDim2.new(1,0,0
,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=4,Parent=t.main})t.window:
Create('UIListLayout',{Padding=UDim.new(0,2),SortOrder=Enum.SortOrder.LayoutOrder,Parent=u})t.title=t.window:Create(
'TextLabel',{Text=ah.t(t.name),Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,
BackgroundTransparency=1,TextSize=18,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,
TextTransparency=1,Parent=u},{TextColor3='TitlingColor',FontFace='TitleFont'})t.body=t.window:Create('TextLabel',{Text=
'',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,TextSize=14,
TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,TextTransparency=1,Parent=u},{TextColor3=
'ContentColor',FontFace='Font'})end function ae._buildGrid(t)t.grid=t.window:Create('Frame',{Name='Grid',Size=UDim2.new(
1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=5,Parent=t.main})t.
gridLayout=t.window:Create('UIGridLayout',{CellPadding=UDim2.fromOffset(f,f),CellSize=UDim2.fromOffset(t.tileSize,t.
tileSize+g),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=t.grid})
local function u()local v=t.grid.AbsoluteSize.X if v<=0 then return end local w=math.max(2,math.floor((v+f)/(t.tileSize+
f)))local x=math.floor((v-f*(w-1))/w)t.gridLayout.CellSize=UDim2.fromOffset(x,x+g)end t.window:ConnectFor(t,t.grid:
GetPropertyChangedSignal'AbsoluteSize',u)task.defer(u)t.more=t.window:Create('TextButton',{Name='ShowMore',Text=ah.t
'Show more',Size=UDim2.new(1,0,0,34),BorderSizePixel=0,AutoButtonColor=false,TextSize=14,Visible=false,LayoutOrder=6,
BackgroundTransparency=1,TextTransparency=1,Parent=t.main},{BackgroundColor3='FieldBackground',TextColor3='ContentColor'
,FontFace='Font'})t.window:Create('UICorner',{CornerRadius=UDim.new(0,10),Parent=t.more})t.window:ConnectFor(t,t.more.
MouseButton1Click,function()c.click()t:_showUpTo(t.shownCount+t.pageSize)end)end function ae._resolveGroups(t)local u={}
if t.filterGroups then for v,w in t.filterGroups do table.insert(u,{name=tostring(w.name or w.Name or w.key or'Filter'),
key=tostring(w.key or w.Key or'category'),options=w.options or w.Options})end else local v if t.fixedFilters then v={}
for w,x in t.fixedFilters do if x~='All'then table.insert(v,x)end end end table.insert(u,{name='Category',key='category'
,options=v})end for v,w in u do if not w.options then w.options={}local x={}for y,z in t.items do local A=z.values[w.key
]if A~=nil and not x[A]then x[A]=true table.insert(w.options,A)end end end local x=t.picks[w.key]or'All'if x~='All'and
not table.find(w.options,x)then x='All'end t.picks[w.key]=x end return u end function ae._rebuildChips(t)for u,v in t.
pills do v.button:Destroy()end table.clear(t.pills)t:_closeOptions(true)t.groups=t:_resolveGroups()local u=false for v,w
in t.groups do u=u or#w.options>0 end t.chipRow.Visible=u local v=t.window.theme for w,x in t.groups do if#x.options==0
then continue end local y=r('TextButton',{Name=x.name,Text='',Size=UDim2.new(0,0,1,0),BorderSizePixel=0,AutoButtonColor=
false,BackgroundColor3=v.FieldBackground,BackgroundTransparency=if t.shown then v.FieldTransparency else 1,LayoutOrder=w
,Parent=t.chipRow})r('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=y})r('UICorner',{CornerRadius=UDim.new(0,10),
Parent=y})local z,A=r('TextLabel',{Name='Label',Text='',Position=UDim2.fromOffset(12,0),Size=UDim2.new(1,-40,1,0),
BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,
TextColor3=v.ContentColor,FontFace=v.Font,TextTransparency=1,Parent=y}),r('ImageLabel',{Name='Chevron',AnchorPoint=
Vector2.new(1,0.5),Position=UDim2.new(1,-12,0.5,0),Size=UDim2.fromOffset(14,14),BackgroundTransparency=1,ImageColor3=v.
ContentColor,ImageTransparency=1,Parent=y})e.assign(A,'Image',d.icons.chevron)y.MouseButton1Click:Connect(function()c.
click()if t.openGroup==x then t:_closeOptions()else t:_openOptions(x)end end)table.insert(t.pills,{group=x,button=y,
label=z,chevron=A})end t:_paintChips(false)end function ae._paintChips(t,u)local v=t.window.theme for w,x in t.pills do
local y=t.picks[x.group.key]or'All'local z,A=y~='All',t.openGroup==x.group x.label.Text=ah.resolve(x.group.name)..': '..
ah.resolve(y)t.window:_reveal(x.button,{BackgroundTransparency=if not t.shown then 1 elseif A then v.FieldTransparency-
0.05 else v.FieldTransparency},u)t.window:_reveal(x.label,{TextTransparency=if not t.shown then 1 elseif z or A then 0
else 0.35},u)t.window:_reveal(x.chevron,{ImageTransparency=if t.shown then 0.4 else 1,Rotation=if A then 0 else 180},u)
end end local t,u,v=TweenInfo.new(0.32,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.2,Enum.
EasingStyle.Quint,Enum.EasingDirection.In),TweenInfo.new(0.22,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
local function w(x)for y,z in x:GetChildren()do if z.ClassName=='TextButton'then z:Destroy()end end end function ae.
_closeOptions(x,y)local z=x.openGroup~=nil x.openGroup=nil local A=x.optionPanel if not A then return end if z then x:
_paintChips(not y)end x._optionsToken=(x._optionsToken or 0)+1 if y or not A.Visible then w(A)A.Size=UDim2.new(1,0,0,0)A
.Visible=false return end local B=x._optionsToken b.tweenService:Create(A,u,{Size=UDim2.new(1,0,0,0)}):Play()task.delay(
u.Time,function()if x._optionsToken==B then w(A)A.Visible=false end end)end function ae._openOptions(x,y)x:
_closeOptions(true)x.openGroup=y local z,A,B=x.window.theme,x.picks[y.key]or'All',{'All'}for C,D in y.options do table.
insert(B,D)end for C,D in B do local E=D==A local F=r('TextButton',{Name=tostring(D),Text=ah.resolve(tostring(D)),
BorderSizePixel=0,AutoButtonColor=false,BackgroundColor3=if E then Color3.fromRGB(255,255,255)else z.FieldBackground,
BackgroundTransparency=1,TextColor3=if E then Color3.fromRGB(0,0,0)else z.ContentColor,TextTransparency=1,TextSize=13,
TextTruncate=Enum.TextTruncate.AtEnd,FontFace=z.Font,LayoutOrder=C,Parent=x.optionPanel})r('UICorner',{CornerRadius=UDim
.new(0,8),Parent=F})F.MouseButton1Click:Connect(function()c.click()x:SetFilter(D,y.key)end)task.delay((C-1)*0.02,
function()if F.Parent then b.tweenService:Create(F,v,{BackgroundTransparency=if E then 0 else z.FieldTransparency,
TextTransparency=if E then 0 else 0.2}):Play()end end)end local C=math.ceil(#B/3)local D=C*l+(C-1)*6 x.optionPanel.Size=
UDim2.new(1,0,0,0)x.optionPanel.Visible=true b.tweenService:Create(x.optionPanel,t,{Size=UDim2.new(1,0,0,D)}):Play()x:
_paintChips(true)end function ae._matches(x,y)for z,A in x.picks do if A~='All'and y.values[z]~=A then return false end
end if x.query==''then return true end return string.find(y.searchName,x.query,1,true)~=nil end function ae._applyFilter
(x)table.clear(x.matches)for y,z in x.items do if x:_matches(z)then table.insert(x.matches,z)end end x.body.Text=(string
.gsub(ah.resolve(x.text),'{count}',tostring(#x.matches)))for y,z in x.tiles do z.frame:Destroy()end table.clear(x.tiles)
x.shownCount=0 x:_showUpTo(x.pageSize)end function ae._showUpTo(x,y)y=math.min(y,#x.matches)for z=x.shownCount+1,y do
table.insert(x.tiles,x:_buildTile(x.matches[z],z))end x.shownCount=y x.more.Visible=y<#x.matches end function ae.
_buildTile(x,y,z)local A,B,C=x.window.theme,y.color,x.shown local D=r('TextButton',{Name=y.name,Text='',BorderSizePixel=
0,AutoButtonColor=false,BackgroundColor3=A.StatBackground,LayoutOrder=z,BackgroundTransparency=if C then 0 else 1,Parent
=x.grid})r('UICorner',{CornerRadius=UDim.new(0,10),Parent=D})local E,F,G=(r('UIStroke',{Color=Color3.fromRGB(255,255,255
),Thickness=1,ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=if C then h else 1,Parent=D}))if B then F=r(
'Frame',{Name='Glow',Size=UDim2.fromScale(1,1),BorderSizePixel=0,BackgroundColor3=B,BackgroundTransparency=if C then 0
else 1,Parent=D})r('UICorner',{CornerRadius=UDim.new(0,10),Parent=F})r('UIGradient',{Rotation=90,Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,1),NumberSequenceKeypoint.new(1,0.78)}
,Parent=F})G=r('Frame',{Name='HoverGlow',Size=UDim2.fromScale(1,1),BorderSizePixel=0,BackgroundColor3=B,
BackgroundTransparency=1,Parent=D})r('UICorner',{CornerRadius=UDim.new(0,10),Parent=G})r('UIGradient',{Rotation=90,
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.35,1),
NumberSequenceKeypoint.new(1,0.55)},Parent=G})end local H=r('ImageLabel',{Name='Image',Image=y.image or'',AnchorPoint=
Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,10),Size=UDim2.new(1,-24,1,-(g+14)),ScaleType=Enum.ScaleType.Fit,
BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=if C then 0 else 1,ZIndex=2,Parent=D})local I,J=r('UIScale'
,{Parent=H}),r('Frame',{Name='Flash',Size=UDim2.fromScale(1,1),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255
,255),BackgroundTransparency=1,ZIndex=4,Parent=D})r('UICorner',{CornerRadius=UDim.new(0,10),Parent=J})local K,L=(r(
'TextLabel',{Name='Label',Text=y.name,AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,if y.category then-22
else-10),Size=UDim2.new(1,-14,0,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=13,TextTruncate=Enum.
TextTruncate.AtEnd,TextColor3=A.TitlingColor,FontFace=A.TitleFont,TextTransparency=if C then 0 else 1,ZIndex=2,Parent=D}
))if y.category then L=r('TextLabel',{Name='Rarity',Text=y.category,AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(
0.5,0,1,-8),Size=UDim2.new(1,-14,0,13),BorderSizePixel=0,BackgroundTransparency=1,TextSize=11,TextTruncate=Enum.
TextTruncate.AtEnd,TextColor3=B or A.ContentColor,FontFace=A.Font,TextTransparency=if C then i else 1,ZIndex=2,Parent=D}
)end local M if y.tag then M=r('TextLabel',{Name='Tag',Text=y.tag,Position=UDim2.fromOffset(7,7),Size=UDim2.fromOffset(0
,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundColor3=y.tagColor or A.AccentColor,TextColor3=Color3
.fromRGB(255,255,255),TextSize=10,FontFace=A.TitleFont,BackgroundTransparency=if C then 0 else 1,TextTransparency=if C
then 0 else 1,ZIndex=3,Parent=D})r('UICorner',{CornerRadius=UDim.new(1,0),Parent=M})r('UIPadding',{PaddingLeft=UDim.new(
0,6),PaddingRight=UDim.new(0,6),Parent=M})end local N,O=b.tweenService,A.StatBackground local P,Q,R=O:Lerp(Color3.
fromRGB(255,255,255),0.05),B or Color3.fromRGB(255,255,255),false local function S(T)R=T N:Create(E,n,{Transparency=if T
then 0.35 else h,Color=if T then Q else Color3.fromRGB(255,255,255)}):Play()N:Create(D,n,{BackgroundColor3=if T then P
else O}):Play()if G then N:Create(G,n,{BackgroundTransparency=if T then 0 else 1}):Play()end end D.MouseEnter:Connect(
function()S(true)end)D.MouseLeave:Connect(function()S(false)end)D.MouseButton1Down:Connect(function()N:Create(E,p,{
Transparency=1}):Play()N:Create(I,p,{Scale=0.96}):Play()end)D.MouseButton1Up:Connect(function()N:Create(I,o,{Scale=1}):
Play()end)D.MouseButton1Click:Connect(function()c.click()N:Create(I,o,{Scale=1}):Play()J.BackgroundTransparency=0.9 N:
Create(J,q,{BackgroundTransparency=1}):Play()N:Create(E,q,{Color=if R then Q else Color3.fromRGB(255,255,255),
Transparency=if R then 0.35 else h}):Play()if type(x.callback)=='function'then task.spawn(x.callback,y.source)end end)
return{frame=D,stroke=E,glow=F,image=H,label=K,sub=L,tag=M}end function ae.SetItems(x,y)table.clear(x.items)local z={
category=true}for A,B in x.filterGroups or{}do z[tostring(B.key or B.Key or'category')]=true end for A,B in y do if
type(B)=='table'then local C,D,E=tostring(B.name or B.Name or''),B.category or B.Category,{}local F=s(C)for G in z do
local H=B[G]if H==nil then H=B[string.upper(string.sub(G,1,1))..string.sub(G,2)]end if H~=nil then E[G]=tostring(H)F..=
' '..s(H)end end table.insert(x.items,{source=B,name=C,values=E,searchName=F,image=e.thumbnail(B.thumbnail or B.
Thumbnail or B.image or B.Image),category=D,tag=B.tag or B.Tag,tagColor=B.tagColor or B.TagColor,color=B.color or B.
Color})end end x:_rebuildChips()x:_applyFilter()end function ae.SetFilter(x,y,z)z=z or(x.groups[1]and x.groups[1].key)or
'category'x.picks[z]=tostring(y)x:_closeOptions()x:_paintChips(true)x:_applyFilter()end function ae.SetSearch(x,y)x.
search.Text=tostring(y or'')end function ae._setShown(x,y,z)x.shown=y local A=x.window A:_reveal(x.title,{
TextTransparency=if y then 0 else 1},z)local B,C=A.theme,if y then 0 else 1 A:_reveal(x.field,{BackgroundTransparency=if
y then B.FieldTransparency else 1},z)A:_reveal(x.search,{TextTransparency=C},z)A:_reveal(x.searchIcon,{ImageTransparency
=if y then 0.5 else 1},z)A:_reveal(x.body,{TextTransparency=if y then m else 1},z)A:_reveal(x.more,{
BackgroundTransparency=if y then B.FieldTransparency else 1,TextTransparency=C},z)x:_paintChips(z)for D,E in x.tiles do
A:_reveal(E.frame,{BackgroundTransparency=C},z)A:_reveal(E.stroke,{Transparency=if y then h else 1},z)A:_reveal(E.glow,{
BackgroundTransparency=C},z)A:_reveal(E.image,{ImageTransparency=C},z)A:_reveal(E.label,{TextTransparency=C},z)A:
_reveal(E.sub,{TextTransparency=if y then i else 1},z)if E.tag then A:_reveal(E.tag,{BackgroundTransparency=C,
TextTransparency=C},z)end end end ag(ae)return ae end)()end,[14]=function()local aa,ab,ac=a(14)local ad return(function(
...)local ae={}ae.__index=ae ae.__type='Group'local af,ag,ah,b,c=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.
Parent.utility.log),ac(ab.Parent.Parent.utility.ordering),8,{button=true,toggle=true,stat=true,slider=true}function ae.
new(d,e)e=if typeof(e)=='table'then e else{}local f=string.lower(e.direction or e.Direction or'row')local g=f=='column'
or f=='vertical'local h=not g local i=if h then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical local j,k
=setmetatable({tab=assert(d,'Missing argument #1 (Tab expected)'),window=d.window,direction=i,compact=h,forgetState=d.
forgetState,elements={}},ae),d.direction==Enum.FillDirection.Horizontal j.main=j.window:Create('Frame',{Name='Group',
BackgroundTransparency=1,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=if h then UDim2.new(1,-20,0,0)else
UDim2.new(1,0,0,0),Parent=j.tab.tabPage})if k then j.main.Size=UDim2.new(0,0,0,0)j.window:Create('UIFlexItem',{FlexMode=
Enum.UIFlexMode.Fill,Parent=j.main})end j.tabPage=j.main j.layout=j.window:Create('UIListLayout',{FillDirection=i,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,b),VerticalAlignment=if h then Enum.VerticalAlignment.Center
else Enum.VerticalAlignment.Top,HorizontalAlignment=if h then Enum.HorizontalAlignment.Left else Enum.
HorizontalAlignment.Center,Parent=j.main})return j end function ae._add(d,e,f)if d.compact and not c[e]then ag.warn(`Rayfield: a row only holds compact elements (button/toggle/stat/slider), ignoring '{
e}'. Use a column for it.`)return nil end local g=ac(ab.Parent[e]).new(d,f)table.insert(d.elements,g)ah(g,#d.elements*10
)d.window:_restoreLate(g)if d.compact then d:_wrapChild(g)end d:_reflowRow()if not d.window.hidden then g:_setShown(true
,true)end return g end function ae._reflowRow(d)if d.direction~=Enum.FillDirection.Horizontal then return end local e=#d
.elements>0 for f,g in d.elements do if g.__type~='Group'then e=false break end end d.layout.Padding=if e then UDim.new(
0,-10)else UDim.new(0,b)end function ae._wrapChild(d,e)d.layout.Wraps=true d.layout.HorizontalFlex=Enum.UIFlexAlignment.
Fill e._widthManaged=true local f=if e._minWidth then e:_minWidth()else 0 if f>0 then e.main.AutomaticSize=Enum.
AutomaticSize.None e.main.Size=UDim2.new(0,f,e.main.Size.Y.Scale,e.main.Size.Y.Offset)end end function ae.CreateButton(d
,e)return d:_add('button',e)end function ae.CreateToggle(d,e)return d:_add('toggle',e)end function ae.CreateSwitch(d,e)
return d:_add('toggle',e)end function ae.CreateStat(d,e)return d:_add('stat',e)end function ae.CreateSlider(d,e)return d
:_add('slider',e)end function ae.CreateDropdown(d,e)return d:_add('dropdown',e)end function ae.CreateSection(d,e)return
d:_add('section',e)end function ae.CreateText(d,e)return d:_add('text',e)end function ae.CreateDivider(d,e)return d:
_add('divider',e)end function ae._addGroup(d,e)e=if typeof(e)=='table'then table.clone(e)else{}if d.direction==Enum.
FillDirection.Horizontal then d.layout.VerticalAlignment=Enum.VerticalAlignment.Top if d.tab.direction~=Enum.
FillDirection.Horizontal then d.main.Size=UDim2.new(1,0,0,0)end end local f=ae.new(d,e)table.insert(d.elements,f)f.main.
LayoutOrder=#d.elements*10 d:_reflowRow()return f end function ae.CreateGroup(d,e)return d:_addGroup(e)end function ae.
_moveElement(d,e,f)local g=table.find(d.elements,e)if not g then return end table.remove(d.elements,g)f=math.clamp(f,1,#
d.elements+1)table.insert(d.elements,f,e)for h,i in d.elements do ah(i,h*10)end end function ae._setShown(d,e,f)for g,h
in d.elements do h:_setShown(e,f)end end function ae._refreshTheme(d)for e,f in d.elements do if f._refreshTheme then f:
_refreshTheme()end end end af(ae)return ae end)()end,[15]=function()local aa,ab,ac=a(15)local ad return(function(...)
local ae={}ae.__index=ae ae.__type='Input'local af=ab.Parent.Parent.utility local ag,ah,b,c,d,e,f=ac(af.variables),ac(af
.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.constants),ac(af.HapticEngine)local g,h=e.pillResizeInfo
,TweenInfo.new(0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function i(j)local k,l=j:match
'^([%d%.%-]+)%^([%d%.%-]+)$'if k and l then local m,n=tonumber(k),tonumber(l)if m and n then return m^n end end return
tonumber(j)end function ae.new(j,k)k=if typeof(k)=='table'then k else{}local l=setmetatable({tab=assert(j,
'Missing argument #1 (Tab expected)'),window=j.window,name=k.name or k.Name or'Input',icon=ac(ab.Parent.Parent.utility.
image).iconFrom(k),description=k.description or k.Description,forgetState=k.forgetState or k.ForgetState or j.
forgetState,placeholder=k.placeholder or k.Placeholder or k.PlaceholderText or'',numeric=k.numeric or k.Numeric or false
,clearOnFocus=k.clearOnFocus or k.ClearOnFocus or false,callback=k.callback or k.Callback or function()end},ae)l.
rowHeight=l.window:_richHeight(l,41)l.value=tostring(k.value or k.Value or k.currentValue or k.CurrentValue or'')l.flag=
k.flag or k.Flag or(not l.forgetState and ah.deriveFlagFromName(l.name)or nil)l.window:_registerControl(l)l.main=l.
window:Create('Frame',{Size=UDim2.new(1,-20,0,l.rowHeight),BorderSizePixel=0,Name=l.name,BackgroundColor3=Color3.
fromRGB(255,255,255),BackgroundTransparency=1,Parent=l.tab.tabPage},{BackgroundTransparency='ElementTransparency'})l.
stroke=l.window:StyleElementBody(l.main)l.hoverOverlay=l.window:CreateHoverOverlay(l.main)l.container=l.window:Create(
'Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency
=1,BorderSizePixel=0,ZIndex=5,Parent=l.main})l.containerLayout=l.window:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=l.container})if l.
icon then l.iconLabel=l.window:Create('ImageLabel',{Image=l.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=l.container},{ImageColor3='ContentColor'})end l.title=l.
window:Create('TextLabel',{Text=d.t(l.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=l.container},{TextColor3='ContentColor',FontFace='Font'})l.box=l.window:Create('Frame',{
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0.5,0),Size=UDim2.fromOffset(85,30),BorderSizePixel=0,
BackgroundTransparency=1,Parent=l.main},{BackgroundColor3='FieldBackground'})l.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=l.box})l.boxStroke=l.window:Create('UIStroke',{Transparency=1,Parent=l.box},{Color='SurfaceStroke'}
)l.glow=l.window:CreateGlow(l.box,'FieldGlow',20,1)l._glowIdle=1 l.input=l.window:Create('TextBox',{Text=l.value,
PlaceholderText=d.t(l.placeholder),Size=UDim2.new(1,-15,0,15),Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(
0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=
Enum.TextTruncate.AtEnd,ClearTextOnFocus=l.clearOnFocus,TextTransparency=1,Parent=l.box},{TextColor3='ContentColor',
FontFace='Font',PlaceholderColor3='PlaceholderColor'})l.window:ConnectFor(l,l.input:GetPropertyChangedSignal'Text',
function()if l.numeric then local m=(l.input.Text:gsub('[^%d%.%-eE%^]',''))if m~=l.input.Text then l.input.Text=m return
end end l:_sizeBox(true)end)l.window:ConnectFor(l,l.input.Focused,function()ag.tweenService:Create(l.input,h,{
TextTransparency=0}):Play()end)l.window:ConnectFor(l,l.input.FocusLost,function()ag.tweenService:Create(l.input,h,{
TextTransparency=0.6}):Play()if l.clearOnFocus and l.input.Text==''and l.value~=''then l.input.Text=l.value return end
if l.input.Text==l.value then return end l:_commit(l.input.Text)end)l.window:_wireElementHover(l)if l.description then l
.descriptor=ac(ab.Parent.descriptor).new(l.tab,{description=l.description})end l:_sizeBox(false)l.window:_decorate(l,k,
150)return l end function ae._sizeBox(j,k)local l=j.input.Text~=''and j.input.Text or j.placeholder local m=math.clamp(
ah.textWidth(j.window.theme.Font,15,l)+30,70,220)if k then ag.tweenService:Create(j.box,g,{Size=UDim2.fromOffset(m,30)})
:Play()else j.box.Size=UDim2.fromOffset(m,30)end end function ae._commit(j,k,l)k=tostring(k)if j.numeric then local m=i(
k)if not m or m~=m or m==math.huge or m==-math.huge then if j.input.Text~=j.value then j.input.Text=j.value end return
end k=tostring(m)end local m=k~=j.value j.value=k if j.input.Text~=k then j.input.Text=k end if not l then j.window:
_runGuarded(j,j.callback,k)j.window:_persist(j)if m and not j.window._loading then f.click()j.window:_flashResult(j,true
)end end end function ae.Set(j,k,l)j:_commit(k,l)end function ae._setShown(j,k,l)local m=j.window if k then m:
_revealCommon(j,l)m:_reveal(j.box,{BackgroundTransparency=m.theme.FieldTransparency},l)m:_reveal(j.boxStroke,{
Transparency=0.85},l)m:_reveal(j.input,{TextTransparency=0.6},l)else m:_hideCommon(j,l)m:_reveal(j.box,{
BackgroundTransparency=1},l)m:_reveal(j.boxStroke,{Transparency=1},l)m:_reveal(j.input,{TextTransparency=1},l)end end
function ae._refreshTheme(j)ag.tweenService:Create(j.box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{BackgroundTransparency=j.window.theme.FieldTransparency}):Play()end b(ae)c(ae)return ae end)()end,[16]=function()
local aa,ab,ac=a(16)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Keybind'local af=ab.Parent.Parent.
utility local ag,ah,b,c,d,e,f,g,h=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.
constants),ac(af.HapticEngine),ac(af.enums),ac(af.log)local i,j,k=e.pillResizeInfo,TweenInfo.new(0.25,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out),{[Enum.UserInputType.MouseButton1]='MB1',[Enum.UserInputType.MouseButton2]='MB2',[Enum.
UserInputType.MouseButton3]='MB3'}local function l(m)if typeof(m)~='EnumItem'or m==Enum.KeyCode.Unknown then return
'None'end return k[m]or m.Name end local function m(n)if typeof(n)=='EnumItem'then return n end if type(n)=='string'then
local o,p=pcall(function()return Enum.KeyCode[n]end)if o and p then return p end local q,r=pcall(function()return Enum.
UserInputType[n]end)if q and r and k[r]then return r end end return Enum.KeyCode.Unknown end function ae.new(n,o)o=if
typeof(o)=='table'then o else{}local p=setmetatable({tab=assert(n,'Missing argument #1 (Tab expected)'),window=n.window,
name=o.name or o.Name or'Keybind',icon=ac(ab.Parent.Parent.utility.image).iconFrom(o),description=o.description or o.
Description,forgetState=o.forgetState or o.ForgetState or n.forgetState,isMenuToggle=o.isMenuToggle or o.IsMenuToggle or
false,callback=o.callback or o.Callback or function()end,onChanged=o.onChanged or o.OnChanged or function()end,hold=o.
hold or o.Hold or o.HoldToInteract or false,holdThreshold=o.holdThreshold or o.HoldThreshold or 0.2,recording=false},ae)
p.rowHeight=p.window:_richHeight(p,41)p.value=m(o.value or o.Value or o.default or o.Default or o.currentKeybind or o.
CurrentKeybind)p.flag=o.flag or o.Flag or(not p.forgetState and ah.deriveFlagFromName(p.name)or nil)p.window:
_registerControl(p)p.main=p.window:Create('Frame',{Size=UDim2.new(1,-20,0,p.rowHeight),BorderSizePixel=0,Name=p.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=p.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})p.stroke=p.window:StyleElementBody(p.main)p.hoverOverlay=p.window:CreateHoverOverlay(p.main)p.
container=p.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,
0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=p.main})p.containerLayout=p.window:Create('UIListLayout'
,{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
Parent=p.container})if p.icon then p.iconLabel=p.window:Create('ImageLabel',{Image=p.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=p.container},{ImageColor3='ContentColor'}
)end p.title=p.window:Create('TextLabel',{Text=d.t(p.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=p.container},{TextColor3='ContentColor',FontFace='Font'})p.box=p.window
:Create('TextButton',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0.5,0),Size=UDim2.fromOffset(40,30),
AutoButtonColor=false,Text='',BorderSizePixel=0,BackgroundTransparency=1,Parent=p.main},{BackgroundColor3=
'FieldBackground'})p.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=p.box})p.boxStroke=p.window:Create(
'UIStroke',{Transparency=1,Parent=p.box},{Color='SurfaceStroke'})p.glow=p.window:CreateGlow(p.box,'FieldGlow',20,1)p.
_glowIdle=0.9 p.keyLabel=p.window:Create('TextLabel',{Text=l(p.value),Size=UDim2.fromScale(1,1),BackgroundTransparency=1
,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=2,TextTransparency=1,Parent=p.box},{
TextColor3='ContentColor',FontFace='Font'})p.window:ConnectFor(p,p.box.MouseButton1Click,function()f.click()if p.
recording then p:_stopRecording()else p:_startRecording()end end)p.window:ConnectFor(p,ag.userInputService.InputBegan,
function(q,r)if r then return end if p.recording then p:_capture(q)return end if p.window._recordingKeybind then return
end if p:_matches(q)then if p.hold then p:_beginHold(q)else p.window:_runGuarded(p,p.callback,p.value)end end end)p.
window:_wireElementHover(p)if p.description then p.descriptor=ac(ab.Parent.descriptor).new(p.tab,{description=p.
description})end p:_sizeBox(false)p.window:_decorate(p,o,110)return p end function ae._sizeBox(n,o)local p=math.clamp(ah
.textWidth(n.window.theme.Font,15,n.keyLabel.Text)+28,40,200)if o then ag.tweenService:Create(n.box,i,{Size=UDim2.
fromOffset(p,30)}):Play()else n.box.Size=UDim2.fromOffset(p,30)end end function ae._startRecording(n)local o=n.window.
_recordingKeybind if o and o~=n then o:_stopRecording()end n.recording=true n.window._recordingKeybind=n n.keyLabel.Text
=d.resolve'Recording'n:_sizeBox(true)ag.tweenService:Create(n.glow,j,{Transparency=0.7}):Play()ag.tweenService:Create(n.
keyLabel,j,{TextTransparency=0}):Play()end function ae._stopRecording(n)n.recording=false if n.window._recordingKeybind
==n then local o=n.window task.defer(function()if o._recordingKeybind==n then o._recordingKeybind=nil end end)end n.
keyLabel.Text=l(n.value)n:_sizeBox(true)ag.tweenService:Create(n.glow,j,{Transparency=0.9}):Play()ag.tweenService:
Create(n.keyLabel,j,{TextTransparency=0.6}):Play()end function ae._capture(n,o)local p if o.UserInputType==Enum.
UserInputType.Keyboard then if o.KeyCode==Enum.KeyCode.Escape then n:_stopRecording()return end if o.KeyCode==Enum.
KeyCode.Backspace then n:_bind(Enum.KeyCode.Unknown)return end p=o.KeyCode elseif o.UserInputType==Enum.UserInputType.
MouseButton2 or o.UserInputType==Enum.UserInputType.MouseButton3 then p=o.UserInputType end if not p then return end if
n.isMenuToggle then local q=n.window:_keybindUsing(p,n)if q then n.window:Notify{title=d.resolve'Keybind unavailable',
content=string.format(d.resolve'%s is bound to %s. Kept %s.',l(p),q.name,l(n.value))}n:_stopRecording()n.window:
_flashResult(n,false)return end elseif p==n.window.settings.toggleKeybind then n.window:Notify{title=d.resolve
'Keybind unavailable',content=string.format(d.resolve'%s is the menu toggle key. Kept %s.',l(p),l(n.value))}n:
_stopRecording()n.window:_flashResult(n,false)return end n:_bind(p)end function ae._bind(n,o)n.value=o n:_stopRecording(
)n.window:_runGuarded(n,n.onChanged,o)n.window:_persist(n)n.window:_flashResult(n,true)end function ae._matches(n,o)
local p=n.value if typeof(p)~='EnumItem'or p==Enum.KeyCode.Unknown then return false end if p.EnumType==Enum.KeyCode
then return o.KeyCode==p elseif p.EnumType==Enum.UserInputType then return o.UserInputType==p end return false end
function ae._beginHold(n,o)if n._holding or n._holdPress then return end local p={}n._holdPress=p local q,r=o.KeyCode,o.
UserInputType task.delay(n.holdThreshold,function()if n._holdPress~=p then return end n._holding=true n.window:
_runGuarded(n,n.callback,true)end)local s s=n.window:ConnectFor(n,ag.userInputService.InputEnded,function(t)local u=if q
~=Enum.KeyCode.Unknown then t.KeyCode==q else t.UserInputType==r if not u then return end if n.connections then local v=
table.find(n.connections,s)if v then table.remove(n.connections,v)end end n.window:Disconnect(s)if n._holdPress==p then
n._holdPress=nil end if n._holding then n._holding=false n.window:_runGuarded(n,n.callback,false)end end)end function ae
.Set(n,o,p)local q=m(o)if q~=Enum.KeyCode.Unknown then if n.isMenuToggle then local r=n.window:_keybindUsing(q,n)if r
then h.warn('Rayfield: '..l(q).." is bound to '"..tostring(r.name).."'; kept "..l(n.value))return end elseif q==n.window
.settings.toggleKeybind then h.warn('Rayfield: '..l(q)..' is the menu toggle key; kept '..l(n.value))return end end n.
value=q if n.recording then n:_stopRecording()else n.keyLabel.Text=l(n.value)n:_sizeBox(true)end if not p then n.window:
_runGuarded(n,n.onChanged,n.value)n.window:_persist(n)end end function ae._serialize(n)return{tostring(n.value.EnumType)
,n.value.Value}end function ae._deserialize(n,o)local p=tostring(o[1]):gsub('^Enum%.','')local q,r=pcall(function()
return Enum[p]end)if not q or not r then return end local s=g.itemFromValue(r,o[2])if s then n:Set(s)end end function ae
._setShown(n,o,p)local q=n.window if o then q:_revealCommon(n,p)q:_reveal(n.box,{BackgroundTransparency=q.theme.
FieldTransparency},p)q:_reveal(n.boxStroke,{Transparency=0.85},p)q:_reveal(n.keyLabel,{TextTransparency=0.6},p)q:
_reveal(n.glow,{Transparency=0.9},p)else q:_hideCommon(n,p)q:_reveal(n.box,{BackgroundTransparency=1},p)q:_reveal(n.
boxStroke,{Transparency=1},p)q:_reveal(n.keyLabel,{TextTransparency=1},p)q:_reveal(n.glow,{Transparency=1},p)end end
function ae._refreshTheme(n)ag.tweenService:Create(n.box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{BackgroundTransparency=n.window.theme.FieldTransparency}):Play()end b(ae)c(ae)return ae end)()end,[17]=function()
local aa,ab,ac=a(17)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Notification'local af=ab.Parent.
Parent.utility local ag,ah,b,c,d,e,f,g,h,i,j,k,l=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.HapticEngine),
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.9,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),UDim2.new(0.5,360,0.5,0),UDim2.new(0.5,0,0.5,0),6,8 local function m(n)return math.clamp(#n*0.06+3,
3,9)end function ae.new(n,o)o=if typeof(o)=='table'then o else{}local p=setmetatable({window=assert(n,
'Missing argument #1 (Window expected)'),title=o.title or o.Title or'Notification',content=o.content or o.Content or'',
icon=o.icon or o.Icon,_hovered=false,_dismissed=false},ae)p.duration=o.duration or o.Duration or m(p.content)local q=p.
icon~=nil and p.icon~=0 and p.icon~=''p.main=p.window:Create('Frame',{Name='Notification',BackgroundTransparency=1,Size=
UDim2.new(1,0,0,0),BorderSizePixel=0,ZIndex=b.zIndex.notification,Parent=p.window.notifications})p.window:Create(
'UIPadding',{PaddingTop=UDim.new(0,l),Parent=p.main})p.body=p.window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255
,255,255),Size=UDim2.new(1,0,1,0),Position=i,AnchorPoint=Vector2.new(0.5,0.5),Active=true,BorderSizePixel=0,ZIndex=b.
zIndex.notification,BackgroundTransparency=1,Parent=p.main})p.window:Create('UIGradient',{Rotation=270,Offset=Vector2.
new(0,-0.1),Parent=p.body},{Color={'WindowColor',ah.toColorSequence}})p.window:Create('UICorner',{Parent=p.body},{
CornerRadius='CornerRoundness'})p.stroke=p.window:Create('UIStroke',{Transparency=1,Parent=p.body},{Color=
'SurfaceStroke'})p.shadow=p.window:CreateGlow(p.body,'ShadowColor',20,1)p.window:Create('UIPadding',{PaddingLeft=UDim.
new(0,20),PaddingRight=UDim.new(0,20),Parent=p.body})p.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,14),Parent=p.body})if q then p.iconLabel=p.window:Create('ImageLabel',{
Image=p.icon,Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=b.zIndex.
notification,ImageTransparency=1,Parent=p.body},{ImageColor3='ContentColor'})end p.container=p.window:Create('Frame',{
Size=UDim2.fromOffset(q and 222 or 260,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=2,ZIndex=b.zIndex.notification,Parent=p.body})p.window:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,4),Parent=p.container})p.titleLabel=p.
window:Create('TextLabel',{Text=p.title,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,TextSize=16,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=b.
zIndex.notification,TextTransparency=1,Parent=p.container},{TextColor3='ContentColor',FontFace='TitleFont'})if p.content
~=''then p.descriptionLabel=p.window:Create('TextLabel',{Text=p.content,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,BackgroundTransparency=1,TextSize=15,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=2,ZIndex=b.zIndex.notification,TextTransparency=1,Parent=p.container}
,{TextColor3='ContentColor',FontFace='Font'})end p.window._notificationCount=(p.window._notificationCount or 0)+1 p.main
.LayoutOrder=-p.window._notificationCount local r=p.window._liveNotifications if not r then r={}p.window.
_liveNotifications=r end table.insert(r,p)while#r>k do local s=table.remove(r,1)if s and s~=p then task.spawn(s._dismiss
,s)end end p._connections={p.window:Connect(p.body.MouseEnter,function()p._hovered=true end),p.window:Connect(p.body.
MouseLeave,function()p._hovered=false end),p.window:Connect(p.body.InputBegan,function(s)if s.UserInputType==Enum.
UserInputType.MouseButton1 or s.UserInputType==Enum.UserInputType.Touch then p:_dismiss()end end)}task.spawn(function()p
:_show()end)return p end function ae._measure(n)local o=n.iconLabel and 222 or 260 local p=ah.textHeight(n.window.theme.
TitleFont,16,n.title,o)if n.descriptionLabel then p=p+4+ah.textHeight(n.window.theme.Font,15,n.content,o)end return math
.max(p,n.iconLabel and 24 or 0)+28 end function ae._show(n)local o=n:_measure()+l if n._dismissed or not n.main.Parent
then return end c.notify()ag.tweenService:Create(n.main,d,{Size=UDim2.new(1,0,0,o)}):Play()ag.tweenService:Create(n.body
,g,{Position=j}):Play()ag.tweenService:Create(n.body,e,{BackgroundTransparency=0}):Play()ag.tweenService:Create(n.
titleLabel,f,{TextTransparency=0}):Play()ag.tweenService:Create(n.stroke,e,{Transparency=0.95}):Play()ag.tweenService:
Create(n.shadow,f,{Transparency=0.6}):Play()task.wait(0.05)if n._dismissed or not n.main.Parent then return end if n.
iconLabel then ag.tweenService:Create(n.iconLabel,f,{ImageTransparency=0}):Play()end task.wait(0.05)if n._dismissed or
not n.main.Parent then return end if n.descriptionLabel then ag.tweenService:Create(n.descriptionLabel,f,{
TextTransparency=0.35}):Play()end local p=0 while p<n.duration and not n._dismissed and n.main.Parent do local q=task.
wait()if not n._hovered then p+=q end end n:_dismiss()end function ae._dismiss(n)if n._dismissed then return end n.
_dismissed=true local o=n.window._liveNotifications local p=o and table.find(o,n)if o and p then table.remove(o,p)end if
not n.main.Parent then return end ag.tweenService:Create(n.body,e,{BackgroundTransparency=1}):Play()ag.tweenService:
Create(n.stroke,e,{Transparency=1}):Play()ag.tweenService:Create(n.shadow,f,{Transparency=1}):Play()ag.tweenService:
Create(n.titleLabel,f,{TextTransparency=1}):Play()if n.descriptionLabel then ag.tweenService:Create(n.descriptionLabel,f
,{TextTransparency=1}):Play()end if n.iconLabel then ag.tweenService:Create(n.iconLabel,f,{ImageTransparency=1}):Play()
end ag.tweenService:Create(n.body,h,{Size=UDim2.new(1,-90,1,0)}):Play()local q=ag.tweenService:Create(n.main,h,{Size=
UDim2.new(1,0,0,0)})q:Play()q.Completed:Wait()if not n.main.Parent then return end for r,s in n._connections do n.window
:Disconnect(s)end n.window:DestroySubtree(n.main)end return ae end)()end,[18]=function()local aa,ab,ac=a(18)local ad
return(function(...)local ae={}ae.__index=ae ae.__type='Popup'local af=ab.Parent.Parent.utility local ag,ah,b,c,d,e,f,g,
h,i,j,k,l,m,n,o=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.locale),ac(af.log),ac(af.HapticEngine),
TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.35,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),400,0.95,22,24,22,16 local p,q,r,s,t,u,v,w=j-l*2,18,14,15,16,12,
300,4 local x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M=p-w*2,16,13,20,10,15,14,8,10,40,8,UDim.new(1,0),16,0.5,{}local function N()
for O=#L,1,-1 do local P=L[O]if P._closed or not P.screenGui.Parent then table.remove(L,O)end end end local function O(P
)N()return L[#L]==P end function ae.new(P,Q)Q=if typeof(Q)=='table'then Q else{}local R=setmetatable({window=assert(P,
'Missing argument #1 (Window expected)'),title=Q.title or Q.Title or'Popup',subtitle=Q.subtitle or Q.Subtitle,content=Q.
content or Q.Content,icon=Q.icon or Q.Icon,boxes=Q.boxes or Q.Boxes,options=Q.options or Q.Options,dismissable=if Q.
dismissable~=nil then Q.dismissable elseif Q.Dismissable~=nil then Q.Dismissable else true,_reveal={},_connections={},
_closed=false},ae)if not R.options or#R.options==0 then R.options={{text='Okay'}}end R:_build()N()table.insert(L,R)task.
spawn(function()R:_show()end)return R end function ae._fade(P,Q,R,S)table.insert(P._reveal,{instance=Q,prop=R,to=S})
return Q end function ae._build(P)local Q,R=P.window,P.icon~=nil and P.icon~=0 and P.icon~=''P.screenGui=Q:Create(
'ScreenGui',{Name=ag.httpService:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=b.
displayOrder.popup,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=ag.guiContainer})P.backdrop=Q:Create('Frame',{Name=
'Backdrop',BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,Size=UDim2.fromScale(1,1),Active=true,
BackgroundTransparency=1,Parent=P.screenGui})P:_fade(P.backdrop,'BackgroundTransparency',K)P.card=Q:Create('Frame',{Name
='Card',BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,14),
Size=UDim2.fromOffset(j,0),AutomaticSize=Enum.AutomaticSize.Y,Active=true,BorderSizePixel=0,BackgroundTransparency=1,
Parent=P.screenGui})P:_fade(P.card,'BackgroundTransparency',0)Q:_scaleOverlay(P.card,k)Q:Create('UIGradient',{Rotation=
270,Offset=Vector2.new(0,-0.1),Parent=P.card},{Color={'WindowColor',ah.toColorSequence}})Q:Create('UICorner',{Parent=P.
card},{CornerRadius='CornerRoundness'})P.cardStroke=Q:Create('UIStroke',{Transparency=1,Parent=P.card},{Color=
'SurfaceStroke'})P:_fade(P.cardStroke,'Transparency',0.95)P.cardShadow=Q:CreateGlow(P.card,'ShadowColor',26,1)P:_fade(P.
cardShadow,'Transparency',0.55)Q:Create('UIPadding',{PaddingLeft=UDim.new(0,l),PaddingRight=UDim.new(0,l),PaddingTop=
UDim.new(0,m),PaddingBottom=UDim.new(0,n),Parent=P.card})Q:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,o),
Parent=P.card})local S=P:_measureHeader(R)P:_buildHeader(R,S)local T=P:_buildContent()P:_buildFooter()local U=2+(T>0 and
1 or 0)local V=m+S+T+G+n+o*(U-1)P.card.Size=UDim2.fromOffset(j,V)P.card.AutomaticSize=Enum.AutomaticSize.None if P.
dismissable then table.insert(P._connections,Q:Connect(P.backdrop.InputBegan,function(W)if W.UserInputType==Enum.
UserInputType.MouseButton1 or W.UserInputType==Enum.UserInputType.Touch then P:Close()end end))table.insert(P.
_connections,Q:Connect(ag.userInputService.InputBegan,function(W,X)if not X and W.KeyCode==Enum.KeyCode.Escape and O(P)
then if W==M then return end M=W P:Close()end end))end end function ae._buildHeader(P,Q,R)local S=P.window local T=S:
Create('Frame',{Name='Header',BackgroundTransparency=1,Size=UDim2.new(1,0,0,R),LayoutOrder=1,Parent=P.card})S:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,u),Parent=T})
if Q then P:_fade(S:Create('ImageLabel',{Image=P.icon,Size=UDim2.fromOffset(t,t),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=T},{ImageColor3='TitlingColor'}),'ImageTransparency',0)end
local U=S:Create('Frame',{Name='Text',BackgroundTransparency=1,Size=UDim2.new(1,Q and-(t+u)or 0,0,P._columnH),
LayoutOrder=2,Parent=T})S:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,3),Parent=U})P:_fade(S:Create('TextLabel',{Text=c.t(P.title),Size=UDim2.new(1,0,0,P.
_titleH),BackgroundTransparency=1,TextSize=q,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=U},{TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0)if P.subtitle and P.
subtitle~=''then P:_fade(S:Create('TextLabel',{Text=c.t(P.subtitle),Size=UDim2.new(1,0,0,P._subH),BackgroundTransparency
=1,TextSize=r,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=U},{
TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0.55)end end function ae._buildContent(P)if(not P.content
or P.content=='')and(not P.boxes or#P.boxes==0)then return 0 end local Q,R=P.window,if P.boxes and#P.boxes>0 then P:
_measureBoxes()else P:_measureText()local S=math.min(R,v)+w*2 local T=Q:Create('ScrollingFrame',{Name='Content',
BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,S),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=
Enum.AutomaticSize.Y,ScrollBarThickness=4,ScrollBarImageColor3=Color3.fromRGB(255,255,255),ScrollingDirection=Enum.
ScrollingDirection.Y,LayoutOrder=2,ScrollBarImageTransparency=1,Parent=P.card})P:_fade(T,'ScrollBarImageTransparency',
0.8)Q:Create('UIPadding',{PaddingLeft=UDim.new(0,w),PaddingRight=UDim.new(0,w),PaddingTop=UDim.new(0,w),PaddingBottom=
UDim.new(0,w),Parent=T})if P.boxes and#P.boxes>0 then Q:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical
,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,E),Parent=T
})for U,V in P.boxes do P:_buildBox(T,V,U)end else P:_fade(Q:Create('TextLabel',{Text=c.t(P.content),Size=UDim2.new(1,0,
0,R),BackgroundTransparency=1,TextSize=s,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,TextTransparency=1,Parent=T},{TextColor3='ContentColor',FontFace='Font'}),'TextTransparency',0.5)end
return S end function ae._buildBox(P,Q,R,S)local T=P.window R=if typeof(R)=='table'then R else{title=tostring(R)}local U
,V,W,X,Y=R.icon~=nil and R.icon~=0 and R.icon~='',P:_measureBox(R)local Z=T:Create('Frame',{Name='Box',BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,Size=UDim2.new(1,-F,0,V),LayoutOrder=S,BackgroundTransparency=1,Parent=Q})
P:_fade(Z,'BackgroundTransparency',0)local _=T:StyleElementPanel(Z)P:_fade(_,'Transparency',T.theme.
ElementStrokeTransparency)T:Create('UIPadding',{PaddingLeft=UDim.new(0,y),PaddingRight=UDim.new(0,y),PaddingTop=UDim.
new(0,z),PaddingBottom=UDim.new(0,z),Parent=Z})T:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,B),Parent=Z})if U then P:_fade(T:Create('ImageLabel',{Image=R.icon,Size=UDim2.
fromOffset(A,A),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=Z},{ImageColor3=
'ContentColor'}),'ImageTransparency',0)end local ai=T:Create('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,U and-(A
+B)or 0,0,Y),LayoutOrder=2,Parent=Z})T:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,3),Parent=ai})P:_fade(T:Create('TextLabel',{Text=c.t(R.title or R.Title or''),
Size=UDim2.new(1,0,0,W),BackgroundTransparency=1,TextSize=C,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,TextTransparency=1,Parent=ai},{TextColor3='ContentColor',FontFace='TitleFont'}),'TextTransparency',0)local
aj=R.description or R.Description if aj and aj~=''then P:_fade(T:Create('TextLabel',{Text=c.t(aj),Size=UDim2.new(1,0,0,X
),BackgroundTransparency=1,TextSize=D,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=ai},{TextColor3='ContentColor',FontFace='Font'}),
'TextTransparency',0.65)end end function ae._buildFooter(ai)local aj=ai.window local P=aj:Create('Frame',{Name='Footer',
BackgroundTransparency=1,Size=UDim2.new(1,0,0,G),LayoutOrder=3,Parent=ai.card})aj:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.
new(0,H),Parent=P})for Q,R in ai.options do ai:_buildButton(P,R,Q)end end function ae._buildButton(ai,aj,P,Q)local R=ai.
window P=if typeof(P)=='table'then P else{text=tostring(P)}local S,T,U,V,W,X,Y=P.style or P.Style or'neutral',P.text or
P.Text or P.name or P.Name or'Okay',P.callback or P.Callback if S=='primary'then V,W,X,Y=R.theme.AccentColor,R.theme.
AccentStroke,R.theme.AccentStroke,0.1 elseif S=='danger'then V,W,X,Y=R.theme.ErrorColor,R.theme.ErrorStrokeColor,R.theme
.ErrorStrokeColor,0 else V,W,X,Y=R.theme.NeutralButton,R.theme.NeutralButtonHover,R.theme.NeutralButtonStroke,0.85 end
local Z=R:Create('Frame',{Name='Button',BackgroundColor3=V,BorderSizePixel=0,Size=UDim2.new(0,0,0,G),LayoutOrder=Q,
BackgroundTransparency=1,Parent=aj})ai:_fade(Z,'BackgroundTransparency',0)R:Create('UIFlexItem',{FlexMode=Enum.
UIFlexMode.Fill,Parent=Z})R:Create('UICorner',{CornerRadius=I,Parent=Z})local _=R:Create('UIStroke',{Color=X,
Transparency=1,Parent=Z})ai:_fade(_,'Transparency',Y)ai:_fade(R:Create('TextLabel',{Text=c.t(T),Size=UDim2.fromScale(1,1
),BackgroundTransparency=1,TextSize=J,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,
TextColor3=ah.contrastText(V),TextTransparency=1,Parent=Z},{FontFace='Font'}),'TextTransparency',0)local ak,al=R:Create(
'TextButton',{Text='',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=2,Parent=Z}),TweenInfo
.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)table.insert(ai._connections,R:Connect(ak.MouseEnter,function(
)if ai._closed then return end ag.tweenService:Create(Z,al,{BackgroundColor3=W}):Play()end))table.insert(ai._connections
,R:Connect(ak.MouseLeave,function()ag.tweenService:Create(Z,al,{BackgroundColor3=V}):Play()end))table.insert(ai.
_connections,R:Connect(ak.MouseButton1Click,function()if ai._closed then return end e.click()ag.tweenService:Create(_,al
,{Transparency=1}):Play()if U then task.spawn(function()local am,an=pcall(U)if not am then d.warn(
"Rayfield: popup button '"..T.."' callback errored:")d.print(an)end end)end ai:Close()end))end function ae.
_measureHeader(ai,aj)local ak=p-(if aj then t+u else 0)ai._titleH=ah.textHeight(ai.window.theme.Font,q,c.resolve(ai.
title),ak)ai._subH=if ai.subtitle and ai.subtitle~=''then ah.textHeight(ai.window.theme.Font,r,c.resolve(ai.subtitle),ak
)else 0 ai._columnH=ai._titleH+(if ai._subH>0 then 3+ai._subH else 0)return math.max(ai._columnH,if aj then t else 0)end
function ae._measureText(ai)return ah.textHeight(ai.window.theme.Font,s,c.resolve(ai.content),x)end function ae.
_measureBox(ai,aj)aj=if typeof(aj)=='table'then aj else{title=tostring(aj)}local ak=aj.icon~=nil and aj.icon~=0 and aj.
icon~=''local al=x-F-y*2-(if ak then A+B else 0)local am,an,P=ah.textHeight(ai.window.theme.TitleFont,C,c.resolve(aj.
title or aj.Title or''),al),0,aj.description or aj.Description if P and P~=''then an=ah.textHeight(ai.window.theme.Font,
D,c.resolve(P),al)end local Q=am+(if an>0 then 3+an else 0)local R=math.max(Q,if ak then A else 0)+z*2 return R,am,an,Q
end function ae._measureBoxes(ai)local aj=0 for ak,al in ai.boxes do aj+=(ai:_measureBox(al))if ak<#ai.boxes then aj+=E
end end return aj end function ae._show(ai)if not ai.screenGui.Parent then return end e.notify()ag.tweenService:Create(
ai.card,f,{Position=UDim2.new(0.5,0,0.5,0)}):Play()for aj,ak in ai._reveal do local al=if ak.instance==ai.backdrop then
i else g ag.tweenService:Create(ak.instance,al,{[ak.prop]=ak.to}):Play()end end function ae.Close(ai)if ai._closed then
return end ai._closed=true local aj=table.find(L,ai)if aj then table.remove(L,aj)end for ak,al in ai._connections do ai.
window:Disconnect(al)end ai._connections={}if not ai.screenGui.Parent then return end ag.tweenService:Create(ai.card,h,{
Position=UDim2.new(0.5,0,0.5,10)}):Play()for ak,al in ai._reveal do ag.tweenService:Create(al.instance,h,{[al.prop]=1}):
Play()end task.delay(h.Time,function()ai.window:DestroySubtree(ai.screenGui)end)end return ae end)()end,[19]=function()
local aa,ab,ac=a(19)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Progress'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,al,am,an,b,c,d,e,f,g,h=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.locale),60,8
,20,6,6,16,14,0.4,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),NumberSequence.new{
NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},0.9 local i=TweenInfo.new(h,Enum.EasingStyle.Quint,
Enum.EasingDirection.InOut,-1,true)local function j(k:unknown):number?local l=tonumber(k)if l==nil or l~=l or math.abs(l
)==math.huge then return nil end return l end function ae.new(k,l)l=if typeof(l)=='table'then l else{}local m=j(l.steps
or l.Steps)m=if m and m>=2 then math.floor(m)else nil local n=l.range or l.Range local o,p=j(n and n[1])or 0,j(n and n[2
])or m or 1 if o>p then o,p=p,o end local q=setmetatable({tab=assert(k,'Missing argument #1 (Tab expected)'),window=k.
window,name=l.name or l.Name or'Progress',icon=ac(ab.Parent.Parent.utility.image).iconFrom(l),description=l.description
or l.Description,min=o,max=p,steps=m,value=0,text=l.text or l.Text,format=l.format or l.Format,showValue=if l.showValue
==nil then true else l.showValue==true,indeterminate=l.indeterminate or l.Indeterminate or false},ae)q.value=q:_clamp(j(
l.value or l.Value)or o)q:_build()if q.description then q.descriptor=ac(ab.Parent.descriptor).new(q.tab,{description=q.
description})end return q end function ae._clamp(k,l:number):number return math.clamp(j(l)or k.min,k.min,k.max)end
function ae._ratio(k):number local l=k.max-k.min if l<=0 then return 1 end return(k.value-k.min)/l end function ae.
_filledSteps(k):number local l=k.steps::number return math.clamp(math.round(k:_ratio()*l),0,l)end function ae._readout(k
):string if k.text then return aj.resolve(k.text)end if k.format then local l,m=pcall(k.format,k.value,k.min,k.max)if l
and type(m)=='string'then return m end end if k.steps then return string.format('%d/%d',k:_filledSteps(),k.steps)end
return string.format('%d%%',math.round(k:_ratio()*100))end function ae._build(k)k.main=k.window:Create('Frame',{Size=
UDim2.new(1,-20,0,ak),BorderSizePixel=0,Name=k.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=
1,Parent=k.tab.tabPage},{BackgroundTransparency='ElementTransparency'})k.stroke=k.window:StyleElementBody(k.main)k.
container=k.window:Create('Frame',{Size=UDim2.new(0,170,0,c),Position=UDim2.new(0,am,0,20),AnchorPoint=Vector2.new(0,0.5
),BackgroundTransparency=1,BorderSizePixel=0,Parent=k.main})k.window:Create('UIListLayout',{Padding=UDim.new(0,6),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=k.container})if k.icon then k.iconLabel=k.window:
Create('ImageLabel',{Image=k.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,
ImageTransparency=1,Parent=k.container},{ImageColor3='ContentColor'})end k.title=k.window:Create('TextLabel',{Text=aj.t(
k.name),Size=UDim2.fromOffset(250,c),BorderSizePixel=0,BackgroundTransparency=1,TextSize=c,AutomaticSize=Enum.
AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=k.
container},{TextColor3='ContentColor',FontFace='Font'})k.readout=k.window:Create('TextLabel',{Text=k:_readout(),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-am,0,20),Size=UDim2.fromOffset(50,d),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=d,TextXAlignment=Enum.TextXAlignment.Right,Visible=k
.showValue,TextTransparency=1,Parent=k.main},{TextColor3='ContentColor',FontFace='Font'})if k.steps then k:_buildSteps()
return end k.track=k.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-16),Size=UDim2.
new(1,-am*2,0,al),BorderSizePixel=0,BackgroundTransparency=1,Parent=k.main},{BackgroundColor3='SliderBackground'})k.
window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=k.track})k.fill=k.window:Create('Frame',{AnchorPoint=Vector2
.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(if k.indeterminate then 0 else k:_ratio(),1),
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=k.track})k.
window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=k.fill})k.window:Create('UIGradient',{Offset=Vector2.new(0,
0.5),Rotation=2,Transparency=g,Parent=k.fill},{Color={'SliderProgress',ah.toColorSequence}})k.fillGlow=k.window:
CreateGlow(k.fill,'AccentColor',20,1)if k.indeterminate then k:_startSweep()end end function ae._buildSteps(k)local l=k.
steps::number k.track=k.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-17),Size=UDim2
.new(1,-am*2,0,an),BackgroundTransparency=1,BorderSizePixel=0,Parent=k.main})k.window:Create('UIListLayout',{Padding=
UDim.new(0,b),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=k.track})k.stepFrames={}
for m=1,l do local n=k.window:Create('Frame',{Size=UDim2.new(1/l,-(b*(l-1))/l,1,0),BorderSizePixel=0,LayoutOrder=m,
BackgroundTransparency=1,Parent=k.track},{BackgroundColor3='SliderBackground'})k.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=n})local o=k.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,
255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=n})k.window:Create('UICorner',{CornerRadius=UDim.
new(1,0),Parent=o})k.window:Create('UIGradient',{Rotation=90,Parent=o},{Color={'SliderProgress',ah.toColorSequence}})
table.insert(k.stepFrames,{segment=n,fill=o})end end function ae._startSweep(k)if k._sweep or k.steps then return end k.
fill.AnchorPoint=Vector2.new(0,0.5)k.fill.Position=UDim2.fromScale(0,0.5)k.fill.Size=UDim2.fromScale(0,1)k._sweep=ag.
tweenService:Create(k.fill,i,{Size=UDim2.fromScale(1,1)})k._sweep:Play()end function ae._stopSweep(k)if not k._sweep
then return end k._sweep:Cancel()k._sweep=nil k.fill.AnchorPoint=Vector2.new(0,0.5)k.fill.Position=UDim2.fromScale(0,0.5
)end function ae._render(k,l:boolean?)k.readout.Text=k:_readout()if k.steps then if not k._shown then return end local m
=k:_filledSteps()for n,o in k.stepFrames do local p=if n<=m then 0 else 1 if l==false then o.fill.BackgroundTransparency
=p else ag.tweenService:Create(o.fill,f,{BackgroundTransparency=p}):Play()end end return end local m=UDim2.fromScale(k:
_ratio(),1)if l==false then k.fill.Size=m else ag.tweenService:Create(k.fill,f,{Size=m}):Play()end end function ae.Set(k
,l)k.value=k:_clamp(l)if k.indeterminate then k.indeterminate=false k:_stopSweep()end k:_render()end function ae.Get(k):
number return k.value end function ae.GetPercentage(k):number return k:_ratio()end function ae.SetRange(k,l,m)l=j(l)or k
.min m=j(m)or k.max if l>m then l,m=m,l end k.min,k.max=l,m k.value=k:_clamp(k.value)k:_render()end function ae.SetText(
k,l)k.text=l k.readout.Text=k:_readout()end function ae.SetIndeterminate(k,l)l=l==true if l==k.indeterminate then return
end k.indeterminate=l if l then k:_startSweep()else k:_stopSweep()k:_render(false)end end function ae._setShown(k,l,m)
local n=k.window k._shown=l n:_reveal(k.readout,{TextTransparency=if l then e else 1},m)if l then n:_revealCommon(k,m)
else n:_hideCommon(k,m)end if k.steps then local o=k:_filledSteps()for p,q in k.stepFrames do n:_reveal(q.segment,{
BackgroundTransparency=if l then 0 else 1},m)n:_reveal(q.fill,{BackgroundTransparency=if l and p<=o then 0 else 1},m)end
return end n:_reveal(k.track,{BackgroundTransparency=if l then 0 else 1},m)n:_reveal(k.fill,{BackgroundTransparency=if l
then 0 else 1},m)n:_reveal(k.fillGlow,{Transparency=if l then n.theme.AccentGlow else 1},m)end function ae.Remove(k)k:
_stopSweep()if k.descriptor then k.descriptor:Remove()end k.main:Destroy()end ai(ae)return ae end)()end,[20]=function()
local aa,ab,ac=a(20)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am=ac(ae.
variables),ac(ae.constants),ac(ae.locale),ac(ab.Parent.action),{},TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),0.6,0.2 local function an(b)if b.__type=='Group'then local c={}local function d(e)for f,g in e.
elements do if g.__type=='Group'then d(g)elseif g.name then table.insert(c,g.name)end end end d(b)return table.concat(c,
'\n')end return b.name or''end local function b(c)local d={}for e,f in c.tabs do if f.neglectSelector then continue end
for g,h in f.elements do if h.__type~='Section'then table.insert(d,h)end end end return d end local function c(d,e,f)af.
tweenService:Create(d.searchPill,f,{BackgroundTransparency=if e then 0.9 else 1}):Play()af.tweenService:Create(d.
searchStroke,f,{Transparency=if e then 0.85 else 1}):Play()af.tweenService:Create(d.searchShadow,f,{Transparency=if e
then 0.92 else 1}):Play()af.tweenService:Create(d.searchIcon,f,{ImageTransparency=if e then 0.65 else 1}):Play()af.
tweenService:Create(d.searchInput,f,{TextTransparency=if e then 0.2 else 1}):Play()end local function d(e,f,g)if e.
layout.mode=='sidebar'then return end for h,i in e.tabs do if not i.neglectSelector and i.topbarItem then i:
_applyVisual(if f then(if e.selectedTab==i then'selected'else'unselected')else'hidden',g)end end end local function e(f,
g)g=string.lower(g or'')local h=false for i,j in f._searchUnits do local k=g==''or string.find(j.text,g,1,true)~=nil j.
unit.main.Visible=k if j.unit.descriptor then j.unit.descriptor.main.Visible=k end h=h or k end f.searchEmpty.Visible=
not h and g~=''end local function f(g)g._searchUnits={}local h=0 for i,j in b(g)do h+=1 local k=j.main table.insert(g.
_searchUnits,{unit=j,text=string.lower(an(j)),homeParent=k.Parent,homeOrder=k.LayoutOrder,descOrder=j.descriptor and j.
descriptor.main.LayoutOrder})k.LayoutOrder=h*10 k.Parent=g.searchPage k.Visible=true if j.descriptor then j.descriptor.
main.LayoutOrder=h*10+1 j.descriptor.main.Parent=g.searchPage j.descriptor.main.Visible=true end end end local function
g(h)for i,j in h._searchUnits do local k=j.unit if k.main and k.main.Parent then k.main.LayoutOrder=j.homeOrder k.main.
Parent=j.homeParent k.main.Visible=true end if k.descriptor and k.descriptor.main and k.descriptor.main.Parent then k.
descriptor.main.LayoutOrder=j.descOrder k.descriptor.main.Parent=j.homeParent k.descriptor.main.Visible=true end end h.
_searchUnits={}end function aj.open(h)if h._searching or h.minimised or not h:_interactive()then return end h._searching
=true f(h)e(h,'')h:_jumpTo(h.searchPage)d(h,false,ak)task.delay(ak.Time,function()if h._searching and h.layout.mode~=
'sidebar'then h.tabList.Visible=false end end)h.searchPill.Visible=true c(h,true,ak)h.searchInput:CaptureFocus()af.
tweenService:Create(h.searchAction.iconLabel,ak,{ImageTransparency=am}):Play()end function aj.close(h,i)if not h.
_searching then return end i=i or{}h._searching=false h.searchInput.Text=''h.searchInput:ReleaseFocus()h.searchEmpty.
Visible=false g(h)local j=if i.jumpTo==nil then h.selectedTab and h.selectedTab.tabPage else i.jumpTo if j then h:
_jumpTo(j)end c(h,false,ak)task.delay(ak.Time,function()if not h._searching then h.searchPill.Visible=false end end)if i
.showTabs then h.tabList.Visible=true d(h,true,ak)end af.tweenService:Create(h.searchAction.iconLabel,ak,{
ImageTransparency=al}):Play()end function aj.toggle(h)if h._searching then aj.close(h,{showTabs=true})else aj.open(h)end
end function aj.railWidth(h,i)if h.searchPill then h.searchPill.Size=UDim2.new(1,-(i+30),0,35)end end function aj.build(
h)h._searching=false h.searchPage=h:Create('ScrollingFrame',{Name='Search',Size=UDim2.new(1,-20,1,0),Position=UDim2.new(
0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.
AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,
LayoutOrder=2000,Parent=h.elements})h:Create('UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.
Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum
.SortOrder.LayoutOrder,Parent=h.searchPage})h:Create('UIPadding',{PaddingTop=UDim.new(0,if h.layout.mode=='sidebar'then
53 else 10),PaddingBottom=UDim.new(0,33),Parent=h.searchPage})h.searchEmpty=h:Create('TextLabel',{Name='NoResults',Text=
ah.t'No results',FontFace=af.brandFont(Enum.FontWeight.Medium),TextSize=15,TextTransparency=0.6,BackgroundTransparency=1
,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.55,0),Size=UDim2.fromOffset(200,20),Visible=false,ZIndex=3,
Parent=h.main},{TextColor3='ContentColor',FontFace='Font'})local i=h.layout.mode=='sidebar'local j=if i then h.layout.
chromeHeight+8 else h.layout.tabStripTop+1 h.searchPill=h:Create('Frame',{Name='SearchBar',AnchorPoint=Vector2.new(if i
then 1 else 0.5,0),Position=UDim2.new(if i then 1 else 0.5,if i then-15 else 0,0,j),Size=UDim2.new(1,if i then-(h.layout
.railWidth+30)else-35,0,35),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=10,
BackgroundTransparency=1,Visible=false,Parent=h.main})h:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=h.
searchPill})h.searchStroke=h:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=1,Parent=h.
searchPill})h.searchShadow=h:Create('UIShadow',{BlurRadius=UDim.new(0,20),Color=Color3.fromRGB(255,255,255),ZIndex=-1,
Transparency=1,Parent=h.searchPill})h.searchIcon=h:Create('ImageLabel',{Image='rbxassetid://'..tostring(ag.icons.search)
,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,15,0.5,1),Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,
ZIndex=10,ImageTransparency=1,Parent=h.searchPill},{ImageColor3='ContentColor'})h.searchInput=h:Create('TextBox',{Text=
'',PlaceholderText=ah.t'Search all pages',AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(1
,-110,0,18),BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,
ClipsDescendants=true,ZIndex=10,TextTransparency=1,Parent=h.searchPill},{TextColor3='ContentColor',FontFace='Font',
PlaceholderColor3='PlaceholderColor'})h:Connect(h.searchInput:GetPropertyChangedSignal'Text',function()if h._searching
then e(h,h.searchInput.Text)end end)h.searchAction=ai.new(h,{name='Search',icon=ag.icons.search,order=4,callback=
function()aj.toggle(h)end})h.searchAction.isLit=function()return h._searching end end return aj end)()end,[21]=function(
)local aa,ab,ac=a(21)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Section'local af,ag=ac(ab.Parent.
Parent.utility.moveable),ac(ab.Parent.Parent.utility.locale)function ae.new(ah,ai)ai=if typeof(ai)=='table'then ai else{
}local aj=setmetatable({tab=assert(ah,'Missing argument #1 (Tab expected)'),window=ah.window,name=ai.name or ai.Name or
'Section',icon=ai.icon or ai.Icon},ae)local ak=if#aj.tab.elements==0 then 0 else 13 aj.main=aj.window:Create('Frame',{
Size=UDim2.new(1,-40,0,20+ak),BorderSizePixel=0,Name=aj.name,BackgroundTransparency=1,Parent=aj.tab.tabPage})if ak>0
then aj.window:Create('UIPadding',{PaddingTop=UDim.new(0,ak),Parent=aj.main})end aj.window:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment
=Enum.VerticalAlignment.Top,Parent=aj.main})if aj.icon then aj.iconLabel=aj.window:Create('ImageLabel',{Image=aj.icon,
Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=aj.main},{ImageColor3
='ContentColor'})end aj.title=aj.window:Create('TextLabel',{Text=ag.t(aj.name),Size=UDim2.fromOffset(0,16),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=15,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=aj.main},{TextColor3='ContentColor',
FontFace='Font'})return aj end function ae._setShown(ah,ai,aj)local ak=ah.window ak:_reveal(ah.title,{TextTransparency=
if ai then 0.6 else 1},aj)if ah.iconLabel then ak:_reveal(ah.iconLabel,{ImageTransparency=if ai then 0.65 else 1},aj)end
end af(ae)return ae end)()end,[22]=function()local aa,ab,ac=a(22)local ad return(function(...)local ae=ab.Parent.Parent.
utility local af,ag,ah,ai,aj,ak,al,am,an,b=ac(ae.variables),ac(ae.image),ac(ae.locale),ac(ab.Parent.tabSelector),ac(ab.
Parent.search),{},0,0.7,0.95,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function c(d)
return d.layout.mode=='sidebar'and d.profile~=nil and d.settings.showProfile and af.localPlayer~=nil end local function
d(e,f)local g=af.localPlayer if not g then return end e.profile=e:Create('Frame',{Name='Profile',AnchorPoint=Vector2.
new(0.5,1),Position=UDim2.fromScale(0.5,1),Size=UDim2.new(1,0,0,f.footerHeight),BackgroundTransparency=1,Parent=e.
sidebar})e.profileContainer=e:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,f.rowInset,0.5,0),Size
=UDim2.new(1,-f.rowInset,1,0),BackgroundTransparency=1,Parent=e.profile})e.profileLayout=e:Create('UIListLayout',{
Padding=UDim.new(0,10),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=e.profileContainer})e.
profileAvatar=e:Create('ImageLabel',{Name='Avatar',Image=ag.avatar(g.UserId,function(h)if e.profileAvatar and not e.
unloaded then ag.assign(e.profileAvatar,'Image',h)end end),Size=UDim2.fromOffset(f.avatarSize,f.avatarSize),
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=e.
profileContainer})e:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=e.profileAvatar})e.profileLabels=e:Create(
'Frame',{Size=UDim2.fromOffset(50,f.avatarSize),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,LayoutOrder=
1,Parent=e.profileContainer})e:Create('UIListLayout',{Padding=UDim.new(0,2),FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=e.profileLabels})e.profileName=e:Create('TextLabel',{Text=g.DisplayName,Size=UDim2.
fromOffset(50,16),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,TextTransparency=1,Parent=e.profileLabels},{TextColor3='TitlingColor',FontFace='Font'})e.
profileSubtitle=e:Create('TextLabel',{Text='',Size=UDim2.fromOffset(50,14),AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,Visible=false,
TextTransparency=1,Parent=e.profileLabels},{TextColor3='TitlingColor',FontFace='Font'})end function ak.build(e,f)e.
sidebar=e:Create('Frame',{Name='Sidebar',AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),Size=UDim2.new(0,f.
railWidth,1,-f.chromeHeight),BackgroundTransparency=1,Visible=false,Parent=e.main})e.tabList=e:Create('ScrollingFrame',{
Name='Tabs',Active=true,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,AutomaticCanvasSize=Enum.
AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollBarImageTransparency=1,ScrollingDirection=Enum.
ScrollingDirection.Y,ClipsDescendants=true,Parent=e.sidebar})e:Create('UIPadding',{PaddingTop=UDim.new(0,f.railPadding),
PaddingBottom=UDim.new(0,f.railPadding),Parent=e.tabList})e.tabListLayout=e:Create('UIListLayout',{Padding=UDim.new(0,f.
rowSpacing),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=
Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=e.tabList})d(e,f)ak.reflowProfile(e)end
function ak.reflowProfile(e)local f,g=e.layout,c(e)if e.profile then e.profile.Visible=g end e.tabList.Size=UDim2.new(1,
0,1,if g then-f.footerHeight else 0)end function ak.applyWidth(e,f)local g=e.layout e.sidebar.Size=UDim2.new(0,f,1,-g.
chromeHeight)e.elements.Size=UDim2.new(1,-f,1,-g.chromeHeight)e.bottomFade.Size=UDim2.new(1,-f,g.fadeSize.Y.Scale,g.
fadeSize.Y.Offset)aj.railWidth(e,f)local h=f<(g.railWidth::number)for i,j in e.tabs do if not j.neglectSelector then ai.
setRowCollapsed(j,h,g)end end if e.profileContainer then e.profileContainer.Position=UDim2.new(0,if h then 0 else g.
rowInset,0.5,0)e.profileContainer.Size=UDim2.new(1,if h then 0 else-g.rowInset,1,0)e.profileLayout.HorizontalAlignment=
if h then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left e.profileLabels.Visible=not h end end
function ak.setProfileShown(e,f,g)if not e.profile or not e.profile.Visible then return end local h={[e.profileAvatar]={
ImageTransparency=if f then 0 else 1,BackgroundTransparency=if f then an else 1},[e.profileName]={TextTransparency=if f
then al else 1},[e.profileSubtitle]={TextTransparency=if f then am else 1}}for i,j in h do if g then af.tweenService:
Create(i,g,j):Play()else for k,l in j do i[k]=l end end end end function ak.setProfileEnabled(e,f)if not e.profile then
e.settings.showProfile=f return end if f then e.settings.showProfile=true ak.reflowProfile(e)ak.setProfileShown(e,true,b
)return end ak.setProfileShown(e,false,b)task.delay(b.Time,function()if e.unloaded or e.settings.showProfile then return
end ak.reflowProfile(e)end)e.settings.showProfile=false end function ak.setSubtitle(e,f)if not e.profileSubtitle then
return end local g=if type(f)=='string'and f~=''then ah.resolve(f)else nil e.profileSubtitle.Text=g or''e.
profileSubtitle.Visible=g~=nil end return ak end)()end,[23]=function()local aa,ab,ac=a(23)local ad return(function(...)
local ae={}ae.__index=ae ae.__type='Slider'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,am,an=ac(af.
variables),ac(af.pointer),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.
HapticEngine)local function b(c)local d=0 while d<6 do local e=c*10^d if math.abs(e-math.round(e))<1e-9 then break end d
+=1 end return d end local function c(d,e,f)local g=d[1]+math.round((f-d[1])/e)*e return math.clamp(g,d[1],d[2])end
local d,e,f,g,h,i=TweenInfo.new(0.45,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),300
,Vector2.new(35,20),Vector2.new(41,22)local function j(k:number,l:number):UDim2 return UDim2.new(k,math.round(l*(1-k)),1
,0)end local function k():UDim2 return UDim2.new(1,0,0.5,0)end local function l(m:number,n:number,o:number):number
return math.clamp((m-n)/o,0,1)end function ae.new(m,n)n=if typeof(n)=='table'then n else{}local o=setmetatable({tab=
assert(m,'Missing argument #1 (Tab expected)'),window=m.window,name=n.name or n.Name or'Slider',icon=ac(ab.Parent.Parent
.utility.image).iconFrom(n),description=n.description or n.Description,forgetState=n.forgetState or n.ForgetState or m.
forgetState,range=n.range or n.Range or{0,100},increment=n.increment or n.Increment or 1,suffix=n.suffix or n.Suffix or
'',callback=n.callback or n.Callback or function()end,dragging=false,minimal=n.minimal or n.Minimal or false,
_handleWidth=h.X},ae)o.rowHeight=o.window:_richHeight(o,65)o.ownRichLayout=true o.richPadding=58 assert(typeof(o.range)
=='table'and typeof(o.range[1])=='number'and typeof(o.range[2])=='number',
'A slider range needs two numbers, like { 0, 100 }.')if o.range[1]>o.range[2]then o.range={o.range[2],o.range[1]}end if
o.increment<=0 then o.increment=1 end o.value=if(n.value or n.Value)~=nil then(n.value or n.Value)elseif(n.currentValue
or n.CurrentValue)~=nil then(n.currentValue or n.CurrentValue)else o.range[1]o.value=c(o.range,o.increment,o.value)o.
_decimals=b(o.increment)o.flag=n.flag or n.Flag or(not o.forgetState and ai.deriveFlagFromName(o.name)or nil)o.window:
_registerControl(o)o.main=o.window:Create('Frame',{Size=UDim2.new(1,-20,0,65),BorderSizePixel=0,Name=o.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=o.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})o.stroke=o.window:StyleElementBody(o.main)o._lastValue=o.value if not o.minimal then o:
_buildLabel()end o.track=o.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-15,0.5,0),Size=
UDim2.fromOffset(222,14),BorderSizePixel=0,BackgroundTransparency=1,Parent=o.main},{BackgroundColor3='SliderBackground'}
)o.window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=o.track})o.progress=o.window:Create('Frame',{AnchorPoint
=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=o.track})o.window:Create('UICorner',{CornerRadius=UDim.
new(0,13),Parent=o.progress})o.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},Parent=o.progress},{Color={
'SliderProgress',ai.toColorSequence}})o.progressGlow=o.window:CreateGlow(o.progress,'AccentColor',20,1)o.handle=o.window
:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=k(),Size=UDim2.fromOffset(h.X,h.Y),BorderSizePixel=0,ZIndex=50,
BackgroundTransparency=1,Parent=o.progress},{BackgroundColor3='SliderHandle'})o.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=o.handle})o.handleGlow=o.window:CreateGlow(o.handle,Color3.fromRGB(255,255,255),10,1)o.handleStroke
=o.window:Create('UIStroke',{Transparency=1,Parent=o.handle},{Color='SliderStroke'})o.interact=o.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=10,Parent=o.track})o.
window:ConnectFor(o,o.main.MouseEnter,function()if not o.window:_interactive()then return end ag.tweenService:Create(o.
track,d,{BackgroundColor3=o.window.theme.SliderBackgroundHover}):Play()end)o.window:ConnectFor(o,o.main.MouseLeave,
function()ag.tweenService:Create(o.track,d,{BackgroundColor3=o.window.theme.SliderBackground}):Play()end)o.window:
ConnectFor(o,o.interact.InputBegan,function(p)if p.UserInputType==Enum.UserInputType.MouseButton1 or p.UserInputType==
Enum.UserInputType.Touch then an.click()o._dragInput=p o.dragging=true o:_setHeld(true)o:_updateFromMouse()if o.
_dragConnection then o._dragConnection:Disconnect()o._dragConnection=nil end o._dragConnection=ag.runService.
RenderStepped:Connect(function()if o.window.unloaded or not o.dragging then if o._dragConnection then o._dragConnection:
Disconnect()o._dragConnection=nil end return end o:_updateFromMouse()end)end end)o.window:ConnectFor(o,ag.
userInputService.InputEnded,function(p)if p.UserInputType==Enum.UserInputType.MouseButton1 or p.UserInputType==Enum.
UserInputType.Touch then o:_endDrag()end end)o.window:ConnectFor(o,ag.userInputService.WindowFocusReleased,function()o:
_endDrag()end)if o.description and not o.minimal then o.descriptor=ac(ab.Parent.descriptor).new(o.tab,{description=o.
description})end o.window:ConnectFor(o,o.main:GetPropertyChangedSignal'AbsoluteSize',function()if o.window.animating or(
o.window.hidden and o.window.hasShownOnce)then return end o:_applyLayout()end)o:_applyLayout()if o.minimal then o.main.
Size=UDim2.new(1,-20,0,41)o.track.AnchorPoint=Vector2.new(0.5,0.5)o.track.Position=UDim2.new(0.5,0,0.5,0)o.track.Size=
UDim2.new(1,-30,0,14)end o:_renderProgress()o.window:_decorate(o,n,260)return o end function ae._applyRichLayout(m)local
n=20 if m.iconLabel then if not m.iconChip then local o=m.window:_richIconChip(m,m.main,UDim2.fromOffset(16,12),m.
container.ZIndex)o.AnchorPoint=Vector2.zero end n=72 end m.valueHost.Parent=m.titleContainer m.valueHost.LayoutOrder=2 m
.valueHost.AutomaticSize=Enum.AutomaticSize.X m.valueHost.Size=UDim2.new(0,0,0,16)m.titleShrink.FlexMode=Enum.UIFlexMode
.Fill m.titleContainer.Size=UDim2.new(1,0,0,18)m.container.AnchorPoint=Vector2.zero m.container.Position=UDim2.
fromOffset(n,14)m.container.Size=UDim2.new(1,-(n+20),0,0)m.container.AutomaticSize=Enum.AutomaticSize.Y m.
containerLayout.FillDirection=Enum.FillDirection.Vertical m.containerLayout.Padding=UDim.new(0,3)m.titleFlex.FlexMode=
Enum.UIFlexMode.None if m.richDescription then m.richDescription.LayoutOrder=1 end m.track.AnchorPoint=Vector2.new(0,1)m
.track.Position=UDim2.new(0,n-5,1,-14)m.track.Size=UDim2.new(1,-(n+10),0,14)end function ae._buildLabel(m)m.container=m.
window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,20,0.5,0),Size=UDim2.fromOffset(170,33),
BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=m.main})m.containerLayout=m.window:Create('UIListLayout',{
Padding=UDim.new(0,2),VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=m.
container})m.titleContainer=m.window:Create('Frame',{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0
,ZIndex=5,Parent=m.container})m.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=m.titleContainer}
)m.titleFlex=m.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.None,Parent=m.titleContainer})if m.icon then m.
iconLabel=m.window:Create('ImageLabel',{Image=m.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=m.titleContainer},{ImageColor3='ContentColor'})end m.title=
m.window:Create('TextLabel',{Text=am.t(m.name),Size=UDim2.new(1,0,0,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,RichText=true,LayoutOrder=1,
ZIndex=5,TextTransparency=1,Parent=m.titleContainer},{TextColor3='ContentColor',FontFace='Font'})m.titleShrink=m.window:
Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=m.title})m.valueHost=m.window:Create('Frame',{Size=UDim2.
new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=6,LayoutOrder=1,Parent=m.container})m.valueOdo=aj.new(m.
window,m.valueHost,{textSize=15,alignment=Enum.HorizontalAlignment.Left,transparency=1,duration=0.28})m.valueOdo:snap(m:
_format(m.value))end function ae._setMainHeight(m,n)if m._widthManaged then m.main.Size=UDim2.new(m.main.Size.X.Scale,m.
main.Size.X.Offset,0,n)else m.main.Size=UDim2.new(1,-20,0,n)end end function ae._setRichHeight(m,n)m:_setMainHeight(n)
end function ae._applyLayout(m,n)if m.minimal then return end local o=m.main.AbsoluteSize.X/m.window.scale local p=if o>
0 and o<g then'narrow'else'wide'if m._layoutMode==p and not n then return end m._layoutMode=p if m.rich then m:
_applyRichLayout()return end if p=='narrow'then m:_setMainHeight(70)m.container.AnchorPoint=Vector2.new(0,0)m.container.
Position=UDim2.new(0,20,0,14)m.container.Size=UDim2.new(1,-40,0,16)m.containerLayout.FillDirection=Enum.FillDirection.
Horizontal m.titleFlex.FlexMode=Enum.UIFlexMode.Fill m.valueHost.AutomaticSize=Enum.AutomaticSize.X m.valueHost.Size=
UDim2.new(0,0,0,16)m.track.AnchorPoint=Vector2.new(0.5,1)m.track.Position=UDim2.new(0.5,0,1,-14)m.track.Size=UDim2.new(1
,-30,0,14)else m:_setMainHeight(65)m.container.AnchorPoint=Vector2.new(0,0.5)m.container.Position=UDim2.new(0,20,0.5,0)m
.container.Size=UDim2.new(0,170,0,33)m.containerLayout.FillDirection=Enum.FillDirection.Vertical m.titleFlex.FlexMode=
Enum.UIFlexMode.None m.valueHost.AutomaticSize=Enum.AutomaticSize.None m.valueHost.Size=UDim2.new(1,0,0,16)m.track.
AnchorPoint=Vector2.new(1,0.5)m.track.Position=UDim2.new(1,-15,0.5,0)m.track.Size=UDim2.new(0,222,0,14)end end function
ae._format(m,n)local o=string.format('%.'..m._decimals..'f',n)if m.suffix~=''then return o..' '..m.suffix end return o
end function ae._pillTravel(m)return math.max(m.track.AbsoluteSize.X-m._handleWidth*m.window.scale,0)end function ae.
_renderProgress(m,n)local o=m.range[2]-m.range[1]local p=if o~=0 then math.clamp((m.value-m.range[1])/o,0,1)else 0 local
q=j(p,m._handleWidth)if n then ag.tweenService:Create(m.progress,n,{Size=q}):Play()else m.progress.Size=q end end
function ae._updateFromMouse(m)local n=m:_pillTravel()if n<=0 then return end local o=l(ah.location(m._dragInput).X,m.
track.AbsolutePosition.X+m._handleWidth*m.window.scale/2,n)local p=c(m.range,m.increment,m.range[1]+o*(m.range[2]-m.
range[1]))if p~=m.value then m.value=p if m.valueOdo then m.valueOdo:snap(m:_format(p))end m._lastValue=p m:
_renderProgress(f)m:_fireCallback(p)end end function ae._endDrag(m)if not m.dragging then return end m.dragging=false m:
_setHeld(false)if m._dragConnection then m._dragConnection:Disconnect()m._dragConnection=nil end m.window:_persist(m)end
function ae._setHeld(m,n)if not n then m:_fireCallback(m.value)end local o=if n then i else h m._handleWidth=o.X ag.
tweenService:Create(m.handle,e,{Size=UDim2.fromOffset(o.X,o.Y),BackgroundTransparency=if n then 0.7 else 0}):Play()ag.
tweenService:Create(m.handleStroke,e,{Transparency=if n then 0.6 else 1}):Play()m:_renderProgress(e)end function ae.
_fireCallback(m,n)m.window:_runGuarded(m,m.callback,n,m.dragging==true)end function ae.Set(m,n,o)n=c(m.range,m.increment
,n)m.value=n if m.valueOdo then m.valueOdo:to(m:_format(n),n>=(m._lastValue or n))end m._lastValue=n m:_renderProgress(d
)if not o then m:_fireCallback(n)m.window:_persist(m)end end local m=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum
.EasingDirection.Out,0,false,0.35)function ae._setShown(n,o,p)local q=n.window if o then q:_revealCommon(n,p)q:_reveal(n
.track,{BackgroundTransparency=0},p)q:_reveal(n.progress,{BackgroundTransparency=0},p)q:_reveal(n.handle,{
BackgroundTransparency=0},p)if n.valueOdo then n.valueOdo:reveal(0.3,p)end q:_reveal(n.progressGlow,{Transparency=math.
max(0.55,q.theme.AccentGlow)},p,m)q:_reveal(n.handleGlow,{Transparency=0.8},p,m)else q:_hideCommon(n,p)q:_reveal(n.track
,{BackgroundTransparency=1},p)q:_reveal(n.progress,{BackgroundTransparency=1},p)q:_reveal(n.handle,{
BackgroundTransparency=1},p)if n.valueOdo then n.valueOdo:reveal(1,p)end q:_reveal(n.progressGlow,{Transparency=1},p,m)q
:_reveal(n.handleGlow,{Transparency=1},p,m)end end function ae._refreshTheme(n)ag.tweenService:Create(n.progressGlow,
TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=math.max(0.55,n.window.theme.AccentGlow
)}):Play()end function ae._minWidth(n)if n.minimal then return 100 end local o=40 if n.icon then o+=22 end o+=ai.
textWidth(n.window.theme.Font,16,am.resolve(n.name))o+=12 o+=ai.textWidth(n.window.theme.Font,15,n:_format(n.value))
return math.max(o,160)end ak(ae)al(ae)return ae end)()end,[24]=function()local aa,ab,ac=a(24)local ad return(function(
...)local ae={}ae.__index=ae ae.__type='Statistic'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,am=ac(af.
variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.constants),ac(af.locale),ac(af.log)local an,b,c,d=ak.
statAccents,NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},41,TweenInfo.new(0.6,
Enum.EasingStyle.Exponential)local function e(f)return f.fill.Keypoints[1].Value end local function f(g)if g>0 then
return string.format('+%.1f%%',g)elseif g<0 then return string.format('%.1f%%',g)else return'0%'end end local function g
(h)if typeof(h)~='number'then return tostring(h)end local i=math.round(math.abs(h))local j=string.format('%.0f',i)local
k=j:reverse():gsub('%d%d%d','%0,'):reverse()if k:sub(1,1)==','then k=k:sub(2)end return if h<0 and i~=0 then'-'..k else
k end local function h(i)local j=math.round(i)if j>0 then return'+'..g(j)elseif j<0 then return g(j)else return'0'end
end function ae.new(i,j)j=if typeof(j)=='table'then j else{}local k=setmetatable({tab=assert(i,
'Missing argument #1 (Tab expected)'),window=i.window,name=j.name or j.Name or'Statistic',icon=ac(ab.Parent.Parent.
utility.image).iconFrom(j),description=j.description or j.Description,value=if(j.value or j.Value)~=nil then(j.value or
j.Value)else 0,_hasValue=(j.value or j.Value)~=nil,numberEasing=if(j.numberEasing~=nil)then j.numberEasing elseif j.
NumberEasing~=nil then j.NumberEasing else true,changeMode=j.changeMode or j.ChangeMode or'percentage',changeBaseline=j.
changeBaseline or j.ChangeBaseline or'previous',prefix=j.prefix or j.Prefix or'',suffix=j.suffix or j.Suffix or'',
compact=j.compact or j.Compact or i.compact or false,display=(j.display or j.Display or'value'),_initialValue=if(j.value
or j.Value)~=nil then(j.value or j.Value)else nil,_lastChange=0},ae)if k.compact then k:_buildCompact()else k:
_buildFull()end if k.description then if k.compact then am.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{
k.name}'.`)else k.descriptor=ac(ab.Parent.descriptor).new(k.tab,{description=k.description})end end return k end
function ae._buildFull(i)local j=i.window i.main=j:Create('Frame',{Size=UDim2.new(1,-20,0,90),BorderSizePixel=0,Name=i.
name,ZIndex=5,BackgroundTransparency=1,Parent=i.tab.tabPage},{BackgroundColor3='StatBackground',BackgroundTransparency=
'ElementTransparency'})j:Create('UICorner',{Parent=i.main},{CornerRadius='ElementCornerRadius'})i.stroke=j:Create(
'UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=i.main},{Transparency='ElementStrokeTransparency'})i
.strokeGradient=j:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.stroke,Transparency=b,
Parent=i.stroke})i.titleContainer=j:Create('Frame',{Size=UDim2.new(1,-40,0,32),Position=UDim2.fromOffset(20,15),
BorderSizePixel=0,LayoutOrder=-1,BackgroundTransparency=1,ZIndex=5,Parent=i.main})i.gradientContainer=j:Create('Frame',{
Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(0,0),BorderSizePixel=0,BackgroundTransparency=1,BackgroundColor3=
Color3.fromRGB(255,255,255),ZIndex=5,Parent=i.main})i.glow=j:CreateGlow(i.main,e(an.neutral),13,1)i.title=j:Create(
'TextLabel',{Text=al.t(i.name),Size=UDim2.fromOffset(300,19),BorderSizePixel=0,BackgroundTransparency=1,TextSize=19,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,ZIndex=10,TextTransparency=1,Parent=i.
titleContainer},{TextColor3='ContentColor',FontFace='TitleFont'})i.mainGradient=j:Create('UIGradient',{Rotation=2,Offset
=Vector2.new(0,0.5),Color=an.neutral.fill,Transparency=b,Parent=i.gradientContainer})j:Create('UICorner',{Parent=i.
gradientContainer},{CornerRadius='ElementCornerRadius'})if i.icon then i.iconLabel=j:Create('ImageLabel',{Image=i.icon,
Size=UDim2.fromOffset(32,32),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=i.
titleContainer},{ImageColor3='ContentColor'})end i.containerLayout=j:Create('UIListLayout',{Padding=UDim.new(0,8),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=i.titleContainer})i.valueHost=j:Create('Frame',{
AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,20,1,-15),Size=UDim2.fromOffset(200,20),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=10,Parent=i.main})i.changeHost=j:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.
new(1,-20,1,-15),Size=UDim2.fromOffset(200,15),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=i.main})i.
valueOdo=ai.new(j,i.valueHost,{textSize=20,alignment=Enum.HorizontalAlignment.Left,transparency=1})i.valueOdo:snap(i:
_formatValue(i.value))i.changeOdo=ai.new(j,i.changeHost,{textSize=15,alignment=Enum.HorizontalAlignment.Right,
transparency=1})i.changeOdo:snap(i:_formatChange(0))i._accentGradients={i.strokeGradient,i.mainGradient}end function ae.
_buildCompact(i)local j,k=i.window,i.tab.compact or false i.main=j:Create('Frame',{Name=i.name,Size=if k then UDim2.
fromOffset(0,c)else UDim2.new(1,-20,0,c),AutomaticSize=if k then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
ClipsDescendants=true,BorderSizePixel=0,ZIndex=5,BackgroundTransparency=1,Parent=i.tab.tabPage},{BackgroundColor3=
'StatBackground',BackgroundTransparency='ElementTransparency'})j:Create('UICorner',{Parent=i.main},{CornerRadius=
'ElementCornerRadius'})i.stroke=j:Create('UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=i.main},{
Transparency='ElementStrokeTransparency'})i.strokeGradient=j:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),
Color=an.neutral.stroke,Transparency=b,Parent=i.stroke})if k then j:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,
Parent=i.main})end j:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=i.main})i.card=j:Create('Frame',{AutomaticSize=
Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,c),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=5,
BackgroundTransparency=1,Parent=i.main})j:Create('UICorner',{Parent=i.card},{CornerRadius='ElementCornerRadius'})i.
mainGradient=j:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.fill,Transparency=b,Parent=i.
card})j:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=i.card})j:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=i.card})i.titleContainer=j:Create('Frame'
,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=
0,ZIndex=6,Parent=i.card})j:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=i.titleContainer})j:Create(
'UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=i
.titleContainer})if i.icon then i.iconLabel=j:Create('ImageLabel',{Image=i.icon,Size=UDim2.fromOffset(20,20),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ZIndex=6,ImageTransparency=1,Parent=i.titleContainer},{
ImageColor3='ContentColor'})end i.title=j:Create('TextLabel',{Text=al.t(i.name),Size=UDim2.fromOffset(0,16),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,ZIndex=6,TextTransparency=1,Parent=i.
titleContainer},{TextColor3='ContentColor',FontFace='Font'})j:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,
Parent=i.title})i.readoutHost=j:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,18),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=6,Parent=i.card})i.readoutOdo=ai.new(j,i.readoutHost,{
textSize=17,alignment=Enum.HorizontalAlignment.Right,transparency=1})i.readoutOdo:snap(i.display=='change'and i:
_formatChange(0)or i:_formatValue(i.value))i._accentGradients={i.strokeGradient,i.mainGradient}end function ae.
_setAccent(i,j,k)local l=an[j]i.strokeGradient.Color=l.stroke i.mainGradient.Color=l.fill if i.glow then i.glow.Color=e(
l)end local m,n=if k==1 then 14 elseif k==-1 then-10 else 2,if k==1 then Vector2.new(0.04,0.5)elseif k==-1 then Vector2.
new(-4E-2,0.5)else Vector2.new(0,0.5)for o,p in i._accentGradients do ag.tweenService:Create(p,d,{Rotation=m,Offset=n}):
Play()end end function ae._formatValue(i,j)return i.prefix..g(j)..i.suffix end function ae._formatChange(i,j)if i.
changeMode=='absolute'then return h(j)else return f(j)end end function ae._showValue(i,j,k,l,m)if i.numberEasing and not
m then j:to(i:_formatValue(k),k>=l)else j:snap(i:_formatValue(k))end end function ae._updateFullReadouts(i,j,k,l,m,n,o)i
:_showValue(i.valueOdo,j,k,o)if n then i.changeOdo:snap(n)i._lastChange=0 elseif i.numberEasing and not m then i.
changeOdo:to(i:_formatChange(l),l>=i._lastChange)i._lastChange=l else i.changeOdo:snap(i:_formatChange(l or 0))i.
_lastChange=l or 0 end end function ae._updateCompactReadout(i,j,k,l,m,n,o)if i.display=='change'then if n then i.
readoutOdo:snap(n)i._lastChange=0 elseif i.numberEasing and not m then i.readoutOdo:to(i:_formatChange(l),l>=i.
_lastChange)i._lastChange=l else i.readoutOdo:snap(i:_formatChange(l or 0))i._lastChange=l or 0 end else i:_showValue(i.
readoutOdo,j,k,o)end end function ae.Set(i,j)assert(typeof(j)=='number','Statistic:Set() - value must be a number, got '
..typeof(j))local k,l=i.value,not i._hasValue i.value=j i._hasValue=true if l then i._initialValue=j end local m=if i.
changeBaseline=='initial'then i._initialValue else k local n,o,p,q,r=l or m==j if n then o=0 q='neutral'r=0 elseif m==0
then local s,t=if j>0 then'+'else'-',if i.changeMode=='percentage'then'\u{221e}%'else'\u{221e}'p=s..t q=if j>0 then
'positive'else'negative'r=if j>0 then 1 else-1 elseif i.changeMode=='percentage'then o=((j-m)/math.abs(m))*100 r=if o>0
then 1 elseif o<0 then-1 else 0 q=if r==1 then'positive'elseif r==-1 then'negative'else'neutral'else o=j-m r=if o>0 then
1 elseif o<0 then-1 else 0 q=if r==1 then'positive'elseif r==-1 then'negative'else'neutral'end i:_setAccent(q,r)if i.
compact then i:_updateCompactReadout(j,k,o,n,p,l)else i:_updateFullReadouts(j,k,o,n,p,l)end end function ae.
ResetBaseline(i,j)local k,l,m=i.value,not i._hasValue,if typeof(j)=='number'then j else i.value i._initialValue=m i.
value=m i._hasValue=true i._lastChange=0 if i.compact then if i.display=='change'then i.readoutOdo:snap(i:_formatChange(
0))else i:_showValue(i.readoutOdo,m,k,l)end else i.changeOdo:snap(i:_formatChange(0))i:_showValue(i.valueOdo,m,k,l)end i
:_setAccent('neutral',0)end function ae._setShown(i,j,k)local l=i.window if i.compact then l:_reveal(i.main,{
BackgroundTransparency=if j then(i.window.theme.ElementTransparency or 0)else 1},k)l:_reveal(i.stroke,{Transparency=if j
then i.window.theme.ElementStrokeTransparency else 1},k)l:_reveal(i.card,{BackgroundTransparency=if j then 0 else 1},k)l
:_reveal(i.title,{TextTransparency=if j then 0 else 1},k)if i.iconLabel then l:_reveal(i.iconLabel,{ImageTransparency=if
j then 0 else 1},k)end i.readoutOdo:reveal(if j then 0 else 1,k)return end if j then l:_revealCommon(i,k)l:_reveal(i.
gradientContainer,{BackgroundTransparency=0},k)l:_reveal(i.glow,{Transparency=0.82},k)i.valueOdo:reveal(0,k)i.changeOdo:
reveal(0,k)else l:_hideCommon(i,k)l:_reveal(i.gradientContainer,{BackgroundTransparency=1},k)l:_reveal(i.glow,{
Transparency=1},k)i.valueOdo:reveal(1,k)i.changeOdo:reveal(1,k)end end function ae._minWidth(i)local j=40 if i.icon then
j+=26 end j+=ah.textWidth(i.window.theme.Font,16,al.resolve(i.name))local k=if i.display=='change'then i:_formatChange(0
)else i:_formatValue(i.value)j+=ah.textWidth(i.window.theme.Font,17,k)return j end aj(ae)return ae end)()end,[25]=
function()local aa,ab,ac=a(25)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Tab'local af=ab.Parent.
Parent.utility local ag,ah,ai,aj,ak=ac(af.variables),ac(af.ordering),ac(af.HapticEngine),ac(ab.Parent.search),ac(ab.
Parent.tabSelector)local function al(am,an)for b,c in an do if c.__type=='Group'then al(am,c.elements)else am:
_unregisterControl(c)end if c.connections then for d,e in c.connections do am:Disconnect(e)end c.connections=nil end if
c._dragConnection then c._dragConnection:Disconnect()c._dragConnection=nil end if am._recordingKeybind==c then am.
_recordingKeybind=nil end if c._outsideClickConn then am:Disconnect(c._outsideClickConn)c._outsideClickConn=nil end end
end local am,an=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.25,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out)function ae.new(b,c)c=if typeof(c)=='table'then c else{}local d=setmetatable({window=
assert(b,'Missing argument #1 (Window expected)'),name=c.name or c.Name,icon=c.icon or c.Icon,neglectSelector=c.
neglectSelector or c.NeglectSelector or false,customOrder=c.customOrder or c.CustomOrder or 0,builtIn=c.builtIn or false
,keepSelection=c.keepSelection or false,forgetState=c.forgetState or c.ForgetState or false,elements={},connections={}},
ae)assert(d.name or d.icon,'A tab needs a name or an icon.')if not d.neglectSelector then ak.build(d,d.window.layout)end
d.tabPage=d.window:Create('ScrollingFrame',{Name=d.name,Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),
AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,
CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=d.
customOrder or 0,Parent=d.window.elements})d.tabPageLayout=d.window:Create('UIListLayout',{Padding=UDim.new(0,7),
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=d.tabPage})d.window:Create('UIPadding',{
PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,33),Parent=d.tabPage})if not d.neglectSelector then table.insert(d.
connections,d.window:Connect(d.topbarItemInteract.MouseButton1Click,function()ai.click()d:Select()end))table.insert(d.
connections,d.window:Connect(d.topbarItemInteract.MouseEnter,function()if not d.window:_interactive()then return end if
d.window.selectedTab~=d then d:_applyVisual('hover',an)d:_spinGradients()end end))table.insert(d.connections,d.window:
Connect(d.topbarItemInteract.MouseLeave,function()if d.window.selectedTab~=d then d:_applyVisual('unselected',an)end end
))end return d end function ae._applyVisual(b,c,d)if b.neglectSelector or not b.topbarItem then return end local e=ak.
states[b.window.layout.mode][c]if not e then return end ak.applyVisual(b,e,d)end function ae._spinGradients(b)if b.
neglectSelector then return end local c=TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)for d,e in{b.
topbarItemGradient,b.topbarItemStrokeGradient}do e.Rotation=-270 ag.tweenService:Create(e,c,{Rotation=90}):Play()end end
function ae.Select(b,c)if b.window._searching then aj.close(b.window,{showTabs=true,jumpTo=false})end b.window.
selectedTab=b b.window:_jumpTo(b.tabPage)local d=c or not b.window:_interactive()if not b.neglectSelector and not d then
b:_applyVisual('selected',am)end for e,f in b.window.tabs do if f~=b.window.selectedTab then f:Deselect(d)end end if b~=
b.window.rfSettings and b.window.settingsAction and not d then ag.tweenService:Create(b.window.settingsAction.iconLabel,
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end function ae.
Deselect(b,c)if not b.neglectSelector and not c then b:_applyVisual('unselected',am)end end function ae._register(b,c)
table.insert(b.elements,c)ah(c,#b.elements*10)b.window:_restoreLate(c)if not b.window.hidden then c:_setShown(true,true)
end return c end function ae.CreateButton(b,c)return b:_register(ac(ab.Parent.button).new(b,c))end function ae.
CreateToggle(b,c)return b:_register(ac(ab.Parent.toggle).new(b,c))end function ae.CreateSwitch(b,c)return b:
CreateToggle(c)end function ae.CreateSection(b,c)return b:_register(ac(ab.Parent.section).new(b,c))end function ae.
CreateText(b,c)return b:_register(ac(ab.Parent.text).new(b,c))end function ae.CreateDiscord(b,c)return b:_register(ac(ab
.Parent.discord).new(b,c))end function ae.CreateGallery(b,c)return b:_register(ac(ab.Parent.gallery).new(b,c))end
function ae.CreateDivider(b,c)return b:_register(ac(ab.Parent.divider).new(b,c))end function ae.CreateProgress(b,c)
return b:_register(ac(ab.Parent.progress).new(b,c))end function ae.CreateConsole(b,c)return b:_register(ac(ab.Parent.
console).new(b,c))end function ae.CreateStat(b,c)return b:_register(ac(ab.Parent.stat).new(b,c))end function ae.
CreateSlider(b,c)return b:_register(ac(ab.Parent.slider).new(b,c))end function ae.CreateDropdown(b,c)return b:_register(
ac(ab.Parent.dropdown).new(b,c))end function ae.CreateInput(b,c)return b:_register(ac(ab.Parent.input).new(b,c))end
function ae.CreateKeybind(b,c)return b:_register(ac(ab.Parent.keybind).new(b,c))end function ae.CreateColorPicker(b,c)
return b:_register(ac(ab.Parent.colorpicker).new(b,c))end function ae.CreateGroup(b,c)return b:_register(ac(ab.Parent.
group).new(b,c))end function ae._moveElement(b,c,d)local e=table.find(b.elements,c)if not e then return end table.
remove(b.elements,e)d=math.clamp(d,1,#b.elements+1)table.insert(b.elements,d,c)for f,g in b.elements do ah(g,f*10)end
end function ae.Remove(b)local c=b.window if c._searching then aj.close(c,{showTabs=true,jumpTo=c.selectedTab and c.
selectedTab.tabPage})end local d=table.find(c.tabs,b)if d then table.remove(c.tabs,d)end if c.selectedTab==b then c.
selectedTab=nil for e,f in ipairs(c.tabs)do if not f.neglectSelector then f:Select()break end end end al(c,b.elements)
for e,f in b.connections do c:Disconnect(f)end b.connections={}if b.topbarItem then c:DestroySubtree(b.topbarItem)end if
b.tabPage then c:DestroySubtree(b.tabPage)end b.topbarItem=nil b.tabPage=nil b.elements={}end return ae end)()end,[26]=
function()local aa,ab,ac=a(26)local ad return(function(...)local ae={}ae.__index=ae ae.__type='TabSection'local af,ag,ah
,ai,aj=ac(ab.Parent.Parent.utility.locale),ac(ab.Parent.Parent.utility.log),20,6,3 local function ak(al)for am,an in al.
tabs do if not an.neglectSelector and not an.builtIn then return true end end return#al.tabSections>0 end function ae.
new(al,am)am=if typeof(am)=='table'then am else{}local an=setmetatable({window=assert(al,
'Missing argument #1 (Window expected)'),name=am.name or am.Name or'Section',icon=am.icon or am.Icon},ae)if al.layout.
mode~='sidebar'then if not al._warnedTabSection then al._warnedTabSection=true ag.warn
[[Rayfield: Window:CreateSection needs the sidebar layout; it does nothing on the top strip.]]end an.inert=true return
an end an.main=al:Create('Frame',{Name=an.name,Size=UDim2.new(1,-ah*2,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,BorderSizePixel=0,Visible=false,Parent=al.tabList})an.padding=al:Create('UIPadding',{PaddingTop
=UDim.new(0,if ak(al)then ai else 0),PaddingBottom=UDim.new(0,aj),Parent=an.main})al:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,
HorizontalAlignment=Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,Parent=an.main})if an.
icon then an.iconLabel=al:Create('ImageLabel',{Image=an.icon,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=0,ImageTransparency=1,Parent=an.main},{ImageColor3='ContentColor'})end an.title=al:Create(
'TextLabel',{Text=af.t(an.name),Size=UDim2.fromOffset(0,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,
BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Bottom,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=an.main},{TextColor3='ContentColor',FontFace='Font'})return an
end function ae._setShown(al,am,an)if not al.main then return end local b=al.window b:_reveal(al.title,{TextTransparency
=if am then 0.6 else 1},an)if al.iconLabel then b:_reveal(al.iconLabel,{ImageTransparency=if am then 0.65 else 1},an)end
end function ae._setVisible(al,am)if al.main then al.main.Visible=am end end function ae.Remove(al)local am=table.find(
al.window.tabSections,al)if am then table.remove(al.window.tabSections,am)end al.window:DestroySubtree(al.main)al.main=
nil end return ae end)()end,[27]=function()local aa,ab,ac=a(27)local ad return(function(...)local ae=ab.Parent.Parent.
utility local af,ag,ah,ai=ac(ae.variables),ac(ae.functions),ac(ae.locale),{}local function aj(ak:string?):string if
type(ak)~='string'or ak==''then return'?'end local al=utf8.offset(ak,2)local am=if al then string.sub(ak,1,al-1)else ak
return string.upper(am)end ai.states={top={selected={background=0,stroke=0,content=0},hover={background=0.4,stroke=0.3,
content=0.3},unselected={background=0.8,stroke=0.65,content=0.5},hidden={background=1,stroke=1,content=1}},sidebar={
selected={background=0.4,stroke=0.5,content=0,shadow=0.8},hover={background=0.7,stroke=0.8,content=0.3,shadow=1},
unselected={background=1,stroke=1,content=0.5,shadow=1},hidden={background=1,stroke=1,content=1,shadow=1}}}
local function ak(al,am,an)al.topbarItemGradient=al.window:Create('UIGradient',{Rotation=90,Parent=am},{Color={
'TabBackground',ag.toColorSequence}})al.topbarItemStrokeGradient=al.window:Create('UIGradient',{Rotation=90,Parent=an},{
Color={'TabStroke',ag.toColorSequence}})end local function al(am,an,b)if b and not am.icon then am.topbarItemInitial=am.
window:Create('TextLabel',{Text=aj(am.name),Size=UDim2.fromOffset(an,an),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=an-4,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Visible=false,
TextTransparency=1,Parent=am.topbarItemContainer},{TextColor3='TabColor',FontFace='Font'})end if am.icon then am.
topbarItemIcon=am.window:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(an,an),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=am.topbarItemContainer},{ImageColor3='TabColor'})end if am.name then
am.topbarItemTitle=am.window:Create('TextLabel',{Text=ah.t(am.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.XY,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=am.topbarItemContainer},{TextColor3='TabColor',FontFace='Font'}
)end end local function am(an)an.topbarItem=an.window:Create('Frame',{Name=an.name,Size=UDim2.fromOffset(0,34),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency
=1,Visible=false,LayoutOrder=an.customOrder or 0,Parent=an.window.tabList})an.topbarItemInteract=an.window:Create(
'TextButton',{Active=false,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency
=1,Parent=an.topbarItem})an.window:Create('UICorner',{Parent=an.topbarItem},{CornerRadius='PillCornerRadius'})an.
topbarItemStroke=an.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,
255),Transparency=1,Parent=an.topbarItem})ak(an,an.topbarItem,an.topbarItemStroke)an.topbarItemContainer=an.window:
Create('Frame',{Size=UDim2.fromOffset(0,34),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=
0,Parent=an.topbarItem})an.window:Create('UIPadding',{PaddingLeft=UDim.new(0,13),PaddingRight=UDim.new(0,14),Parent=an.
topbarItemContainer})an.topbarItemLayout=an.window:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=an.topbarItemContainer})al(an,16,false)end local function an(b,c)b.
topbarItem=b.window:Create('Frame',{Name=b.name,Size=UDim2.new(1,-c.rowInset*2,0,c.rowHeight),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Visible=false,LayoutOrder=b.customOrder or 0,Parent=b.
window.tabList})b.topbarItemInteract=b.window:Create('TextButton',{Active=false,BackgroundTransparency=1,Size=UDim2.
fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,Parent=b.topbarItem})b.window:Create('UICorner',{
CornerRadius=UDim.new(0,c.rowCornerRadius),Parent=b.topbarItem})b.topbarItemStroke=b.window:Create('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=b.topbarItem})ak(b,b
.topbarItem,b.topbarItemStroke)b.topbarItemShadow=b.window:Create('UIShadow',{BlurRadius=UDim.new(0,20),Color=Color3.
fromRGB(255,255,255),Offset=UDim2.new(0,0,0,-15),Spread=UDim2.new(0,10,0,-30),ZIndex=-1,Transparency=1,Parent=b.
topbarItem})b.topbarItemContainer=b.window:Create('Frame',{Size=UDim2.new(1,-c.rowPadding,0,24),Position=UDim2.new(0,c.
rowPadding,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,Parent=b.topbarItem})b.
topbarItemLayout=b.window:Create('UIListLayout',{Padding=UDim.new(0,c.rowContentSpacing),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=b.topbarItemContainer})al(b,c.rowIconSize,true)end function ai.build(b,
c)if c.mode=='sidebar'then an(b,c)else am(b)end end function ai.setRowCollapsed(b,c,d)if d.mode~='sidebar'or not b.
topbarItem then return end if b.topbarItemTitle then b.topbarItemTitle.Visible=not c end if b.topbarItemInitial then b.
topbarItemInitial.Visible=c end local e=if c then 0 else d.rowPadding b.topbarItemContainer.Size=UDim2.new(1,-e,0,24)b.
topbarItemContainer.Position=UDim2.new(0,e,0.5,0)b.topbarItemLayout.HorizontalAlignment=if c then Enum.
HorizontalAlignment.Center else Enum.HorizontalAlignment.Left end function ai.applyVisual(b,c,d)local e={[b.topbarItem]=
{BackgroundTransparency=c.background},[b.topbarItemStroke]={Transparency=c.stroke}}if b.topbarItemIcon then e[b.
topbarItemIcon]={ImageTransparency=c.content}end if b.topbarItemTitle then e[b.topbarItemTitle]={TextTransparency=c.
content}end if b.topbarItemInitial then e[b.topbarItemInitial]={TextTransparency=c.content}end if b.topbarItemShadow and
c.shadow then e[b.topbarItemShadow]={Transparency=c.shadow}end for f,g in e do if d then af.tweenService:Create(f,d,g):
Play()else for h,i in g do f[h]=i end end end end return ai end)()end,[28]=function()local aa,ab,ac=a(28)local ad return
(function(...)local ae={}ae.__index=ae ae.__type='Tag'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak=ac(af.
variables),ac(af.functions),ac(af.image),Color3.fromRGB(255,175,15),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)function ae.new(al,am)am=if typeof(am)=='table'then am else{}local an=setmetatable({window=assert(al
,'Missing argument #1 (Window expected)'),text=am.text or am.Text or am.title or am.Title,icon=am.icon or am.Icon,color=
am.color or am.Color or aj},ae)assert(an.icon or(an.text and an.text~=''),'A Tag requires an icon, text, or both.')an.
main=an.window:Create('Frame',{Name='Tag',Size=UDim2.fromOffset(10,24),AutomaticSize=Enum.AutomaticSize.X,
BackgroundColor3=an.color,BorderSizePixel=0,LayoutOrder=am.order or am.Order or 0,BackgroundTransparency=1,Parent=an.
window.tagContainer})an.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=an.main})an.window:Create(
'UIPadding',{PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10),Parent=an.main})an.window:Create('UIListLayout',{
Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=an.main})local b=ah.contrastColor(an.color)an.iconLabel=an.window:Create(
'ImageLabel',{Name='Icon',Image=an.icon or'',ImageColor3=b,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,Visible
=an.icon~=nil,ZIndex=5,ImageTransparency=1,Parent=an.main})an.title=an.window:Create('TextLabel',{Name='Title',
AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(10,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,
Text=an.text or'',TextColor3=b,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,RichText=true,
Visible=an.text~=nil and an.text~='',LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=an.main},{FontFace='Font'})an.
window.tagContainer.Visible=true if not an.window.hidden then an:_setShown(true,ak)end return an end function ae.
_setShown(al,am,an)local b,c=if am then 0 else 1,if typeof(an)=='TweenInfo'then an elseif an then ak else nil if c then
ag.tweenService:Create(al.main,c,{BackgroundTransparency=b}):Play()ag.tweenService:Create(al.iconLabel,c,{
ImageTransparency=b}):Play()ag.tweenService:Create(al.title,c,{TextTransparency=b}):Play()else al.main.
BackgroundTransparency=b al.iconLabel.ImageTransparency=b al.title.TextTransparency=b end end function ae.SetColor(al,am
)al.color=am local an=ah.contrastColor(am)ag.tweenService:Create(al.main,ak,{BackgroundColor3=am}):Play()ag.tweenService
:Create(al.iconLabel,ak,{ImageColor3=an}):Play()ag.tweenService:Create(al.title,ak,{TextColor3=an}):Play()end function
ae.SetText(al,am)al.text=am al.title.Text=am or''al.title.Visible=am~=nil and am~=''end function ae.SetIcon(al,am)al.
icon=am ai.assign(al.iconLabel,'Image',am)al.iconLabel.Visible=am~=nil end function ae.Set(al,am)if am.color or am.Color
then al:SetColor(am.color or am.Color)end if am.text or am.Text or am.title or am.Title then al:SetText(am.text or am.
Text or am.title or am.Title)end if am.icon~=nil or am.Icon~=nil then al:SetIcon(am.icon or am.Icon)end end function ae.
Remove(al)al.window:DestroySubtree(al.main)local am=table.find(al.window.tags,al)if am then table.remove(al.window.tags,
am)end if#al.window.tags==0 then al.window.tagContainer.Visible=false end end return ae end)()end,[29]=function()local
aa,ab,ac=a(29)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Text'local af,ag,ah,ai,aj=ac(ab.Parent.
Parent.utility.moveable),ac(ab.Parent.Parent.utility.locale),16,14,0.45 function ae.new(ak,al)al=if typeof(al)=='table'
then al else{}local am=setmetatable({tab=assert(ak,'Missing argument #1 (Tab expected)'),window=ak.window,name=tostring(
al.name or al.Name or''),text=tostring(al.text or al.Text or''),icon=ac(ab.Parent.Parent.utility.image).iconFrom(al)},ae
)am.main=am.window:Create('Frame',{Size=UDim2.new(1,-20,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,Name=
if am.name~=''then am.name else'Text',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.
tab.tabPage},{BackgroundTransparency='ElementTransparency'})am.stroke=am.window:StyleElementBody(am.main)am.window:
Create('UIPadding',{PaddingTop=UDim.new(0,14),PaddingBottom=UDim.new(0,14),PaddingLeft=UDim.new(0,20),PaddingRight=UDim.
new(0,20),Parent=am.main})am.window:Create('UIListLayout',{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,
Parent=am.main})am.titleRow=am.window:Create('Frame',{Name='Title',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=1,Parent=am.main})am.window:Create('UIListLayout'
,{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Top,Parent=am.titleRow})if am.icon then am.iconLabel=am.window:Create(
'ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,
Parent=am.titleRow},{ImageColor3='ContentColor'})end am.title=am.window:Create('TextLabel',{Text=ag.t(am.name),Size=
UDim2.new(1,if am.icon then-22 else 0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1
,RichText=true,TextSize=ah,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,TextTransparency=1,
Parent=am.titleRow},{TextColor3='TitlingColor',FontFace='Font'})am.body=am.window:Create('TextLabel',{Text=ag.t(am.text)
,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,
TextSize=ai,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,TextTransparency=1,Parent=am.main},{
TextColor3='ContentColor',FontFace='Font'})am:_applyPresence()return am end function ae._applyPresence(ak)ak.titleRow.
Visible=ak.name~=''or ak.icon~=nil ak.body.Visible=ak.text~=''end function ae.Set(ak,al)ak.text=tostring(al)ak.window:
_bindLocale(ak.body,'Text',ak.text)ak:_applyPresence()end function ae.SetTitle(ak,al)ak.name=tostring(al)ak.window:
_bindLocale(ak.title,'Text',ak.name)ak:_applyPresence()end function ae._setShown(ak,al,am)if al then ak.window:
_revealCommon(ak,am)else ak.window:_hideCommon(ak,am)end ak.window:_reveal(ak.body,{TextTransparency=if al then aj else
1},am)end af(ae)return ae end)()end,[30]=function()local aa,ab,ac=a(30)local ad return(function(...)local ae={}ae.
__index=ae ae.__type='Toast'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,am,an,b,c,d,e,f,g,h,i,j,k,l,m,n,o,
p,q=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.image),ac(af.HapticEngine),TweenInfo.new(0.6,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),24,32,18,
18,10,28,12,8,140,320,6,UDim2.new(0.5,0,0.5,-180),UDim2.new(0.5,0,0.5,180),UDim2.new(0.5,0,0.5,0)local function r(s)
return math.clamp(#s*0.06+3,3,9)end local function s(t)if type(t)=='number'then return'rbxassetid://'..tostring(t)end
return t end function ae.new(t,u,v)u=if typeof(u)=='table'then u else{}local w=setmetatable({window=assert(t,
'Missing argument #1 (Window expected)'),title=u.title or u.Title or'',subtitle=u.subtitle or u.Subtitle,icon=u.icon or
u.Icon,avatar=u.avatar or u.Avatar,minWidth=u.minWidth or u.MinWidth,subtitleAbove=u.subtitleAbove or u.SubtitleAbove or
false,position=u.position or'Top',_hovered=false,_dismissed=false},ae)w.duration=u.duration or u.Duration or r(w.title..
(w.subtitle or''))local x=w.avatar~=nil and w.avatar~=0 local y=x or(w.icon~=nil and w.icon~=0 and w.icon~='')w.
_iconImage=if x then aj.avatar(w.avatar,function(z)if w.iconLabel and not w._dismissed and w.main.Parent then aj.assign(
w.iconLabel,'Image',z)end end)elseif y then s(w.icon)else nil w._iconSize=if x then e else d w._leftPad=if x then h else
f w._rightPad=if x then i else g w._minWidth=math.clamp(w.minWidth or 0,l,m)local z=w.subtitle~=nil and w.subtitle~=''w.
main=w.window:Create('Frame',{Name='Toast',BackgroundTransparency=1,Size=UDim2.new(0,0,0,0),BorderSizePixel=0,ZIndex=ai.
zIndex.toast,Parent=v or w.window.toasts})w.window:Create('UIPadding',{PaddingTop=UDim.new(0,k),Parent=w.main})w.body=w.
window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.new(1,0,1,0),Position=if w.position==
'Bottom'then p else o,AnchorPoint=Vector2.new(0.5,0.5),Active=true,BorderSizePixel=0,ZIndex=ai.zIndex.toast,
BackgroundTransparency=1,Parent=w.main})w.window:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=w.
body},{Color={'WindowColor',ah.toColorSequence}})w.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=w.body})w
.stroke=w.window:Create('UIStroke',{Transparency=1,Parent=w.body},{Color='SurfaceStroke'})w.shadow=w.window:CreateGlow(w
.body,'ShadowColor',20,1)w.window:Create('UIPadding',{PaddingLeft=UDim.new(0,w._leftPad),PaddingRight=UDim.new(0,w.
_rightPad),Parent=w.body})w.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=
Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,j),Parent=w.body})if y then w.iconLabel=w.window:Create('ImageLabel',{Image=w._iconImage,Size=UDim2.
fromOffset(w._iconSize,w._iconSize),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,LayoutOrder=1,ZIndex=
ai.zIndex.toastContent,BackgroundTransparency=1,ImageTransparency=1,Parent=w.body},if x then nil else{ImageColor3=
'ContentColor'})w.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=w.iconLabel})end w.container=w.window:
Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,z and 32 or 16),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=2,ZIndex=ai.zIndex.toastContent,Parent=w.body})w.window:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,1),Parent=w.container})w.titleLabel=w.window:Create('TextLabel',{Text=w.title,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=if w.subtitleAbove then 2 else 1,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent
=w.container},{TextColor3='ContentColor',FontFace='TitleFont'})if z then w.subtitleLabel=w.window:Create('TextLabel',{
Text=w.subtitle,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,14),BackgroundTransparency=1,TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if w.subtitleAbove then 1 else 2,ZIndex=ai.zIndex.toastContent,
TextTransparency=1,Parent=w.container},{TextColor3='ContentColor',FontFace='Font'})end w.window._toastCount=(w.window.
_toastCount or 0)+1 w.main.LayoutOrder=-w.window._toastCount local A=w.window._liveToasts if not A then A={}w.window.
_liveToasts=A end local B=A[w.main.Parent]if not B then B={}A[w.main.Parent]=B end w._live=B table.insert(B,w)while#B>n
do local C=table.remove(B,1)if C and C~=w then task.spawn(C._dismiss,C)end end w._connections={w.window:Connect(w.body.
MouseEnter,function()w._hovered=true end),w.window:Connect(w.body.MouseLeave,function()w._hovered=false end),w.window:
Connect(w.body.InputBegan,function(C)if C.UserInputType==Enum.UserInputType.MouseButton1 or C.UserInputType==Enum.
UserInputType.Touch then w:_dismiss()end end)}task.spawn(function()w:_show()end)return w end function ae._measure(t)
local u,v=ah.textWidth(t.window.theme.TitleFont,16,t.title),if t.subtitleLabel then ah.textWidth(t.window.theme.Font,14,
t.subtitle)else 0 local w,x=math.max(u,v),if t.iconLabel then t._leftPad+t._iconSize+j else t._leftPad local y=math.
clamp(x+w+t._rightPad,t._minWidth,m)if x+w+t._rightPad>m then local z=m-x-t._rightPad for A,B in{t.titleLabel,t.
subtitleLabel}do if B then B.AutomaticSize=Enum.AutomaticSize.None B.TextTruncate=Enum.TextTruncate.AtEnd B.Size=UDim2.
fromOffset(z,B.Size.Y.Offset)end end end local z=if t.subtitleLabel then 31 else 16 local A=math.max(z,if t.iconLabel
then t._iconSize else 0)+18 return y,A end function ae._show(t)if not t.main.Parent then return end ak.notify()local u,v
=t:_measure()if t._dismissed or not t.main.Parent then return end t.main.Size=UDim2.new(0,u,0,0)ag.tweenService:Create(t
.main,am,{Size=UDim2.new(0,u,0,v+k)}):Play()ag.tweenService:Create(t.body,al,{Position=q}):Play()ag.tweenService:Create(
t.body,an,{BackgroundTransparency=0}):Play()ag.tweenService:Create(t.stroke,an,{Transparency=0.9}):Play()ag.tweenService
:Create(t.shadow,b,{Transparency=0.6}):Play()ag.tweenService:Create(t.titleLabel,b,{TextTransparency=0}):Play()task.
wait(0.05)if t._dismissed or not t.main.Parent then return end if t.iconLabel then ag.tweenService:Create(t.iconLabel,b,
{BackgroundTransparency=0.95}):Play()ag.tweenService:Create(t.iconLabel,b,{ImageTransparency=0}):Play()end task.wait(
0.05)if t._dismissed or not t.main.Parent then return end if t.subtitleLabel then ag.tweenService:Create(t.subtitleLabel
,b,{TextTransparency=0.5}):Play()end local w=0 while w<t.duration and not t._dismissed and t.main.Parent do local x=task
.wait()if not t._hovered then w+=x end end t:_dismiss()end function ae._dismiss(t)if t._dismissed then return end t.
_dismissed=true local u=t._live local v=u and table.find(u,t)if u and v then table.remove(u,v)end if not t.main.Parent
then return end ag.tweenService:Create(t.body,an,{BackgroundTransparency=1}):Play()ag.tweenService:Create(t.stroke,an,{
Transparency=1}):Play()ag.tweenService:Create(t.shadow,b,{Transparency=1}):Play()ag.tweenService:Create(t.titleLabel,b,{
TextTransparency=1}):Play()if t.subtitleLabel then ag.tweenService:Create(t.subtitleLabel,b,{TextTransparency=1}):Play()
end if t.iconLabel then ag.tweenService:Create(t.iconLabel,b,{ImageTransparency=1,BackgroundTransparency=1}):Play()end
ag.tweenService:Create(t.body,c,{Size=UDim2.new(1,-60,1,0)}):Play()local w=ag.tweenService:Create(t.main,c,{Size=UDim2.
new(0,t.main.Size.X.Offset,0,0)})w:Play()w.Completed:Wait()if not t.main.Parent then return end for x,y in t.
_connections do t.window:Disconnect(y)end t.window:DestroySubtree(t.main)end return ae end)()end,[31]=function()local aa
,ab,ac=a(31)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Toggle'local af=ab.Parent.Parent.utility
local ag,ah,ai,aj,ak,al=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.
HapticEngine)function ae.new(am,an)an=if typeof(an)=='table'then an else{}local b=setmetatable({tab=assert(am,
'Missing argument #1 (Tab expected)'),window=am.window,name=an.name or an.Name or'Switch',icon=ac(ab.Parent.Parent.
utility.image).iconFrom(an),description=an.description or an.Description,forgetState=an.forgetState or an.ForgetState or
am.forgetState,compact=am.compact or false,flag=an.flag or an.Flag or(not(an.forgetState or an.ForgetState or am.
forgetState)and ah.deriveFlagFromName(an.name or an.Name or'Switch')or nil),callback=an.callback or an.Callback or
function()end,value=if(an.value or an.Value)~=nil then(an.value or an.Value)elseif(an.currentValue or an.CurrentValue)~=
nil then(an.currentValue or an.CurrentValue)else false},ae)b.rowHeight=b.window:_richHeight(b,41)b.window:
_registerControl(b)if b.compact then b:_buildCompact()else b:_buildFull()end if b.description and not b.compact then b.
descriptor=ac(ab.Parent.descriptor).new(b.tab,{description=b.description})end b.window:_decorate(b,an,80)return b end
function ae._buildSwitch(am,an)local b=am.window am.functionContainer=b:Create('Frame',{BorderSizePixel=0,Size=UDim2.
fromOffset(50,21),BackgroundTransparency=1,Parent=an},{BackgroundColor3='ToggleTrack'})b:Create('UICorner',{CornerRadius
=UDim.new(0,15),Parent=am.functionContainer})am.containerStroke=b:Create('UIStroke',{Transparency=1,Parent=am.
functionContainer},{Color='SurfaceStroke'})am.indicator=b:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(25,17)
,Position=am.value and UDim2.new(1,-28,0.5,0)or UDim2.new(1,-47,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=
am.value and am.window.theme.AccentColor or am.window.theme.ToggleKnobOff,BackgroundTransparency=1,Parent=am.
functionContainer})b:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=am.indicator})am.indicatorStroke=b:Create(
'UIStroke',{Color=am.value and am.window.theme.AccentStroke or Color3.fromRGB(255,255,255),Transparency=1,Parent=am.
indicator})am.indicatorGlow=b:CreateGlow(am.indicator,'AccentColor',20,1)am.overlay=b:Create('Frame',{BorderSizePixel=0,
Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0,0),AnchorPoint=Vector2.new(0,0),BackgroundColor3=Color3.fromRGB(255
,255,255),BackgroundTransparency=1,Parent=am.functionContainer},{Visible='DarkToggleOverlay'})b:Create('UICorner',{
CornerRadius=UDim.new(0,15),Parent=am.overlay})am.overlayGradient=b:Create('UIGradient',{Rotation=90,Color=ColorSequence
.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),ColorSequenceKeypoint.new(1,Color3.fromRGB(30,30,30))},
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0.35)},Parent=am.overlay})
return am.functionContainer end function ae._performToggle(am)al.click()am.value=not am.value am:_animateIndicator()am.
window:_runGuarded(am,am.callback,am.value)am.window:_persist(am)end function ae._buildFull(am)local an=am.window am.
main=an:Create('Frame',{Size=UDim2.new(1,-20,0,am.rowHeight),BorderSizePixel=0,Name=am.name,BackgroundColor3=Color3.
fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.tab.tabPage},{BackgroundTransparency='ElementTransparency'})am.
stroke=an:StyleElementBody(am.main)am.hoverOverlay=an:CreateHoverOverlay(am.main)am.container=an:Create('Frame',{
BorderSizePixel=0,Parent=am.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5
),BackgroundTransparency=1})am.containerLayout=an:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,Parent=am.container})if am.icon then am.iconLabel=an:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,16
),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=am.container},{ImageColor3='ContentColor'})end
am.title=an:Create('TextLabel',{Text=ak.t(am.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=am.container},{TextColor3='ContentColor',FontFace='Font'})am.
interact=an:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),BorderSizePixel=0,Position=UDim2.
fromScale(1,0.5),AnchorPoint=Vector2.new(1,0.5),TextTransparency=1,ZIndex=10,Parent=am.main})am:_buildSwitch(am.main)am.
functionContainer.Position=UDim2.new(1,-15,0.5,0)am.functionContainer.AnchorPoint=Vector2.new(1,0.5)am.window:
_wireElementHover(am)am.window:ConnectFor(am,am.interact.MouseButton1Click,function()ag.tweenService:Create(am.stroke,
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()am.window:_pressSqueeze(am,
true)am:_performToggle()task.wait(0.11)am.window:_pressSqueeze(am,false)ag.tweenService:Create(am.stroke,TweenInfo.new(
0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=am.window.theme.ElementStrokeTransparency}):Play()
end)end function ae._buildCompact(am)local an=am.window am.main,am.stroke,am.interact=an:_buildCompactRow(am.tab,am.name
,10)am.hoverOverlay=am.interact an:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=am.
interact})an:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment
.Center,HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=am.interact})am.container=an:
Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=
0,LayoutOrder=0,Parent=am.interact})an:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=am.container})an:
Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=am.container})if am.icon then am.
iconLabel=an:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,
LayoutOrder=0,ImageTransparency=1,Parent=am.container},{ImageColor3='ContentColor'})end am.title=an:Create('TextLabel',{
Text=ak.t(am.name),Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,
LayoutOrder=1,TextTransparency=1,Parent=am.container},{TextColor3='ContentColor',FontFace='Font'})an:Create('UIFlexItem'
,{FlexMode=Enum.UIFlexMode.Shrink,Parent=am.title})am:_buildSwitch(am.interact)am.functionContainer.LayoutOrder=1 am.
window:_wireElementHover(am)am.window:ConnectFor(am,am.interact.MouseButton1Click,function()ag.tweenService:Create(am.
stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()am:_performToggle()
task.wait(0.11)ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
Transparency=am.window.theme.ElementStrokeTransparency}):Play()end)end function ae._animateIndicator(am)local an=
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)if am.indicatorGlow then ag.tweenService:Create(
am.indicatorGlow,an,{Transparency=am.value and am.window.theme.AccentGlow or 1}):Play()end if am.value then ag.
tweenService:Create(am.indicator,an,{Position=UDim2.new(1,-28,0.5,0),BackgroundColor3=am.window.theme.AccentColor,
BackgroundTransparency=0}):Play()ag.tweenService:Create(am.indicatorStroke,an,{Color=am.window.theme.AccentStroke,
Transparency=0}):Play()else ag.tweenService:Create(am.indicator,an,{Position=UDim2.new(1,-47,0.5,0),BackgroundColor3=am.
window.theme.ToggleKnobOff,BackgroundTransparency=am.window.theme.ToggleKnobOffTransparency}):Play()ag.tweenService:
Create(am.indicatorStroke,an,{Color=Color3.fromRGB(255,255,255),Transparency=0.7}):Play()end end local am,an=TweenInfo.
new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out,0,false,0.35)function ae._setShown(b,c,d)local e=b.window if c then e:_revealCommon(b,d)e:_reveal(b.
indicator,{BackgroundColor3=b.value and e.theme.AccentColor or e.theme.ToggleKnobOff,BackgroundTransparency=b.value and
0 or e.theme.ToggleKnobOffTransparency},d,am)e:_reveal(b.indicatorStroke,{Color=b.value and e.theme.AccentStroke or
Color3.fromRGB(255,255,255),Transparency=b.value and 0 or 0.7},d,am)e:_reveal(b.indicatorGlow,{Transparency=b.value and
e.theme.AccentGlow or 1},d,an)e:_reveal(b.overlay,{BackgroundTransparency=0},d,am)e:_reveal(b.containerStroke,{
Transparency=0.85},d,am)e:_reveal(b.functionContainer,{BackgroundTransparency=e.theme.ToggleTrackTransparency},d,am)else
e:_hideCommon(b,d)e:_reveal(b.indicator,{BackgroundTransparency=1},d,am)e:_reveal(b.indicatorStroke,{Transparency=1},d,
am)e:_reveal(b.indicatorGlow,{Transparency=1},d,an)e:_reveal(b.overlay,{BackgroundTransparency=1},d,am)e:_reveal(b.
containerStroke,{Transparency=1},d,am)e:_reveal(b.functionContainer,{BackgroundTransparency=1},d,am)end end function ae.
_refreshTheme(b)local c,d,e=b.window.theme,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),ag.
tweenService e:Create(b.functionContainer,d,{BackgroundTransparency=c.ToggleTrackTransparency}):Play()e:Create(b.
indicator,d,{BackgroundColor3=b.value and c.AccentColor or c.ToggleKnobOff,BackgroundTransparency=b.value and 0 or c.
ToggleKnobOffTransparency}):Play()e:Create(b.indicatorStroke,d,{Color=b.value and c.AccentStroke or Color3.fromRGB(255,
255,255)}):Play()if b.indicatorGlow then e:Create(b.indicatorGlow,d,{Transparency=b.value and c.AccentGlow or 1}):Play()
end end function ae._minWidth(b)local c=90 if b.icon then c+=21 end c+=ah.textWidth(b.window.theme.Font,16,ak.resolve(b.
name))return c end ai(ae)aj(ae)function ae.Set(b,c,d)local e=b.value~=c b.value=c if e then b:_animateIndicator()end if
not d then b.window:_runGuarded(b,b.callback,b.value)b.window:_persist(b)end end return ae end)()end,[32]=function()
local aa,ab,ac=a(32)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am,an,b,c,
d,e,f,g,h,i,j=ac(ae.image),ac(ae.functions),ac(ae.persistence),ac(ae.constants),ac(ae.locale),ac(ae.log),ac(ae.
HapticEngine),ac(ae.windowSizing),ac(ae.imageCache),ac(ae.services),ac(ae.layouts),ac(ab.Parent.chrome),ac(ab.Parent.
search),ac(ab.Parent.sidebar),ac(ae.variables),ac(ae.pointer),ab.Parent.Parent.themes,{}j.__index=j local k,l,m,n,o=
TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.fromOffset(185,50),UDim2.fromOffset(50,50
),UDim2.new(0.5,0,0,20),UDim2.new(0.5,0,0,12)local p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J=UDim2.new(0.5,0,0,n.Y.
Offset+l.Y.Offset+12),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),320,41,0.55,0.55,0.04,8,2,8,80,
20,24,5,0.8,0.8,16,28,5,32,0.45 function j._fillGameSubtitle(K)task.spawn(function()local L,M=pcall(function()return b.
getService'MarketplaceService':GetProductInfo(game.PlaceId)end)local N=if L and type(M)=='table'and type(M.Name)==
'string'then M.Name else nil if not N or N==''or K.unloaded or not K.subtitle or not K._subtitleIsGame then return end
if utf8.len(N)and(utf8.len(N)::number)>I then N=string.sub(N,1,(utf8.offset(N,I)::number)-1)..'...'end K.subtitle.Text=N
end)end function j.SetName(K,L:string)K.name=L if K.title then K.title.Text=aj.resolve(L)end if K._pillFollowsName then
K.showName=L if K.collapsedTitle then K.collapsedTitle.Text=L end end end function j.SetSubtitle(K,L:string?)K.
_subtitleIsGame=false if K.subtitle then K.subtitle.Text=if L then aj.resolve(L)else''K.subtitle.Visible=L~=nil and L~=
''end end local K,L,M,N='https://discord.gg/Bukn7UyvKx',-1E5,180,1 local function O(P):(UDim2,number)local Q=g.workspace
.CurrentCamera local R=Q and Q.ViewportSize local S=am.scale(R,g.userInputService.TouchEnabled)return am.fit(R,P,S),S
end local P,Q={'TopLeftRadius','TopRightRadius','BottomLeftRadius','BottomRightRadius'},(function()return(pcall(function
()local P=Instance.new'UICorner'P.TopLeftRadius=UDim.new(0,1)P:Destroy()end))end)()local function R(S)return if S then c
.sidebar else c.top end local S={WindowColor=true,ElementGradient=true,ElementStrokeGradient=true,TabBackground=true,
TabStroke=true,SliderProgress=true}local function T(U,V)if S[U]and typeof(V)=='Color3'then return ColorSequence.new(V)
end return V end local function U(V)return if typeof(V)=='ColorSequence'then V.Keypoints[1].Value else V end
local function V(W,X)local Y=W._toastsTop if not Y then return end local Z=if W._collapsedShown then p else o if not X
or Y.Position==Z then Y.Position=Z return end g.tweenService:Create(Y,q,{Position=Z}):Play()end local function W(X,Y)
local Z=0.299*X.R+0.587*X.G+0.114*X.B local _=if Z>0.5 then Color3.new(0,0,0)else Color3.new(1,1,1)return X:Lerp(_,Y)end
local function X(Y,Z)if Z.ElementGradient then local _=U(Y.ElementGradient)if Z.ElementStroke==nil then Y.ElementStroke=
W(_,0.28)end if Z.ElementStrokeGradient==nil then Y.ElementStrokeGradient=ColorSequence.new(W(_,0.4))end if Z.
ElementStrokeHover==nil then Y.ElementStrokeHover=W(_,0.52)end end if Z.TabBackground and Z.TabStroke==nil then Y.
TabStroke=ColorSequence.new(W(U(Y.TabBackground),0.4))end end local function Y(Z)if typeof(Z)=='table'then return Z
elseif typeof(Z)=='string'then local _=i:FindFirstChild(string.lower(Z))if _ then return ac(_)end ak.warn(
"Rayfield: unknown theme '"..Z.."', using default")elseif Z~=nil then ak.warn
[[Rayfield: invalid theme (expected a built-in name or a theme table), using default]]end return ac(i.default)end
local function Z(_)local ao,ap=table.clone(ac(i.default)),Y(_)for aq,ar in ap do ao[aq]=T(aq,ar)end if typeof(_)==
'table'then X(ao,ap)end local aq=if typeof(_)=='table'then _ else nil if not(aq and(aq.Font or aq.font))then ao.Font=g.
brandFont(Enum.FontWeight.Medium)end if not(aq and(aq.TitleFont or aq.titleFont))then ao.TitleFont=g.brandFont(Enum.
FontWeight.SemiBold)end return ao end function j.new(ao)ao=if typeof(ao)=='table'then ao else{}if ao.translations or ao.
Translations then aj.register(ao.translations or ao.Translations)end if ao.translator or ao.Translator then aj.
translator=ao.translator or ao.Translator end aj.setActive(ao.locale or ao.Locale or aj.detect())local ap=ao.
fallbackFont or ao.FallbackFont if ap then g.setFallbackFont(ap)end local aq=R(ao.sidebarLayout or ao.SidebarLayout)
local ar,_=O(aq.mode)local as=ao.icon if as==nil then as=ao.Icon end if as==nil then as=an.logo()elseif as==false then
as=nil end local at=setmetatable({name=ao.name or ao.Name or'Astris Hub',subheading=if(ao.subtitle or ao.Subtitle)~=nil
then(ao.subtitle or ao.Subtitle)or nil else'',_subtitleIsGame=(ao.subtitle or ao.Subtitle)==nil,layout=aq,size=ar,scale=
_,_overlayScales={},instances={},connections={},icon=as,showName=ao.showName or ao.ShowName or'Astris Hub',
_pillFollowsName=false,showIcon=ao.showIcon or ao.ShowIcon or as or ai.icons.rayfield,showIconOnly=ao.showIconOnly or ao
.ShowIconOnly or false,profileText=ao.profile or ao.Profile,themeProperties={},localeProperties={},tabs={},tabSections={
},tags={},selectedTab=nil,theme=Z(ao.theme or ao.Theme),controls={},configuration=(function()local at=ao.configuration
or ao.Configuration if not at then return{}end return{autoSave=at.autoSave or at.AutoSave,autoLoad=at.autoLoad or at.
AutoLoad,fileName=at.fileName or at.FileName,customFolder=at.customFolder or at.CustomFolder}end)()},j)at.Flags=
setmetatable({},{__index=function(au,av)local aw=at.controls[av]return aw and aw.value end,__newindex=function(au,av,aw)
local ax=at.controls[av]if not ax then ak.warn("Rayfield: no flag '"..tostring(av).."' to set")return end ax:Set(aw)end,
__iter=function()local au return function()local av au,av=next(at.controls,au)if au then return au,av.value end return
nil end end})at.settings={toggleKeybind=Enum.KeyCode.K,mouseOverride=true,keepOnScreen=false,welcomeToast=true,haptics=
true,showProfile=true}at.screenGui=at:Create('ScreenGui',{Name=g.httpService:GenerateGUID(false),IgnoreGuiInset=true,
ResetOnSpawn=false,Enabled=true,DisplayOrder=ai.displayOrder.window,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=g.
guiContainer})at.main=at:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Name=at.name,ZIndex=1,AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset((at.size.X.Offset-50),0),
BackgroundTransparency=1,Visible=false,Parent=at.screenGui})at.uiScale=at:Create('UIScale',{Scale=at.scale,Parent=at.
main})at.drag=ac(ab.Parent.drag).new(at)at.windowCorner=at:Create('UICorner',{Parent=at.main},{CornerRadius=
'CornerRoundness'})at.windowStroke=at:Create('UIStroke',{Transparency=1,Parent=at.main},{Color='SurfaceStroke'})at.
windowGradient=at:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=at.main},{Color={'WindowColor',ag.
toColorSequence}})at.bottomFade=at:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
AnchorPoint=Vector2.new(1,1),Position=UDim2.fromScale(1,1),Size=at.layout.fadeSize,ZIndex=ai.zIndex.bottomFade,
BackgroundTransparency=1,Parent=at.main})at.bottomFadeCorner=at:_roundCorners(at.bottomFade,at.layout.fadeCorners)at.
bottomFadeGradient=at:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,0.2),Transparency=at.layout.
fadeTransparency,Parent=at.bottomFade},{Color={'WindowColor',function(au)return ColorSequence.new(ag.toColorSequence(au)
.Keypoints[1].Value)end}})at.topbar=at:Create('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,at.layout.
topbarHeight),Active=true,Parent=at.main})at.topContainer=at:Create('Frame',{Size=UDim2.new(0,300,0,24),Position=UDim2.
new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.Y,AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Parent=at.
topbar})at.topContainerLayout=at:Create('UIListLayout',{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=
Enum.SortOrder.LayoutOrder,Parent=at.topContainer})at.titleContainer=at:Create('Frame',{Size=UDim2.fromOffset(50,24),
Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.XY,AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency
=1,LayoutOrder=1,Parent=at.topContainer})at.titleContainerLayout=at:Create('UIListLayout',{Padding=UDim.new(0,3),
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.
LayoutOrder,Parent=at.titleContainer})if at.name then at.title=at:Create('TextLabel',{Text=aj.t(at.name),FontFace=g.
brandFont(Enum.FontWeight.Medium),Size=UDim2.fromOffset(50,20),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency
=1,TextSize=20,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=at.titleContainer},{
FontFace='Font',TextColor3='TitlingColor'})end if at.icon then at.topbarIcon=at:Create('ImageLabel',{Image=at.icon,
BackgroundTransparency=1,Size=UDim2.fromOffset(42,42),ImageTransparency=1,Parent=at.topContainer},{ImageColor3=
'TitlingColor'})end if at.subheading then at.subtitle=at:Create('TextLabel',{Text=aj.t(at.subheading),Size=UDim2.
fromOffset(50,12),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=12,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=at.titleContainer},{TextColor3='TitlingColor',FontFace=
'Font'})if at._subtitleIsGame then at:_fillGameSubtitle()end end at.tagContainer=at:Create('Frame',{AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,25,0.5,0),Size=UDim2.fromOffset(50,24),AutomaticSize=Enum.AutomaticSize.XY,
BackgroundTransparency=1,LayoutOrder=2,Visible=false,Parent=at.topContainer})at.tagContainerLayout=at:Create(
'UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=at.tagContainer})at.windowShadow=at:CreateGlow(at.
main,'ShadowColor',20,1)at.elements=at:Create('Frame',{Size=UDim2.new(1,0,1,-at.layout.chromeHeight),Position=UDim2.
fromScale(1,1),AnchorPoint=Vector2.new(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
BackgroundTransparency=1,ClipsDescendants=true,Parent=at.main})if at.layout.mode=='sidebar'then at.elementsCorner=at:
_roundCorners(at.elements,at.layout.cardCorners)at.elementsStroke=at:Create('UIStroke',{ApplyStrokeMode=Enum.
ApplyStrokeMode.Border,Transparency=1,Parent=at.elements},{Color='SurfaceStroke'})at:Create('UIGradient',{Rotation=at.
layout.cardStrokeRotation,Transparency=at.layout.cardStrokeTransparency,Parent=at.elementsStroke})end at.elementsLayout=
at:Create('UIPageLayout',{Padding=UDim.new(0,0),FillDirection=at.layout.pageDirection,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
ScrollWheelInputEnabled=false,GamepadInputEnabled=false,TouchInputEnabled=false,EasingStyle=Enum.EasingStyle.Exponential
,TweenTime=0.4,Parent=at.elements})if at.layout.mode=='sidebar'then f.build(at,at.layout)f.applyWidth(at,c.railWidthFor(
at.layout,at.size.X.Offset))else at.tabList=at:Create('ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,0,at.
layout.tabStripHeight),Position=UDim2.new(0.5,0,0,at.layout.tabStripTop),AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.X,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,
ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.X,Parent=at.main})at.tabListLayout=at:Create(
'UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=
at.tabList})at:Create('UIPadding',{PaddingLeft=UDim.new(0,22),PaddingRight=UDim.new(0,10),Parent=at.tabList})end at.
actionContainer=at:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,24),Position=UDim2.new(1,-20,0.5,0),BackgroundTransparency=1,Parent=at.topbar})at.actionsListLayout=at:
Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Right,SortOrder=Enum.SortOrder.LayoutOrder,Parent=
at.actionContainer})at.rfSettings=at:CreateTab{name='Rayfield Settings',customOrder=1000,neglectSelector=true,
forgetState=true}ac(ab.Parent.action).new(at,{name='Close',icon=ai.icons.close,order=1,callback=function()at:ToggleHide(
)end})at.minimiseAction=ac(ab.Parent.action).new(at,{name='Minimise',icon=ai.icons.minimise,order=2,callback=function()
at:ToggleMinimise()end})local au=an.layoutIcon()if au then at.layoutAction=ac(ab.Parent.action).new(at,{name='Layout',
icon=au,order=4,callback=function()if at._requestRelayout then task.defer(at._requestRelayout)end end})end at.
settingsAction=ac(ab.Parent.action).new(at,{name='Settings',icon=ai.icons.settings,order=3,linkedTab=at.rfSettings,
callback=function()at.rfSettings:Select()end})e.build(at)at:_applyRailWidth()at.unloaded=false at.minimised=false at.
hidden=true at.animating=false at._revealing=false at.hasShownOnce=false at._collapsedShown=false at:LoadSettings()if at
.layout.mode=='sidebar'then f.reflowProfile(at)f.setSubtitle(at,at.profileText)end al.setContainer(at.screenGui)al.
setEnabled(at.settings.haptics)d.buildCollapsedFace(at)at:_bindKeybind()at:_bindMouseOverride()at:_bindTopbarDrag()at:
_watchViewport()at:_buildSettingsUI()at.discordInvite=ao.discordInvite or ao.DiscordInvite or K if ao.homeTab~=false and
ao.HomeTab~=false then at:_buildHomeTab()end if ao.discordReminder~=false and ao.DiscordReminder~=false then at:
_startDiscordReminder()end if ao.themeTab~=false and ao.ThemeTab~=false then at:_buildThemeTab()end if at.settings.theme
then at:ChangeTheme(at.settings.theme)end at:_syncLiveAnimation()return at end local function ao():number local ap,aq=
pcall(function()return b.getService'Stats'.Network.ServerStatsItem['Data Ping']:GetValue()end)if ap and type(aq)==
'number'then return aq end local ar=g.localPlayer local as,at=pcall(function()return ar:GetNetworkPing()end)return if as
and type(at)=='number'then at*2000 else 0 end local function ap():number local aq,ar=pcall(function()return#b.getService
'Players':GetPlayers()end)return if aq then ar else 0 end function j._buildHomeTab(aq)aq.homeTab=aq:CreateTab{name=
'Home',icon=ai.icons.home,customOrder=L,builtIn=true,keepSelection=true,forgetState=true}local ar=aq.homeTab:CreateGroup
{direction='row'}local as,at,au=ar:CreateStat{name='FPS',value=60,numberEasing=false},ar:CreateStat{name='Ping',value=0,
suffix=' ms',numberEasing=false},ar:CreateStat{name='Players',value=ap(),numberEasing=false}aq.homeTab:CreateDiscord{
name='Astris Hub',invite=aq.discordInvite,text=
[[Join the Discord server
The cleanest and most powerful hub
The most overpowered hub, supporting 30+ games]],
showMembers=false}local av,aw=0,0 aq:Connect(g.runService.Heartbeat,function(ax:number)av+=1 aw+=ax if aw<N then return
end as:Set(math.round(av/aw))at:Set(math.round(ao()))au:Set(ap())av,aw=0,0 end)end function j._startDiscordReminder(aq)
local ar,as=string.gsub(aq.discordInvite,'^https?://',''),0 aq:Connect(g.runService.Heartbeat,function(at:number)as+=at
if as<M then return end as=0 aq:Notify{title='Join the Astris Hub Discord',content=ar,icon=ai.icons.discord}end)end
local aq,ar=100000,{'Default','Amethyst','Cobalt','Ember','Frost','Rose'}function j._buildThemeTab(as)as.themeTab=as:
CreateTab{name='Theme',icon=ai.icons.palette,customOrder=aq,builtIn=true,forgetState=true}local at='Default'for au,av in
ar do if string.lower(av)==as.settings.theme then at=av end end as.themeTab:CreateDropdown{name='Theme',description=
'Changes the look of this menu. Saved for next time.',options=ar,currentOption=at,callback=function(au)if typeof(au)~=
'string'then return end as.settings.theme=string.lower(au)as:ChangeTheme(as.settings.theme)as:SaveSettings()end}task.
defer(function()if not as.unloaded and not as.selectedTab and as.themeTab then as.themeTab:Select(true)end end)end
function j._syncLiveAnimation(as)if not as.theme.LiveAnimation then as._liveAnimating=false return end if as.
_liveAnimating then return end as._liveAnimating=true as._liveGeneration=(as._liveGeneration or 0)+1 local at=as.
_liveGeneration task.spawn(function()local au,av=true,TweenInfo.new(10,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
while as._liveGeneration==at and as._liveAnimating and not as.unloaded do local aw=g.tweenService:Create(as.
windowGradient,av,{Offset=Vector2.new(if au then 0.4 else-0.2,0),Rotation=(if au then 220 else 280)})as._liveTween=aw aw
:Play()aw.Completed:Wait()au=not au end if as._liveGeneration==at then as._liveAnimating=false as._liveTween=nil end end
)end function j.ChangeTheme(as,at)local au=if typeof(at)=='table'then at else Z(at)for av,aw in au do as.theme[av]=T(av,
aw)end if typeof(at)=='table'then X(as.theme,au)end for av,aw in as.themeProperties do for ax,_ in aw do local ay=if
typeof(_)=='table'then _[2](as.theme[_[1] ])else as.theme[_]if typeof(ay)=='Color3'or typeof(ay)=='number'then g.
tweenService:Create(av,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{[ax]=ay}):Play()else av[ax]=
ay end end end if as.hidden then as._themeRefreshPending=true else as:_refreshElementThemes()end as:_syncLiveAnimation()
end function j._refreshElementThemes(as)for at,au in as.tabs do for av,aw in au.elements do if aw._refreshTheme then aw:
_refreshTheme()end end end end function j.CreateTab(as,at)assert(not as.unloaded,
'Cannot create a tab on an unloaded window.')local au=ac(ab.Parent.tab).new(as,at)table.insert(as.tabs,au)if not au.
neglectSelector then local av=not au.builtIn or au.keepSelection for aw,ax in as.tabs do if ax~=au and not ax.
neglectSelector and(not ax.builtIn or ax.keepSelection)then av=false break end end if av then au:Select(true)end if not
as.hidden and not as.minimised then au.topbarItem.Visible=true au:_applyVisual(if as.selectedTab==au then'selected'else
'unselected',TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end end return au end function j.
CreateSection(as,at)assert(not as.unloaded,'Cannot create a section on an unloaded window.')local au=ac(ab.Parent.
tabSection).new(as,at)table.insert(as.tabSections,au)if not au.inert and not as.hidden and not as.minimised then au:
_setVisible(true)au:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end return au end
function j._setTabSectionsShown(as,at,au)for av,aw in as.tabSections do aw:_setShown(at,au)end end function j.
_setTabSectionsVisible(as,at)for au,av in as.tabSections do av:_setVisible(at)end end function j.CreateTag(as,at)assert(
not as.unloaded,'Cannot create a tag on an unloaded window.')local au=ac(ab.Parent.tag).new(as,at)table.insert(as.tags,
au)return au end function j._registerControl(as,at)if not at.flag or at.flag==''or at.forgetState then return end local
au=at.flag if as.controls[au]then local av=2 while as.controls[au..av]do av+=1 end au=au..av ak.warn(
"Rayfield: duplicate config flag '"..at.flag.."', saving this one as '"..au..
"'. Set a unique flag to keep it stable across sessions.")end at.flag=au as.controls[au]=at return au end function j.
_restoreLate(as,at)if not as._loadedConfig or not at.flag or at.forgetState then return end local au=as._loading as.
_loading=true ah.applyTo(at,as._loadedConfig[at.flag])as._loading=au end function j._persist(as,at)if at.flag and not at
.forgetState and as.configuration.autoSave and not as._loading then task.spawn(as.Save,as)end end function j.
_unregisterControl(as,at)if at.flag and as.controls[at.flag]==at then as.controls[at.flag]=nil end end function j.
_keybindUsing(as,at,au)if typeof(at)~='EnumItem'or at==Enum.KeyCode.Unknown then return nil end for av,aw in as.tabs do
for ax,ay in aw.elements do if ay~=au and ay.__type=='Keybind'and ay.value==at then return ay end end end return nil end
function j.Notify(as,at)if as.unloaded then return end if not as.notifications then as.notifications=as:Create('Frame',{
Name='Notifications',Size=UDim2.new(0,300,0,800),Position=UDim2.new(1,-20,0,g.guiService:GetGuiInset().Y+12),AnchorPoint
=Vector2.new(1,0),BackgroundTransparency=1,Parent=as.screenGui})as:_scaleOverlay(as.notifications)as:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,
HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=as
.notifications})end return ac(ab.Parent.notification).new(as,at)end function j.Toast(as,at)if as.unloaded then return
end at=if typeof(at)=='table'then at else{}local au=at.position or at.Position or'Top'local av=typeof(au)~='string'or au
:lower()~='bottom'at.position=if av then'Top'else'Bottom'local aw=if av then'_toastsTop'else'_toastsBottom'local ax=as[
aw]if not ax then ax=as:Create('Frame',{Name='Toasts',Size=UDim2.new(0,r,1,-24),Position=if av then o else UDim2.new(0.5
,0,1,-12),AnchorPoint=if av then Vector2.new(0.5,0)else Vector2.new(0.5,1),BackgroundTransparency=1,ZIndex=ai.zIndex.
toast,Parent=as.screenGui})as:_scaleOverlay(ax)as:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=if av then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=ax})as[aw]=ax if av then V(
as,false)end end return ac(ab.Parent.toast).new(as,at,ax)end function j.Popup(as,at)if as.unloaded then return end
return ac(ab.Parent.popup).new(as,at)end function j.Hide(as)if as.animating or as.hidden then return end if as.
_searching then e.close(as,{showTabs=false,jumpTo=as.selectedTab and as.selectedTab.tabPage})end if as._recordingKeybind
then as._recordingKeybind:_stopRecording()end as.animating=true as._revealing=true as.hidden=true as.collapsedInteract.
Visible=false if as.minimised then as.minimised=false af.assign(as.minimiseAction.iconLabel,'Image',ai.icons.minimise)
end as._restorePosition=as.main.Position local at,au=as:_collapsedRect()local av,aw,ax,ay=TweenInfo.new(0.18,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),
TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.2,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out)g.tweenService:Create(as.drag.dragCosmetic,av,{Size=UDim2.fromOffset(0,4),
BackgroundTransparency=1}):Play()task.delay(0.18,function()if not as.hidden then return end as.drag.drag.Visible=false
end)as:_fadeSurfaces(false,av)if as.title then g.tweenService:Create(as.title,av,{TextTransparency=1}):Play()end if as.
subtitle then g.tweenService:Create(as.subtitle,av,{TextTransparency=1}):Play()end if as.topbarIcon then g.tweenService:
Create(as.topbarIcon,av,{ImageTransparency=1}):Play()end for _,az in ipairs(as.actionContainer:GetChildren())do if az:
IsA'Frame'then g.tweenService:Create(az.ImageLabel,av,{ImageTransparency=1}):Play()end end for az,_ in as.tags do _:
_setShown(false,av)end for az,_ in pairs(as.tabs)do if not _.neglectSelector and _.topbarItem then _:_applyVisual(
'hidden',av)end end as:_setTabSectionsShown(false,av)as:_fadeSelectedElementsOut()local az=g.tweenService:Create(as.main
,aw,{Size=au,Position=at})g.tweenService:Create(as.uiScale,aw,{Scale=as:_pillScale()}):Play()az.Completed:Connect(
function()if as.unloaded or not as.hidden then return end as._collapsedShown=true V(as,true)as.collapsedInteract.Visible
=true as.animating=false as._revealing=false end)az:Play()g.tweenService:Create(as.windowCorner,ax,{CornerRadius=UDim.
new(1,0)}):Play()task.delay(0.18,function()if not as.hidden then return end as.topbar.Visible=false as:
_setContentVisible(false)d.setCollapsedShown(as,true,ay)end)end function j.ToggleHide(as)if as.animating then return end
if as.hidden then as:Show()else as:Hide()end end function j.ToggleMinimise(as)if as.animating or as.hidden then return
end if as._searching then e.close(as,{showTabs=true})end as.animating=true local at,au=TweenInfo.new(0.5,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out)if as.minimised then as.minimised=false af.assign(as.minimiseAction.iconLabel,'Image',ai.icons.minimise)local av=as:
_headerAnchored(as.main.Position,as.layout.topbarHeight,as.size.Y.Offset)g.tweenService:Create(as.main,at,{Size=as.size,
Position=av}):Play()as:_fadeSurfaces(true,au)g.tweenService:Create(as.drag.drag,at,{Position=UDim2.new(av.X.Scale,av.X.
Offset,av.Y.Scale,av.Y.Offset+as.size.Y.Offset*as.scale/2+15)}):Play()task.delay(0.2,function()if as.minimised or as.
hidden then return end as:_setContentVisible(true)for aw,ax in pairs(as.tabs)do if not ax.neglectSelector and ax.
topbarItem then ax.topbarItem.Visible=true ax:_applyVisual(if as.selectedTab==ax then'selected'else'unselected',au)end
end as:_setTabSectionsVisible(true)as:_setTabSectionsShown(true,au)as:_revealElements(0.035,0.4)end)task.delay(0.5,
function()as.animating=false end)else as.minimised=true af.assign(as.minimiseAction.iconLabel,'Image',ai.icons.maximise)
as:_fadeSelectedElementsOut()for av,aw in pairs(as.tabs)do if not aw.neglectSelector and aw.topbarItem then aw:
_applyVisual('hidden',au)end end as:_setTabSectionsShown(false,au)task.delay(0.3,function()if not as.minimised then
return end as:_setContentVisible(false)for av,aw in pairs(as.tabs)do if not aw.neglectSelector and aw.topbarItem then aw
.topbarItem.Visible=false end end as:_setTabSectionsVisible(false)end)as:_fadeSurfaces(false,au)local av=as:
_headerAnchored(as.main.Position,as.size.Y.Offset,as.layout.topbarHeight)g.tweenService:Create(as.main,at,{Size=UDim2.
fromOffset(as.size.X.Offset,as.layout.topbarHeight),Position=av}):Play()g.tweenService:Create(as.drag.drag,at,{Position=
UDim2.new(av.X.Scale,av.X.Offset,av.Y.Scale,av.Y.Offset+as.layout.topbarHeight*as.scale/2+15)}):Play()task.delay(0.5,
function()as.animating=false end)end end function j._syncDragBar(as)local at=as.drag and as.drag.drag if not at then
return end local au,av=as.main.Position,as.size.Y.Offset*as.scale/2+15 at.Position=UDim2.new(au.X.Scale,au.X.Offset,au.Y
.Scale,au.Y.Offset+av)end function j._fitCenter(as,at:number,au:number,av:Vector2):(number,number)local aw,ax,ay=as.
screenGui.AbsoluteSize,av.X/2,av.Y/2 local az=ay+y if as.settings and as.settings.keepOnScreen then at=math.clamp(at,ax+
y,math.max(ax+y,aw.X-ax-y))return at,math.clamp(au,az,math.max(az,aw.Y-ay-y))end local _=math.min(as.layout.topbarHeight
*as.scale,av.Y)at=math.clamp(at,z-ax,math.max(z-ax,aw.X-z+ax))return at,math.clamp(au,az,math.max(az,aw.Y-_+ay))end
function j._headerAnchored(as,at:UDim2,au:number,av:number):UDim2 local aw=as.screenGui.AbsoluteSize local ax,ay=at.X.
Scale*aw.X+at.X.Offset,at.Y.Scale*aw.Y+at.Y.Offset ay+=(av-au)*as.scale/2 local az=Vector2.new(as.size.X.Offset,av)*as.
scale ax,ay=as:_fitCenter(ax,ay,az)return UDim2.fromOffset(ax,ay)end function j._clampedPosition(as,at:UDim2):UDim2 if
at.X.Scale~=0 or at.Y.Scale~=0 then return at end local au=Vector2.new(as.size.X.Offset,as.size.Y.Offset)*as.scale local
av,aw=as:_fitCenter(at.X.Offset,at.Y.Offset,au)if av==at.X.Offset and aw==at.Y.Offset then return at end return UDim2.
fromOffset(av,aw)end function j._clampToScreen(as)as.main.Position=as:_clampedPosition(as.main.Position)end function j.
_applyWindowSize(as)if as.unloaded then return end local at,au=O(as.layout.mode)local av=at~=as.size or au~=as.scale as.
size=at as.scale=au if not as.hidden then as.uiScale.Scale=au end as:_applyActionSize()for aw=#as._overlayScales,1,-1 do
local ax=as._overlayScales[aw]if ax.instance.Parent then ax.instance.Scale=as:_overlayScale(ax.share)else table.remove(
as._overlayScales,aw)end end as:_applyRailWidth()if as.hidden or as.minimised or as.animating or as._revealing then as.
_pendingResize=as._pendingResize or av return end if not av and not as._pendingResize then return end as._pendingResize=
false as.main.Size=at as:_clampToScreen()as:_syncDragBar()end function j._pillScale(as):number return if as.scale<1 then
E else 1 end function j._overlayScale(as,at:number?):number return if as.scale<1 then as.scale*(at or D)else 1 end
function j._scaleOverlay(as,at:GuiObject,au:number?)local av=as:Create('UIScale',{Scale=as:_overlayScale(au),Parent=at})
table.insert(as._overlayScales,{instance=av,share=au})return av end function j._applyActionSize(as)if not as.
actionContainer then return end local at,au,av=A,B,C if as.scale<1 then at=math.round(F/as.scale)au=math.round(G/as.
scale)av=math.round(H/as.scale)end as.actionContainer.Size=UDim2.fromOffset(0,au)as.actionsListLayout.Padding=UDim.new(0
,av)for aw,ax in ipairs(as.actionContainer:GetChildren())do if ax:IsA'Frame'then ax.Size=UDim2.fromOffset(au,au)local ay
=ax:FindFirstChild'ImageLabel'if ay and ay:IsA'ImageLabel'then ay.Size=UDim2.fromOffset(at,at)end end end end function j
._applyRailWidth(as)if as.layout.mode~='sidebar'then return end f.applyWidth(as,c.railWidthFor(as.layout,as.size.X.
Offset))end function j._watchViewport(as)local at,au:RBXScriptConnection?=false local function av()if at then return end
at=true task.defer(function()at=false as:_applyWindowSize()end)end local function aw()if au then as:Disconnect(au)au=nil
end local ax=g.workspace.CurrentCamera if ax then au=as:Connect(ax:GetPropertyChangedSignal'ViewportSize',av)end av()end
as:Connect(g.workspace:GetPropertyChangedSignal'CurrentCamera',aw)aw()local ax=0 as:Connect(g.runService.Heartbeat,
function(ay:number)ax+=ay if ax<x then return end ax=0 as:_applyWindowSize()end)end function j._bindKeybind(as)as:
Connect(g.userInputService.InputBegan,function(at,au)if au or as._recordingKeybind then return end if at.KeyCode==as.
settings.toggleKeybind or at.UserInputType==as.settings.toggleKeybind then as:ToggleHide()end end)end function j.
_bindMouseOverride(as)local at=g.userInputService local function au()return as.settings.mouseOverride and not as.hidden
and not as.minimised end local function av()if not au()then return end if at:IsMouseButtonPressed(Enum.UserInputType.
MouseButton2)then return end if at.MouseBehavior~=Enum.MouseBehavior.Default then at.MouseBehavior=Enum.MouseBehavior.
Default end if not at.MouseIconEnabled then at.MouseIconEnabled=true end end as:Connect(at:GetPropertyChangedSignal
'MouseBehavior',av)as:Connect(at:GetPropertyChangedSignal'MouseIconEnabled',av)as:Connect(at.InputEnded,function(aw)if
aw.UserInputType==Enum.UserInputType.MouseButton2 then av()end end)as._freeMouse=av end function j._bindTopbarDrag(as)
local at,au,av,aw,ax=g.userInputService,false,Vector2.zero,(Vector2.zero)if as.screenGui and as.screenGui.IgnoreGuiInset
then aw=g.guiService:GetGuiInset()end local function ay()local az=h.location(ax)+av+aw local _,aA=as:_fitCenter(az.X,az.
Y,as.main.AbsoluteSize)return UDim2.fromOffset(_,aA)end local function az(aA,_)for aB,aC in{as.tabList,as.
actionContainer}do local aD,aE=aC.AbsolutePosition,aC.AbsoluteSize if aA>=aD.X and aA<=aD.X+aE.X and _>=aD.Y and _<=aD.Y
+aE.Y then return true end end return false end as:Connect(as.topbar.InputBegan,function(aA,aB)if aB then return end
local aC=aA.UserInputType.Name if aC~='MouseButton1'and aC~='Touch'then return end if az(aA.Position.X,aA.Position.Y)
then return end if not as:_interactive()then return end au=true if as.screenGui and as.screenGui.IgnoreGuiInset then aw=
g.guiService:GetGuiInset()end ax=aA av=as.main.AbsolutePosition+as.main.AbsoluteSize*as.main.AnchorPoint-h.location(aA)
end)as:Connect(at.InputEnded,function(aA)local aB=aA.UserInputType.Name if aB=='MouseButton1'or aB=='Touch'then au=false
end end)as:Connect(at.WindowFocusReleased,function()au=false end)as:Connect(g.runService.RenderStepped,function()if not
au then return end if not as:_interactive()then au=false return end as.main.Position=ay()if as.drag and as.drag.drag
then local aA=as.main.Position as.drag.drag.Position=UDim2.new(aA.X.Scale,aA.X.Offset,aA.Y.Scale,aA.Y.Offset+(as.main.
Size.Y.Offset*as.scale/2+15))end end)end function j._buildSettingsUI(as)as.rfSettings:CreateSection{name='General'}as.
rfSettings:CreateKeybind{name='Toggle Keybind',icon=ai.icons.search,value=as.settings.toggleKeybind,isMenuToggle=true,
onChanged=function(at)as.settings.toggleKeybind=at as:SaveSettings()end}as.rfSettings:CreateToggle{name=
'Unlock cursor while open',description=
[[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],value=as.settings.
mouseOverride,callback=function(at)as.settings.mouseOverride=at as:SaveSettings()end}as.rfSettings:CreateToggle{name=
'Welcome toast',description=[[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],value=as
.settings.welcomeToast,callback=function(at)as.settings.welcomeToast=at as:SaveSettings()end}as.rfSettings:CreateToggle{
name='Haptics',description=[[A subtle tap as you interact, on devices that support haptics.]],value=as.settings.haptics,
callback=function(at)as.settings.haptics=at al.setEnabled(at)as:SaveSettings()end}as.rfSettings:CreateSection{name=
'Window'}if as.layout.mode=='sidebar'and as.profile then as.rfSettings:CreateToggle{name='Show profile',description=
[[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
value=as.settings.showProfile,callback=function(at)f.setProfileEnabled(as,at)as:SaveSettings()end}end as.rfSettings:
CreateToggle{name='Keep window on screen',description=
[[Keeps the whole window on screen. Off, it can hang off the sides and bottom, but never the top.]],value=as.settings.
keepOnScreen,callback=function(at)as.settings.keepOnScreen=at as:SaveSettings()end}as.rfSettings:CreateButton{name=
'Reset Window Position',callback=function()g.tweenService:Create(as.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,0)}):Play()g.tweenService:Create(as.drag.drag,TweenInfo.new(0.5,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,as.size.Y.Offset*as.scale/2+15)}):
Play()end}if next(as.configuration)~=nil then as.rfSettings:CreateSection{name='Configurations'}local at,au,av=(as:
ListConfigs()[1])local function aw()local ax=as:ListConfigs()au:Refresh(ax)if at and not table.find(ax,at)then at=ax[1]
end if at then au:Set(at,true)end end au=as.rfSettings:CreateDropdown{name='Saved Configurations',icon=ai.icons.config,
options=as:ListConfigs(),value=at,placeholder='No saved configurations',callback=function(ax)at=ax end}av=as.rfSettings:
CreateInput{name='Configuration Name',description=
[[Name a new configuration, or leave blank to overwrite the selected one.]],placeholder='e.g. PvP Loadout',clearOnFocus=
false}local ax=as.rfSettings:CreateGroup()ax:CreateButton{name='Save',icon=ai.icons.config,callback=function()local ay=
av.value if ay==''then ay=at end if not ay or ay==''then as:Toast{title=aj.resolve'Name your configuration first'}return
end if as:Save(ay)then av:Set''at=ay aw()as:Toast{title=aj.resolve'Saved configuration',subtitle=ay,icon=ai.icons.config
}else as:Toast{title=aj.resolve"Couldn't save configuration",subtitle=ay}end end}ax:CreateButton{name='Load',callback=
function()if not at or at==''then as:Toast{title=aj.resolve'Pick a configuration to load'}return end if as:
_applyNamedConfig(at)then as:Toast{title=aj.resolve'Loaded configuration',subtitle=at}else as:Toast{title=aj.resolve
"Couldn't load configuration",subtitle=at}end end}ax:CreateButton{name='Delete',callback=function()local ay=at if not ay
or ay==''then as:Toast{title=aj.resolve'Pick a configuration to delete'}return end if as:DeleteConfig(ay)then aw()as:
Toast{title=aj.resolve'Deleted configuration',subtitle=ay}else as:Toast{title=aj.resolve"Couldn't delete configuration",
subtitle=ay}end end}end end function j.SetProfile(as,at)as.profileText=at f.setSubtitle(as,at)end function j.
SaveSettings(as)return ah.saveSettings(as)end function j.LoadSettings(as)return ah.loadSettings(as)end function j.
_roundCorners(as,at,au)if not au or not Q then return as:Create('UICorner',{Parent=at},{CornerRadius='CornerRoundness'})
end local av,aw={Parent=at},{}for ax,ay in P do av[ay]=UDim.new(0,0)end for ax,ay in au do av[ay]=nil aw[ay]=
'CornerRoundness'end return as:Create('UICorner',av,aw)end function j._setElementLocked(as,at,au,av)au=au==true local aw
=at.locked==true if aw==au and not(au and av)then return end at.locked=au if not at.lockScrim then as:_buildLockScrim(at
)end local ax=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)if au then at.lockScrim.Visible=true
end g.tweenService:Create(at.lockScrim,ax,{BackgroundTransparency=if au then t else 1}):Play()if not au then task.delay(
ax.Time,function()if not at.locked and at.lockScrim then at.lockScrim.Visible=false end end)end local ay=at.
richDescription or(at.descriptor and at.descriptor.titleLabel)if not ay then return end local az=if at.richDescription
then J else 0.7 if au then at._descriptionBefore=at._descriptionBefore or ay.Text ay.Text=aj.resolve(av or
'This element is locked.')elseif at._descriptionBefore then ay.Text=at._descriptionBefore at._descriptionBefore=nil end
g.tweenService:Create(ay,ax,{TextTransparency=if au then u else az}):Play()end function j._buildLockScrim(as,at)at.
lockScrim=as:Create('TextButton',{Name='ElementLock',Active=true,AutoButtonColor=false,Size=UDim2.fromScale(1,1),
BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=ai.zIndex.elementLock,Visible=false,BackgroundTransparency=1,Parent=
at.main},{BackgroundColor3={'WindowColor',U}})as:Create('UICorner',{Parent=at.lockScrim},{CornerRadius=
'ElementCornerRadius'})end function j._setContentVisible(as,at)as.elements.Visible=at as.tabList.Visible=at if as.
sidebar then as.sidebar.Visible=at end end function j._fadeSurfaces(as,at,au)local av={[as.windowShadow]={Transparency=
if at then 0.6 else 1},[as.windowStroke]={Transparency=if at then 0.95 else 1},[as.bottomFade]={BackgroundTransparency=
if at then 0 else 1}}if as.elementsStroke then av[as.elements]={BackgroundTransparency=if at then as.layout.
cardTransparency else 1}av[as.elementsStroke]={Transparency=if at then 0 else 1}end for aw,ax in av do if au then g.
tweenService:Create(aw,au,ax):Play()else for ay,az in ax do aw[ay]=az end end end f.setProfileShown(as,at,au)end
function j._fadeSelectedElementsOut(as)if as.selectedTab then for at,au in ipairs(as.selectedTab.elements)do au:
_setShown(false,true)end end end function j._revealElements(as,at,au)for av,aw in pairs(as.tabs)do if aw~=as.selectedTab
then for ax,ay in ipairs(aw.elements)do ay:_setShown(true,false)end end end local av=as.selectedTab if not av then
return end local aw=av.tabPage local ax=aw.AbsolutePosition.Y local ay,az,aA=ax+aw.AbsoluteWindowSize.Y,math.floor(au/at
),0 for aB,aC in ipairs(av.elements)do local aD=aC.main.AbsolutePosition.Y local aE=(aD+aC.main.AbsoluteSize.Y)>ax and
aD<ay if aE then aC:_setShown(true,true)aA+=1 if aA<=az then task.wait(at)end else aC:_setShown(true,false)end end end
function j.Show(as)if as.animating or not as.hidden then return end as.animating=true as._revealing=true if as.
configuration.autoLoad and not as._autoLoaded then as._autoLoaded=true local at,au=pcall(as.Load,as)if not at then ak.
warn('Rayfield: Failed to load configuration - '..tostring(au))end end as.hidden=false as.minimised=false if as.
_themeRefreshPending then as._themeRefreshPending=false as:_refreshElementThemes()end as.collapsedInteract.Visible=false
if as._freeMouse then as._freeMouse()end if as.hasShownOnce then as:_quickRestore()else as.hasShownOnce=true as:
_firstShow()end end function j._quickRestore(as)local at=as:_clampedPosition(as._restorePosition or UDim2.new(0.5,0,0.5,
0))as._restorePosition=at local au,av,aw=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),
TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.28,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out)d.setCollapsedShown(as,false,TweenInfo.new(0.15,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out))local ax=g.tweenService:Create(as.main,au,{Size=as.size,Position=at})g.tweenService:Create(as.
uiScale,au,{Scale=as.scale}):Play()ax.Completed:Connect(function()if as.hidden or as.unloaded then return end as.
_collapsedShown=false V(as,true)end)ax:Play()g.tweenService:Create(as.windowCorner,av,{CornerRadius=as.theme.
CornerRoundness}):Play()task.delay(0.22,function()as.topbar.Visible=true as:_setContentVisible(true)as:_fadeSurfaces(
true,aw)if as.topbarIcon then g.tweenService:Create(as.topbarIcon,aw,{ImageTransparency=0}):Play()end if as.title then g
.tweenService:Create(as.title,aw,{TextTransparency=0}):Play()end if as.subtitle then g.tweenService:Create(as.subtitle,
aw,{TextTransparency=0.7}):Play()end for ay,az in ipairs(as.actionContainer:GetChildren())do if az:IsA'Frame'then g.
tweenService:Create(az.ImageLabel,aw,{ImageTransparency=0.6}):Play()end end if as.settingsAction and as.selectedTab==as.
rfSettings then g.tweenService:Create(as.settingsAction.iconLabel,aw,{ImageTransparency=0.2}):Play()end for ay,az in as.
tags do az:_setShown(true,aw)end for ay,az in pairs(as.tabs)do if not az.neglectSelector and az.topbarItem then az.
topbarItem.Visible=true az:_applyVisual(if as.selectedTab==az then'selected'else'unselected',aw)end end as:
_setTabSectionsVisible(true)as:_setTabSectionsShown(true,aw)as:_revealElements(0.035,0.4)end)task.delay(0.22,function()
as.drag.drag.Position=UDim2.new(at.X.Scale,at.X.Offset,at.Y.Scale,at.Y.Offset+as.size.Y.Offset*as.scale/2+15)as.drag.
dragCosmetic.Size=UDim2.fromOffset(0,4)as.drag.dragCosmetic.BackgroundTransparency=1 as.drag.drag.Visible=true g.
tweenService:Create(as.drag.dragCosmetic,au,{Size=UDim2.fromOffset(100,4),BackgroundTransparency=0.7}):Play()end)task.
delay(0.6,function()as.animating=false as._revealing=false end)end function j._firstShow(as)as:_setContentVisible(true)
as.uiScale.Scale=as.scale as.drag.drag.Visible=false as.main.Visible=true g.tweenService:Create(as.main,TweenInfo.new(1,
Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),{BackgroundTransparency=0,Size=as.size}):Play()task.wait(0.85)
as:_fadeSurfaces(true,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))task.wait(0.3)if as.icon
then g.tweenService:Create(as.topbarIcon,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
ImageTransparency=0}):Play()end if as.title then g.tweenService:Create(as.title,TweenInfo.new(0.4,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),{TextTransparency=0}):Play()end task.wait(0.1)if as.subtitle then g.tweenService:
Create(as.subtitle,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0.7}):
Play()end for at,au in ipairs(as.actionContainer:GetChildren())do if au:IsA'Frame'then task.wait(0.02)g.tweenService:
Create(au.ImageLabel,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0.6}):
Play()end end for at,au in as.tags do au:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out))end task.wait(0.2)task.spawn(function()local at=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)as:_setTabSectionsVisible(true)as:_setTabSectionsShown(true,at)local au=0 for av,aw in pairs(as.tabs
)do if not aw.neglectSelector then aw.topbarItem.Visible=true aw:_applyVisual(if as.selectedTab==aw then'selected'else
'unselected',at)aw:_spinGradients()au+=1 if au<=w then task.wait(v)end end end end)as:_revealElements(0.03,2)task.wait(1
)as:_syncDragBar()as.drag.drag.Visible=true g.tweenService:Create(as.drag.dragCosmetic,TweenInfo.new(0.6,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=0.7}):Play()g.tweenService:Create(as.drag.
dragCosmetic,TweenInfo.new(1,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.fromOffset(100,4)}):
Play()as.animating=false as._revealing=false local at=g.localPlayer if at and as.settings.welcomeToast and d.isNewUser()
then as:Toast{title=at.DisplayName,subtitle=aj.resolve'Signed in as',subtitleAbove=true,avatar=at.UserId,minWidth=220}
end end function j.GetPath(as)return ah.getPath(as)end function j.Save(as,at)if at~=nil and(type(at)~='string'or at=='')
then return false end return ah.save(as,at)end function j.Load(as,at)if at~=nil and(type(at)~='string'or at=='')then
return false end return ah.load(as,at)end function j._applyNamedConfig(as,at)if not as:Load(at)then return false end
local au,av=ah.getPath(as)as._loadedConfigPath=av as:Save()return true end function j.ListConfigs(as)return ah.list(as)
end function j.DeleteConfig(as,at)return ah.delete(as,at)end function j.Get(as,at)local au=as.controls[at]return au and
au.value end function j.Set(as,at,au)local av=as.controls[at]if not av then return false end av:Set(au)return true end
function j._jumpTo(as,at)if at then as.elementsLayout:JumpTo(at)end end function j.Navigate(as,at)if at==nil then return
end local au for av,aw in as.tabs do if aw==at or aw.name==at or aw.tabPage==at then au=aw break end end if not au then
return end au:Select()end function j.Create(as,at,au,av)assert(typeof(at)=='string',
'Invalid argument #1 (string expected)')local aw=Instance.new(at)if av and as.theme then for ax,ay in av do aw[ax]=(if
typeof(ay)=='table'then ay[2](as.theme[ay[1] ])else as.theme[ay])end as.themeProperties[aw]=av end if au then for ax,ay
in au do if aj.isToken(ay)then as:_bindLocale(aw,ax,aj.sourceOf(ay))else af.assign(aw,ax,ay)end end end table.insert(as.
instances,aw)return aw end function j._bindLocale(as,at,au,av)at[au]=aj.resolve(av)local aw=as.localeProperties[at]if
not aw then aw={}as.localeProperties[at]=aw end aw[au]=av end function j.SetLocale(as,at)aj.setActive(at)for au,av in as
.localeProperties do for aw,ax in av do au[aw]=aj.resolve(ax)end end end function j.SetTranslator(as,at)aj.translator=at
end function j.RegisterTranslations(as,at)aj.register(at)as:SetLocale(aj.current)end function j.CreateGlow(as,at,au,av,
aw)local ax={BlurRadius=UDim.new(0,av),Transparency=aw,ZIndex=-1,Parent=at}if typeof(au)=='string'then return as:Create(
'UIShadow',ax,{Color={au,function(ay)return if typeof(ay)=='ColorSequence'then ay.Keypoints[1].Value else ay end}})end
ax.Color=au return as:Create('UIShadow',ax)end function j._flashResult(as,at,au)local av=at.box if not av then return
end local aw,ax,ay,az,aA,aB=at.glow,at.boxStroke,au and ai.accent.on or as.theme.ErrorColor,au and ai.accent.onStroke or
as.theme.ErrorStrokeColor,TweenInfo.new(0.1,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.45,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out)g.tweenService:Create(av,aA,{BackgroundColor3=ay}):Play()if ax then g.
tweenService:Create(ax,aA,{Color=az,Transparency=0.4}):Play()end if aw then g.tweenService:Create(aw,aA,{Color=az,
Transparency=0.6}):Play()end at._flashToken=(at._flashToken or 0)+1 local aC=at._flashToken task.delay(0.22,function()if
at._flashToken~=aC then return end g.tweenService:Create(av,aB,{BackgroundColor3=as.theme.FieldBackground}):Play()if ax
then g.tweenService:Create(ax,aB,{Color=as.theme.SurfaceStroke,Transparency=0.85}):Play()end if aw then g.tweenService:
Create(aw,aB,{Color=as.theme.FieldGlow,Transparency=at._glowIdle or 1}):Play()end end)end function j.CreateHoverOverlay(
as,at)local au=as:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Size=UDim2.
fromScale(1,1),BorderSizePixel=0,ZIndex=1,Parent=at})as:Create('UICorner',{Parent=au},{CornerRadius=
'ElementCornerRadius'})return au end function j._wireElementHover(as,at)local au,av=TweenInfo.new(0.25,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out),as.theme as:ConnectFor(at,at.main.MouseEnter,function()if not as:_interactive()then
return end g.tweenService:Create(at.stroke,au,{Transparency=av.ElementStrokeHoverTransparency,Color=at.tintStrokeHover
or av.ElementStrokeHover}):Play()g.tweenService:Create(at.title,au,{TextColor3=av.ElementTextHoverColor}):Play()if at.
hoverOverlay then g.tweenService:Create(at.hoverOverlay,au,{BackgroundTransparency=0.97}):Play()end end)as:ConnectFor(at
,at.main.MouseLeave,function()g.tweenService:Create(at.stroke,au,{Transparency=av.ElementStrokeTransparency,Color=at.
tintStroke or av.ElementStroke}):Play()g.tweenService:Create(at.title,au,{TextColor3=av.ContentColor}):Play()if at.
hoverOverlay then g.tweenService:Create(at.hoverOverlay,au,{BackgroundTransparency=1}):Play()end end)end function j.
_runGuarded(as,at,au,...)if at.locked then return end local av=table.pack(...)task.spawn(function()local aw,ax=pcall(
function()return au(table.unpack(av,1,av.n))end)if aw or at._errored then return end at._errored=true local ay,az=at.
flashTarget or at.main,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)g.tweenService:Create(ay,az,{
BackgroundColor3=as.theme.ErrorColor}):Play()g.tweenService:Create(at.stroke,az,{Color=as.theme.ErrorStrokeColor}):Play(
)if at.title then at.title.Text=aj.resolve'Error, log recorded in console.'end ak.warn(`Rayfield encountered an error, with the callback for a {
at.__type} component named '{at.name}':`)ak.print(ax)task.wait(1)if at.title then at.title.Text=aj.resolve(at.name)end g
.tweenService:Create(ay,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundColor3=Color3.
fromRGB(255,255,255)}):Play()g.tweenService:Create(at.stroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Color=as.theme.ElementStroke}):Play()at._errored=false end)end function j.StyleElementBody(as,at)
as:Create('UIGradient',{Rotation=270,Parent=at},{Color='ElementGradient'})as:Create('UICorner',{Parent=at},{CornerRadius
='ElementCornerRadius'})return as:Create('UIStroke',{Transparency=1,Parent=at},{Color='ElementStroke',Transparency=
'ElementStrokeTransparency'})end local as,at,au,av=30,56,42,14 function j._richHeight(aw,ax,ay)if ax.compact or ax.
minimal then return ay end if ax.description and ax.description~=''then ax.rich=true return 62 end if ax.icon then ax.
rich=true return 52 end return ay end function j._richRow(aw,ax,ay)local az=ax.rowHeight if not ax.rich or not az then
return end local aA=ax.container if not aA then return end if ax.ownRichLayout then aw:_richDescription(ax,ax.container)
ax:_applyLayout(true)aw:_fitRichRow(ax,ax.container)return end local aB=16 if ax.iconLabel then aw:_richIconChip(ax,aA.
Parent,UDim2.new(0,aB,0.5,0),aA.ZIndex)aB+=au+av end local aC=ax.containerLayout aA.AnchorPoint=Vector2.new(0,0.5)aA.
Position=UDim2.new(0,aB,0.5,0)aA.Size=UDim2.new(1,-(aB+ay),0,0)aA.AutomaticSize=Enum.AutomaticSize.Y if aC then aC.
FillDirection=Enum.FillDirection.Vertical aC.SortOrder=Enum.SortOrder.LayoutOrder aC.Padding=UDim.new(0,2)aC.
VerticalAlignment=Enum.VerticalAlignment.Center aC.HorizontalAlignment=Enum.HorizontalAlignment.Left end ax.title.
LayoutOrder=1 ax.title.Size=UDim2.new(1,0,0,0)ax.title.AutomaticSize=Enum.AutomaticSize.Y ax.title.TextWrapped=true ax.
title.TextTruncate=Enum.TextTruncate.None aw:_richDescription(ax,aA)aw:_fitRichRow(ax,aA)end local aw=26 function j.
_fitRichRow(ax,ay,az)local aA=ay.rowHeight local function aB()local aC,aD=ay.main.Size.Y.Offset,ay.main.AbsoluteSize.Y
if aC<=0 or aD<=0 or az.AbsoluteSize.Y<=0 then return end local aE=az.AbsoluteSize.Y*aC/aD local _=math.max(aA,math.
ceil(aE)+(ay.richPadding or aw))if _==ay.rowHeight then return end ay.rowHeight=_ if ay._setRichHeight then ay:
_setRichHeight(_)else local aF=ay.main.Size ay.main.Size=UDim2.new(aF.X.Scale,aF.X.Offset,0,_)end end ax:ConnectFor(ay,
az:GetPropertyChangedSignal'AbsoluteSize',aB)task.defer(aB)end function j._richIconChip(ax,ay,az,aA,aB)local aC,aD,aE=ax
:Create('Frame',{Name='IconChip',AnchorPoint=Vector2.new(0,0.5),Position=aA,Size=UDim2.fromOffset(au,au),BorderSizePixel
=0,BackgroundTransparency=1,ZIndex=aB,Parent=az}),ay.iconLabel,type(ay.icon)=='string'and string.find(ay.icon,
'rbxthumb://',1,true)~=nil local aF=tonumber(ay.iconSize)or if aE then at else as aD.Size=UDim2.fromOffset(aF,aF)aD.
AnchorPoint=Vector2.new(0.5,0.5)aD.Position=UDim2.fromScale(0.5,0.5)aD.ScaleType=Enum.ScaleType.Fit aD.ZIndex=aB aD.
Parent=aC ay.iconChip=aC return aC end function j._richDescription(ax,ay,az)if not ay.description or ay.description==''
then return end if ay.descriptor then ay.descriptor.main:Destroy()ay.descriptor=nil end ay.richDescription=ax:Create(
'TextLabel',{Name='Description',Text=aj.t(ay.description),BorderSizePixel=0,BackgroundTransparency=1,Size=UDim2.new(1,0,
0,0),AutomaticSize=Enum.AutomaticSize.Y,RichText=true,TextSize=14,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.
Left,LayoutOrder=2,ZIndex=az.ZIndex,TextTransparency=1,Parent=az},{TextColor3='ContentColor',FontFace='Font'})end
function j._tint(ax,ay,az)if typeof(az)~='Color3'or not ay.stroke then return end local aA,aB,aC,aD=ay.stroke.Parent,az:
ToHSV()local aE,aF=Color3.fromHSV(aB,aC*0.9,aD),Color3.fromHSV(aB,aC,aD*0.62)ay.tintStroke=Color3.fromHSV(aB,aC*0.6,math
.min(1,aD*1.35))ay.tintStrokeHover=Color3.fromHSV(aB,aC*0.45,math.min(1,aD*1.7))for _,aG in aA:GetChildren()do if aG.
ClassName=='UIGradient'then ax.themeProperties[aG]=nil aG.Color=ColorSequence.new(aF,aE)end end local aG=ax.
themeProperties[ay.stroke]if aG then local _=table.clone(aG)_.Color=nil ax.themeProperties[ay.stroke]=_ end ay.stroke.
Color=ay.tintStroke end local ax,ay=TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.
new(0.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)function j._pressSqueeze(az,aA,aB)local aC=aA.rich and aA
.container if aC then aA._pressToken=(aA._pressToken or 0)+1 if aB and not aA._freeSize then local aD,aE=aA.main.Size.Y.
Offset,aA.main.AbsoluteSize.Y if aD>0 and aE>0 then aA._freeSize=aC.Size local aF=aC.AbsoluteSize.X*aD/aE aC.Size=UDim2.
new(0,aF,aC.Size.Y.Scale,aC.Size.Y.Offset)end elseif not aB and aA._freeSize then local aD=aA._pressToken task.delay(ay.
Time,function()if aA._pressToken==aD and aA._freeSize then aC.Size=aA._freeSize aA._freeSize=nil end end)end end g.
tweenService:Create(aA.main,if aB then ax else ay,{Size=UDim2.new(1,if aB then-26 else-20,0,aA.rowHeight)}):Play()end
function j._decorate(az,aA,aB,aC)if typeof(aB)=='table'then aA.iconSize=aB.iconSize or aB.IconSize end az:_richRow(aA,aC
or 60)if typeof(aB)=='table'then az:_tint(aA,aB.color or aB.Color)end end function j._buildCompactRow(az,aA,aB,aC)local
aD=az:Create('Frame',{Name=aB,Size=UDim2.fromOffset(0,s),AutomaticSize=Enum.AutomaticSize.X,ClipsDescendants=true,
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Parent=aA.tabPage},{
BackgroundTransparency='ElementTransparency'})local aE=az:StyleElementBody(aD)az:Create('UIFlexItem',{FlexMode=Enum.
UIFlexMode.Fill,Parent=aD})az:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=aD})local aF=az:Create('TextButton',{Text='',
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,s),BorderSizePixel=0,TextTransparency=1,ZIndex=aC or 1,Parent=aD})az:Create('UICorner',{Parent=aF},{
CornerRadius='ElementCornerRadius'})return aD,aE,aF end function j.StyleElementPanel(az,aA)az:Create('UIGradient',{
Rotation=270,Parent=aA},{Color='ElementGradient'})az:Create('UICorner',{Parent=aA},{CornerRadius='ElementCornerRadius'})
local aB=az:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=aA})az:Create('UIGradient',{
Rotation=270,Parent=aB},{Color='ElementStrokeGradient'})return aB end function j._reveal(az,aA,aB,aC,aD)if not aA then
return end if aC then g.tweenService:Create(aA,aD or k,aB):Play()else for aE,aF in aB do aA[aE]=aF end end end function
j._revealCommon(az,aA,aB)az:_reveal(aA.stroke,{Transparency=az.theme.ElementStrokeTransparency},aB)az:_reveal(aA.title,{
TextTransparency=0},aB)az:_reveal(aA.main,{BackgroundTransparency=az.theme.ElementTransparency or 0},aB)if aA.iconLabel
then az:_reveal(aA.iconLabel,{ImageTransparency=0},aB)end if aA.descriptor then az:_reveal(aA.descriptor.titleLabel,{
TextTransparency=0.7},aB)end if aA.richDescription then az:_reveal(aA.richDescription,{TextTransparency=J},aB)end end
function j._hideCommon(az,aA,aB)az:_reveal(aA.stroke,{Transparency=1},aB)az:_reveal(aA.title,{TextTransparency=1},aB)az:
_reveal(aA.main,{BackgroundTransparency=1},aB)if aA.iconLabel then az:_reveal(aA.iconLabel,{ImageTransparency=1},aB)end
if aA.descriptor then az:_reveal(aA.descriptor.titleLabel,{TextTransparency=1},aB)end if aA.richDescription then az:
_reveal(aA.richDescription,{TextTransparency=1},aB)end end function j._collapsedRect(az)local aA=if az.showIconOnly then
m else l if az._collapsedPosition then return az._collapsedPosition,aA end local aB=UDim2.new(n.X.Scale,n.X.Offset,n.Y.
Scale,n.Y.Offset+aA.Y.Offset/2)return aB,aA end function j._interactive(az)return not az.animating and not az.hidden end
function j._settled(az)return not az.hidden and not az._revealing end function j.Connect(az,aA,aB)local aC=aA:Connect(aB
)table.insert(az.connections,aC)return aC end function j.ConnectFor(az,aA,aB,aC)local aD=az:Connect(aB,aC)aA.connections
=aA.connections or{}table.insert(aA.connections,aD)return aD end function j.Disconnect(az,aA)if not aA then return end
local aB=table.find(az.connections,aA)if aB then table.remove(az.connections,aB)end aA:Disconnect()end function j.
DestroySubtree(az,aA)if not aA then return end local aB={[aA]=true}for aC,aD in aA:GetDescendants()do aB[aD]=true end
for aC=#az.instances,1,-1 do local aD=az.instances[aC]if aB[aD]then table.remove(az.instances,aC)az.themeProperties[aD]=
nil az.localeProperties[aD]=nil end end aA:Destroy()end function j.DisconnectMany(az,aA,aB)if not aB or#aB==0 then
return end local aC={}for aD,aE in aB do aC[aE]=true aE:Disconnect()end local function aD(aE)if not aE then return end
local aF=0 for aG=1,#aE do local _=aE[aG]if not aC[_]then aF+=1 aE[aF]=_ end end for aG=#aE,aF+1,-1 do aE[aG]=nil end
end aD(az.connections)if aA and aA~=az then aD(aA.connections)end end function j.DestroySubtrees(az,aA)if not aA or#aA==
0 then return end local aB={}for aC,aD in aA do aB[aD]=true for aE,aF in aD:GetDescendants()do aB[aF]=true end end local
aC=0 for aD=1,#az.instances do local aE=az.instances[aD]if aB[aE]then az.themeProperties[aE]=nil az.localeProperties[aE]
=nil else aC+=1 az.instances[aC]=aE end end for aD=#az.instances,aC+1,-1 do az.instances[aD]=nil end for aD,aE in aA do
aE:Destroy()end end function j.Unload(az)az.unloaded=true al.teardown()al.releaseContainer(az.screenGui)if az._liveTween
then az._liveTween:Cancel()az._liveTween=nil end for aA=#az.connections,1,-1 do az.connections[aA]:Disconnect()end for
aA=#az.instances,1,-1 do az.instances[aA]:Destroy()end table.clear(az.connections)table.clear(az.instances)table.clear(
az.themeProperties)table.clear(az.localeProperties)table.clear(az.controls)table.clear(az.tabs)end return j end)()end,[
34]=function()local aa,ab,ac=a(34)local ad return(function(...)return{WindowColor=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(22,16,32)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(30,22,46)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(38,28,56))},ShadowColor=Color3.fromRGB(12,6,22),ElementStroke=Color3.fromRGB(
54,42,74),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(32,24,48)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(36,28,54)),ColorSequenceKeypoint.new(1,Color3.fromRGB(36,28,54))},ElementStrokeGradient=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(72,58,104)),ColorSequenceKeypoint.new(0.9999,Color3.
fromRGB(88,72,124)),ColorSequenceKeypoint.new(1,Color3.fromRGB(72,58,104))},ElementStrokeHover=Color3.fromRGB(84,68,118)
,TabBackground=ColorSequence.new(Color3.fromRGB(54,42,80),Color3.fromRGB(34,26,52)),TabStroke=ColorSequence.new(Color3.
fromRGB(88,70,128),Color3.fromRGB(54,42,80)),SliderBackground=Color3.fromRGB(46,36,68),SliderBackgroundHover=Color3.
fromRGB(60,48,90),SliderProgress=ColorSequence.new(Color3.fromRGB(170,112,248),Color3.fromRGB(138,80,224)),AccentColor=
Color3.fromRGB(168,110,246),AccentStroke=Color3.fromRGB(200,154,255),ToggleKnobOff=Color3.fromRGB(224,214,236),
StatBackground=Color3.fromRGB(24,18,38),DropdownHighlight=Color3.fromRGB(168,110,246),NeutralButton=Color3.fromRGB(46,36
,68),NeutralButtonHover=Color3.fromRGB(60,48,90),NeutralButtonStroke=Color3.fromRGB(140,116,190)}end)()end,[35]=function
()local aa,ab,ac=a(35)local ad return(function(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(12,16,34)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(20,26,50)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(28,36,66))},ShadowColor=Color3.fromRGB(6,8,20),ElementStroke=Color3.fromRGB(44,52,82),ElementGradient=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(26,32,58)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
30,38,66)),ColorSequenceKeypoint.new(1,Color3.fromRGB(30,38,66))},ElementStrokeGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(56,66,104)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(70,82,124)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(56,66,104))},ElementStrokeHover=Color3.fromRGB(64,76,116),TabBackground=
ColorSequence.new(Color3.fromRGB(48,58,92),Color3.fromRGB(30,38,64)),TabStroke=ColorSequence.new(Color3.fromRGB(78,92,
140),Color3.fromRGB(48,58,92)),SliderBackground=Color3.fromRGB(40,48,78),SliderBackgroundHover=Color3.fromRGB(54,64,100)
,SliderProgress=ColorSequence.new(Color3.fromRGB(64,132,248),Color3.fromRGB(42,104,224)),AccentColor=Color3.fromRGB(48,
120,240),AccentStroke=Color3.fromRGB(96,164,255),ToggleKnobOff=Color3.fromRGB(196,206,232),StatBackground=Color3.
fromRGB(20,26,48),DropdownHighlight=Color3.fromRGB(48,120,240),NeutralButton=Color3.fromRGB(40,48,78),NeutralButtonHover
=Color3.fromRGB(54,64,100),NeutralButtonStroke=Color3.fromRGB(120,138,195)}end)()end,[36]=function()local aa,ab,ac=a(36)
local ad return(function(...)local ae=ac(ab.Parent.Parent.utility.variables)return{CornerRoundness=UDim.new(0,20),
WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(10,10,10)),ColorSequenceKeypoint.new(0.9999,
Color3.fromRGB(25,25,25)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},ShadowColor=Color3.fromRGB(20,20,20),
ElementStroke=Color3.fromRGB(35,35,35),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,
30,30)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(35,35,35)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))
},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(48,48,48)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(1,Color3.fromRGB(48,48,48))},TabColor=Color3.fromRGB(255,
255,255),TabBackground=ColorSequence.new(Color3.fromRGB(50,50,50),Color3.fromRGB(35,35,35)),TabStroke=ColorSequence.new(
Color3.fromRGB(95,95,95),Color3.fromRGB(50,50,50)),SliderBackground=Color3.fromRGB(47,47,47),SliderBackgroundHover=
Color3.fromRGB(60,60,60),SliderProgress=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),
SliderStroke=Color3.fromRGB(255,255,255),ActionColor=Color3.fromRGB(255,255,255),TitleFont=ae.brandFont(Enum.FontWeight.
SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),ContentColor=Color3.fromRGB(255,255,255),LiveAnimation=false,
DarkToggleOverlay=true,ElementTransparency=0,ElementStrokeTransparency=0,ElementStrokeHoverTransparency=0,
ElementStrokeHover=Color3.fromRGB(50,50,50),ElementCornerRadius=UDim.new(0,12),ElementTextHoverColor=Color3.fromRGB(255,
255,255),TitlingColor=Color3.fromRGB(255,255,255),DropdownHighlight=Color3.fromRGB(255,255,255),AccentColor=Color3.
fromRGB(23,153,110),AccentStroke=Color3.fromRGB(32,201,144),AccentGlow=0.4,StatBackground=Color3.fromRGB(25,25,25),
SliderHandle=Color3.fromRGB(255,255,255),PillCornerRadius=UDim.new(1,0),ToggleTrack=Color3.fromRGB(0,0,0),
ToggleTrackTransparency=0.9,ToggleKnobOff=Color3.fromRGB(255,255,255),ToggleKnobOffTransparency=0.8,FieldBackground=
Color3.fromRGB(255,255,255),FieldTransparency=0.9,FieldGlow=Color3.fromRGB(255,255,255),PlaceholderColor=Color3.fromRGB(
178,178,178),SurfaceStroke=Color3.fromRGB(255,255,255),NeutralButton=Color3.fromRGB(38,38,38),NeutralButtonHover=Color3.
fromRGB(54,54,54),NeutralButtonStroke=Color3.fromRGB(255,255,255),ErrorColor=Color3.fromRGB(185,50,50),ErrorStrokeColor=
Color3.fromRGB(240,75,75)}end)()end,[37]=function()local aa,ab,ac=a(37)local ad return(function(...)return{WindowColor=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(22,18,16)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
32,27,23)),ColorSequenceKeypoint.new(1,Color3.fromRGB(40,33,28))},ShadowColor=Color3.fromRGB(16,12,8),ElementStroke=
Color3.fromRGB(54,46,40),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(32,27,23)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(38,32,27)),ColorSequenceKeypoint.new(1,Color3.fromRGB(38,32,27))},
ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(72,62,52)),ColorSequenceKeypoint.new(
0.9999,Color3.fromRGB(88,76,64)),ColorSequenceKeypoint.new(1,Color3.fromRGB(72,62,52))},ElementStrokeHover=Color3.
fromRGB(84,72,60),TabBackground=ColorSequence.new(Color3.fromRGB(56,47,40),Color3.fromRGB(36,30,26)),TabStroke=
ColorSequence.new(Color3.fromRGB(92,78,66),Color3.fromRGB(56,47,40)),SliderBackground=Color3.fromRGB(48,40,34),
SliderBackgroundHover=Color3.fromRGB(62,52,44),SliderProgress=ColorSequence.new(Color3.fromRGB(244,152,44),Color3.
fromRGB(220,110,24)),AccentColor=Color3.fromRGB(240,142,40),AccentStroke=Color3.fromRGB(255,182,92),ToggleKnobOff=Color3
.fromRGB(232,224,214),StatBackground=Color3.fromRGB(26,21,18),DropdownHighlight=Color3.fromRGB(240,142,40),NeutralButton
=Color3.fromRGB(48,40,34),NeutralButtonHover=Color3.fromRGB(64,54,46),NeutralButtonStroke=Color3.fromRGB(150,128,104)}
end)()end,[38]=function()local aa,ab,ac=a(38)local ad return(function(...)local ae=ac(ab.Parent.Parent.utility.variables
)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(246,249,251)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(236,241,245))},ShadowColor=Color3.fromRGB(116,124,132),LiveAnimation=false,ElementTransparency=0,
ElementStroke=Color3.fromRGB(218,224,228),ElementGradient=ColorSequence.new(Color3.fromRGB(255,255,255)),
ElementStrokeGradient=ColorSequence.new(Color3.fromRGB(224,230,234),Color3.fromRGB(232,238,242)),
ElementStrokeTransparency=0.1,ElementStrokeHoverTransparency=0,ElementStrokeHover=Color3.fromRGB(0,176,208),
DarkToggleOverlay=false,TabColor=Color3.fromRGB(38,42,46),TabBackground=ColorSequence.new(Color3.fromRGB(0,176,208),
Color3.fromRGB(0,150,184)),TabStroke=ColorSequence.new(Color3.fromRGB(80,206,230),Color3.fromRGB(0,160,196)),
SliderBackground=Color3.fromRGB(224,230,234),SliderBackgroundHover=Color3.fromRGB(212,220,224),SliderProgress=
ColorSequence.new(Color3.fromRGB(0,182,214),Color3.fromRGB(0,146,182)),SliderStroke=Color3.fromRGB(200,206,210),
AccentColor=Color3.fromRGB(0,176,208),AccentStroke=Color3.fromRGB(96,210,232),AccentGlow=0.85,StatBackground=Color3.
fromRGB(255,255,255),SliderHandle=Color3.fromRGB(60,66,72),ToggleTrack=Color3.fromRGB(198,204,210),
ToggleTrackTransparency=0,ToggleKnobOffTransparency=0.05,FieldBackground=Color3.fromRGB(224,230,234),FieldTransparency=0
,FieldGlow=Color3.fromRGB(148,154,160),PlaceholderColor=Color3.fromRGB(138,144,150),SurfaceStroke=Color3.fromRGB(204,210
,214),NeutralButton=Color3.fromRGB(224,230,234),NeutralButtonHover=Color3.fromRGB(212,220,224),NeutralButtonStroke=
Color3.fromRGB(242,246,248),ActionColor=Color3.fromRGB(68,74,80),TitlingColor=Color3.fromRGB(26,30,34),TitleFont=ae.
brandFont(Enum.FontWeight.SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),ContentColor=Color3.fromRGB(42,46,52),
ElementTextHoverColor=Color3.fromRGB(18,22,26),DropdownHighlight=Color3.fromRGB(0,176,208),ErrorColor=Color3.fromRGB(200
,60,55),ErrorStrokeColor=Color3.fromRGB(240,80,70)}end)()end,[39]=function()local aa,ab,ac=a(39)local ad return(function
(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(26,18,22)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(36,26,31)),ColorSequenceKeypoint.new(1,Color3.fromRGB(44,32,38))},ShadowColor=Color3.fromRGB(
18,10,14),ElementStroke=Color3.fromRGB(58,44,50),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.
fromRGB(34,25,29)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(40,30,34)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(40,30,34))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(76,58,66)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(92,70,80)),ColorSequenceKeypoint.new(1,Color3.fromRGB(76,58,66))},
ElementStrokeHover=Color3.fromRGB(88,66,74),TabBackground=ColorSequence.new(Color3.fromRGB(62,46,53),Color3.fromRGB(38,
29,33)),TabStroke=ColorSequence.new(Color3.fromRGB(102,78,88),Color3.fromRGB(62,46,53)),SliderBackground=Color3.fromRGB(
50,38,44),SliderBackgroundHover=Color3.fromRGB(64,50,56),SliderProgress=ColorSequence.new(Color3.fromRGB(244,88,140),
Color3.fromRGB(220,60,116)),AccentColor=Color3.fromRGB(240,82,138),AccentStroke=Color3.fromRGB(255,134,178),
ToggleKnobOff=Color3.fromRGB(236,220,226),StatBackground=Color3.fromRGB(28,20,24),DropdownHighlight=Color3.fromRGB(240,
82,138),NeutralButton=Color3.fromRGB(50,38,44),NeutralButtonHover=Color3.fromRGB(64,50,56),NeutralButtonStroke=Color3.
fromRGB(170,122,140)}end)()end,[40]=function()local aa,ab,ac=a(40)local ad return(function(...)export type Theme=string|
{[string]:any}export type Translator=(source:string,localeId:string)->string?export type Translations={[string]:{[string
]:string}}export type WindowConfiguration={autoSave:boolean?,autoLoad:boolean?,fileName:string?,customFolder:string?}
export type WindowProps={name:string?,subtitle:string?,theme:Theme?,icon:(string|number|boolean)?,themeTab:boolean?,
homeTab:boolean?,discordReminder:boolean?,discordInvite:string?,showName:string?,showIcon:(string|number)?,showIconOnly:
boolean?,sidebarLayout:boolean?,profile:string?,configuration:WindowConfiguration?,fallbackFont:(Font|Enum.Font)?,locale
:string?,translations:Translations?,translator:Translator?}export type TabProps={name:string?,icon:(string|number)?}
export type TagProps={text:string?,title:string?,icon:(string|number)?,color:Color3?,order:number?}export type
SectionProps={name:string?,icon:(string|number)?}export type TextProps={name:string?,text:string?,icon:(string|number)?}
export type DiscordProps={invite:string,name:string?,text:string?,buttonText:string?,showMembers:boolean?,callback:((
link:string)->())?}export type Discord={Join:(self:Discord)->(),Refresh:(self:Discord)->()}export type GalleryItem={name
:string,image:string?,category:string?,tag:string?,tagColor:Color3?,color:Color3?,[string]:any}export type GalleryProps=
{name:string?,text:string?,placeholder:string?,items:{GalleryItem}?,filters:{string}?,tileSize:number?,pageSize:number?,
callback:((item:GalleryItem)->())?}export type Gallery={SetItems:(self:Gallery,items:{GalleryItem})->(),SetFilter:(self:
Gallery,filter:string)->(),SetSearch:(self:Gallery,text:string)->()}export type DividerProps={text:string?,spacing:
number?,line:boolean?}export type GroupProps={direction:string?}export type ButtonProps={name:string?,description:string
?,icon:(string|number)?,callback:(()->())?}export type ToggleProps={name:string?,description:string?,icon:(string|number
)?,flag:string?,value:boolean?,forgetState:boolean?,callback:((value:boolean)->())?}export type SliderProps={name:string
?,description:string?,icon:(string|number)?,flag:string?,range:{number}?,increment:number?,value:number?,suffix:string?,
minimal:boolean?,forgetState:boolean?,callback:((value:number,dragging:boolean)->())?}export type DropdownProps={name:
string?,description:string?,icon:(string|number)?,flag:string?,options:{string}?,value:(string|{string})?,multiSelect:
boolean?,placeholder:string?,forgetState:boolean?,callback:((value:any)->())?}export type InputProps={name:string?,
description:string?,icon:(string|number)?,flag:string?,value:string?,placeholder:string?,numeric:boolean?,clearOnFocus:
boolean?,forgetState:boolean?,callback:((value:string)->())?}export type KeybindProps={name:string?,description:string?,
icon:(string|number)?,flag:string?,value:(EnumItem|string)?,forgetState:boolean?,isMenuToggle:boolean?,hold:boolean?,
holdThreshold:number?,callback:((value:EnumItem|boolean)->())?,onChanged:((key:EnumItem)->())?}export type
ColorPickerProps={name:string?,description:string?,icon:(string|number)?,flag:string?,color:Color3?,alpha:number?,
forgetState:boolean?,callback:((value:Color3,alpha:number)->())?}export type StatProps={name:string?,description:string?
,icon:(string|number)?,prefix:string?,suffix:string?,value:number?,display:string?,compact:boolean?,changeMode:string?,
changeBaseline:string?,numberEasing:boolean?}export type ProgressProps={name:string?,description:string?,icon:(string|
number)?,range:{number}?,value:number?,steps:number?,text:string?,format:((value:number,min:number,max:number)->string)?
,showValue:boolean?,indeterminate:boolean?}export type ConsoleProps={name:string?,description:string?,text:string?,
height:number?,follow:boolean?,maxLines:number?}export type NotifyProps={title:string?,content:string?,icon:(string|
number)?,duration:number?}export type ToastProps={title:string?,subtitle:string?,subtitleAbove:boolean?,icon:(string|
number)?,avatar:number?,minWidth:number?,duration:number?,position:'Top'|'Bottom'?}export type PopupBox={title:string?,
description:string?,icon:(string|number)?}export type PopupOption={text:string?,style:string?,callback:(()->())?}export
type PopupProps={title:string?,subtitle:string?,icon:(string|number)?,content:string?,boxes:{PopupBox}?,options:{
PopupOption}?,dismissable:boolean?}export type Moveable={MoveTo:(self:any,index:number)->(),MoveToTop:(self:any)->(),
MoveToBottom:(self:any)->(),MoveUp:(self:any)->(),MoveDown:(self:any)->()}export type Lockable={Lock:(self:any,reason:
string?)->(),Unlock:(self:any)->(),IsLocked:(self:any)->boolean}export type Button=Moveable&Lockable&{}export type
Toggle=Moveable&Lockable&{value:boolean,Set:(self:Toggle,value:boolean,skipCallback:boolean?)->()}export type Slider=
Moveable&Lockable&{value:number,Set:(self:Slider,value:number,skipCallback:boolean?)->()}export type Dropdown=Moveable&
Lockable&{value:{string},Set:(self:Dropdown,value:string|{string},skipCallback:boolean?)->(),Refresh:(self:Dropdown,
options:{string})->(),Add:(self:Dropdown,option:string)->(),Remove:(self:Dropdown,option:string)->()}export type Input=
Moveable&Lockable&{value:string,Set:(self:Input,value:string,skipCallback:boolean?)->()}export type Keybind=Moveable&
Lockable&{value:EnumItem,Set:(self:Keybind,value:EnumItem|string,skipChanged:boolean?)->()}export type ColorPicker=
Moveable&Lockable&{value:Color3,alpha:number,Set:(self:ColorPicker,value:Color3|string,skipCallback:boolean?)->(),
SetAlpha:(self:ColorPicker,alpha:number,skipCallback:boolean?)->()}export type Stat=Moveable&{value:number,Set:(self:
Stat,value:number)->(),ResetBaseline:(self:Stat,value:number?)->()}export type Progress=Moveable&{value:number,Set:(self
:Progress,value:number)->(),Get:(self:Progress)->number,GetPercentage:(self:Progress)->number,SetRange:(self:Progress,
min:number,max:number)->(),SetText:(self:Progress,text:string?)->(),SetIndeterminate:(self:Progress,state:boolean)->(),
Remove:(self:Progress)->()}export type Console=Moveable&{Set:(self:Console,text:string)->(),Append:(self:Console,line:
string)->(),Clear:(self:Console)->(),Get:(self:Console)->string,Copy:(self:Console)->boolean,SetHeight:(self:Console,
height:number)->(),Remove:(self:Console)->()}export type Section=Moveable&{}export type TabSection={Remove:(self:
TabSection)->()}export type Text=Moveable&{name:string,text:string,Set:(self:Text,text:string)->(),SetTitle:(self:Text,
title:string)->()}export type Divider=Moveable&{text:string,Set:(self:Divider,text:string?)->()}export type Tag={Set:(
self:Tag,props:TagProps)->(),SetColor:(self:Tag,color:Color3)->(),SetText:(self:Tag,text:string?)->(),SetIcon:(self:Tag,
icon:(string|number)?)->(),Remove:(self:Tag)->()}export type Popup={Close:(self:Popup)->()}export type Group=Moveable&{
CreateButton:(self:Group,props:ButtonProps)->Button,CreateToggle:(self:Group,props:ToggleProps)->Toggle,CreateSwitch:(
self:Group,props:ToggleProps)->Toggle,CreateStat:(self:Group,props:StatProps)->Stat,CreateSlider:(self:Group,props:
SliderProps)->Slider,CreateDropdown:(self:Group,props:DropdownProps)->Dropdown?,CreateSection:(self:Group,props:
SectionProps)->Section?,CreateText:(self:Group,props:TextProps)->Text?,CreateDivider:(self:Group,props:DividerProps?)->
Divider?,CreateGroup:(self:Group,props:GroupProps?)->Group}export type Tab={Select:(self:Tab,noAnimation:boolean?)->(),
Deselect:(self:Tab,noAnimation:boolean?)->(),Remove:(self:Tab)->(),CreateButton:(self:Tab,props:ButtonProps)->Button,
CreateToggle:(self:Tab,props:ToggleProps)->Toggle,CreateSwitch:(self:Tab,props:ToggleProps)->Toggle,CreateSlider:(self:
Tab,props:SliderProps)->Slider,CreateDropdown:(self:Tab,props:DropdownProps)->Dropdown,CreateInput:(self:Tab,props:
InputProps)->Input,CreateKeybind:(self:Tab,props:KeybindProps)->Keybind,CreateColorPicker:(self:Tab,props:
ColorPickerProps)->ColorPicker,CreateStat:(self:Tab,props:StatProps)->Stat,CreateProgress:(self:Tab,props:ProgressProps
)->Progress,CreateConsole:(self:Tab,props:ConsoleProps)->Console,CreateSection:(self:Tab,props:SectionProps)->Section,
CreateText:(self:Tab,props:TextProps)->Text,CreateDiscord:(self:Tab,props:DiscordProps)->Discord,CreateGallery:(self:Tab
,props:GalleryProps)->Gallery,CreateDivider:(self:Tab,props:DividerProps?)->Divider,CreateGroup:(self:Tab,props:
GroupProps?)->Group}export type Window={unloaded:boolean,Flags:{[string]:any},CreateTab:(self:Window,props:TabProps)->
Tab,CreateSection:(self:Window,props:SectionProps)->TabSection,CreateTag:(self:Window,props:TagProps)->Tag,Notify:(self:
Window,props:NotifyProps)->(),Toast:(self:Window,props:ToastProps)->(),Popup:(self:Window,props:PopupProps)->Popup?,Show
:(self:Window)->(),Hide:(self:Window)->(),ToggleHide:(self:Window)->(),ToggleMinimise:(self:Window)->(),Navigate:(self:
Window,tab:string|Tab)->(),ChangeTheme:(self:Window,theme:Theme)->(),SetName:(self:Window,name:string)->(),SetSubtitle:(
self:Window,text:string?)->(),SetLocale:(self:Window,localeId:string)->(),SetTranslator:(self:Window,translator:
Translator?)->(),RegisterTranslations:(self:Window,translations:Translations)->(),Save:(self:Window,name:string?)->
boolean,Load:(self:Window,name:string?)->boolean,ListConfigs:(self:Window)->{string},DeleteConfig:(self:Window,name:
string)->boolean,GetPath:(self:Window)->(string,string),Get:(self:Window,flag:string)->any,Set:(self:Window,flag:string,
value:any)->boolean,Unload:(self:Window)->()}export type Rayfield={CreateWindow:(self:Rayfield,props:WindowProps)->
Window}return{}end)()end,[42]=function()local aa,ab,ac=a(42)local ad return(function(...)local ae,af=ac(ab.Parent.
variables),{}af.enabled=false type HapticTypes={click:Enum.HapticEffectType?,notify:Enum.HapticEffectType?}local ag:
HapticTypes,ah,ai={},pcall(function()Instance.new'HapticEffect':Destroy()return{click=Enum.HapticEffectType.UIHover,
notify=Enum.HapticEffectType.UIClick}end)if ah then ag=ai end local aj:{[Enum.HapticEffectType]:Instance},ak:Instance?={
}function af.setContainer(al:Instance?)ak=al end function af.releaseContainer(al:Instance?)if al==nil or ak==al then ak=
nil end end local function al():Instance if ak and ak.Parent then return ak end return ae.guiContainer end
local function am(an:Enum.HapticEffectType):Instance?local ao=aj[an]if ao and ao.Parent then return ao end local ap,aq=
pcall(Instance.new,'HapticEffect')if not ap then return nil end local ar=aq::any ar.Type=an local as=pcall(function()aq.
Parent=al()end)if not as then aq:Destroy()return nil end aj[an]=aq return aq end local function an(ao:Enum.
HapticEffectType?)if not ao or not af.enabled then return end local ap=am(ao)if ap then local aq=ap::any pcall(aq.Play,
ap)end end function af.click()an(ag.click)end function af.notify()an(ag.notify)end function af.setEnabled(ao:boolean?)af
.enabled=ao and true or false if not af.enabled then af.teardown()end end function af.teardown()for ao,ap in aj do
pcall(ap.Destroy,ap)aj[ao]=nil end end return af end)()end,[43]=function()local aa,ab,ac=a(43)local ad return(function(
...)local ae,af=ac(ab.Parent.network),ac(ab.Parent.log)export type AssetId=number|string export type AssetDownloadUrl=
string export type CacheKey=AssetId export type ResolvedAsset=AssetId export type AssetRequestPayload={Url:string,Method
:string}local ag={Enum={AssetDownloadUrl={RobloxDownloadUrl='https://assetdelivery.roblox.com/v1/asset/?id=%d'::
AssetDownloadUrl,RoProxyDownloadUrl='https://assetdelivery.roproxy.com/v1/asset?id=%d'::AssetDownloadUrl}}}ag.__index=ag
ag.__type='assetResolver'type AssetResolverState={contentCache:{[CacheKey]:string}?,contentCacheOrder:{CacheKey}?,
contentDownloadUrl:AssetDownloadUrl,pendingRequests:{[CacheKey]:{thread}}}export type AssetResolver=AssetResolverState&{
resolve:(self:AssetResolver,value:unknown)->ResolvedAsset?,getAssetContentFromUrl:(self:AssetResolver,url:string,
cacheKey:CacheKey?,forced:boolean?)->string?,getAssetContentFromId:(self:AssetResolver,id:AssetId,forced:boolean?)->
string?}local ah=8 function ag.new(ai:boolean?,aj:AssetDownloadUrl?):AssetResolver local ak:{[CacheKey]:string}?=if ai
then{}else nil local al=setmetatable({contentCache=ak,contentCacheOrder=if ai then{}::{CacheKey}else nil,
contentDownloadUrl=aj or ag.Enum.AssetDownloadUrl.RobloxDownloadUrl,pendingRequests={}}::AssetResolverState,ag)::any
return al end function ag.resolve(ai:AssetResolver,aj:unknown):ResolvedAsset?if type(aj)=='number'then return aj end if
type(aj)~='string'then return nil end if string.sub(aj,1,11)=='rbxasset://'or string.sub(aj,1,11)=='rbxthumb://'then
return aj end local ak=tonumber(string.match(aj,'^rbxassetid://(%d+)$'))if ak then return ak end return nil end
local function ai(aj:unknown):boolean if type(aj)~='table'then return false end local ak=aj::{Body:unknown,StatusCode:
unknown,Success:unknown}local al=ak.Body if type(al)~='string'or#al==0 then return false end if type(ak.StatusCode)==
'number'then local am=ak.StatusCode::number return am>=200 and am<300 end if type(ak.Success)=='boolean'then return ak.
Success::boolean end return false end function ag.getAssetContentFromUrl(aj:AssetResolver,ak:string,al:CacheKey?,am:
boolean?):string?local an=aj.contentCache if al~=nil and an and not am then local ao=an[al]if ao then return ao end end
local ao=aj.pendingRequests if al~=nil then local ap=ao[al]if ap then table.insert(ap,coroutine.running())return
coroutine.yield()end ao[al]={}end local ap,aq:string?=(ae.getRequestFn())if not ap then af.warn
'No request function available to download asset content.'else local ar,as=pcall(ap,{Url=ak,Method='GET'}::
AssetRequestPayload)if ar and ai(as)then local at=(as::{Body:string}).Body aq=at if al~=nil and an then local au=aj.
contentCacheOrder if au and an[al]==nil then table.insert(au,al)local av=if#au>ah then table.remove(au,1)else nil if av
~=nil then an[av]=nil end end an[al]=at end elseif not am then af.warn('Failed to download asset content for url: '..
tostring(ak))end end if al~=nil then local ar=ao[al]ao[al]=nil if ar then for as,at in ar do coroutine.resume(at,aq)end
end end return aq end function ag.getAssetContentFromId(aj:AssetResolver,ak:AssetId,al:boolean?):string?local am=aj:
resolve(ak)if not am or type(am)~='number'then af.warn('Invalid asset id: '..tostring(am))return nil end local an=string
.format(aj.contentDownloadUrl,am)return aj:getAssetContentFromUrl(an,am,al)end return ag end)()end,[44]=function()local
aa,ab,ac=a(44)local ad return(function(...)return table.concat{
'\137PNG\r\n\26\n\0\0\0\rIHDR\0\0\0000\0\0\0000\b\6\0\0\0W\2\249\135\0\0\4\165IDATx\156\228\154y\136WU\20\199\207o,*"[\b\156\194'
,
'"Z\192J)J\163\157\130\b\163\133\168\196\178\130\1602i1\173?\162\146HB\n\140JpF\')"\171!\139j\254h\131\178u2(\164r\202\168\160\148\0221\21w\220\199\207\151\247'
,
'F\174\199\247\222\239\247{\1393\131_\248r\230\222{\238\189\231\252\238v\238\187\211b\131\28-6\200\145\203\129\222\222\222\139\224\2x\181\2453j\214$0\250Z\196{\0229\191\19\142\170\213'
,
'jK\173\159\144g\4\206\v\234\r\129\183Y?"\143\3\203\\\250\n\235G\228q\224#\151\30\195\180:\188^%tF\194\239\225\18x\182\149\132\166\29`\190\255\141\b\231\188\214\209\149Yu'
,
'0\248|D7<\23\142\132\237V\18\242n\163\31\187t\2344\194x9\183\16\14\r\178G\144\127\144\149\128\188\14\248ity\146\18F\222\132x\31\30\230\138f2\146;\172\4\228u\224\v'
,
"\184%H{\3e\252\245\136\183\160\255\165\219\2243V\18r9\192\175'\227\195y<7,\143\167\199\172\132\170OQ\247~\216k%\161\230:\158\140\24\r?\128\v\233heZEt\229\252"
,
"Yp\27z?\18729\240'\28\30dOE\239\5+\25\181\160\211[\17\175\185\242_\224g\240SI\fXk\r\130\246nF\204\183\232\180\158H\221W\173\2\132\14<\129\152\158\161\187\21"
,
'N\193\144\1856\128\16:\160\195E\187\203\176:u\142\196\137\2456@\176g\17c\212\15\1363\225C\240s\139\134\222c\151\185\133\143\227G\192v\248?\\\14_\134\231\216~Bj4\138\17'
,
':x\174\1307\192\177\240\16\248<\142>\234\244\180\219LNh\226;8\av\198\187V%h:\156\246\192\129\205\150p\14\4X\a_\129m8\242\187\149\1402\28\248\rqZ\131\234\218\209'
,
't~t\225\204v+\1e\\)\0237\161\171\144C\167\179\214\202\f8\220\n\162\f\a\230\185\180N\217k`\a\220\152R\167\21>\6\255\194\137.8\22\230\154\r\r;@\aw\192\165p'
,
'1\f\163OE\154\127\4i\25r)Sd\18\242xx/\\\146\210\172nt\215\193\15\213\6\237>\2\143\181&\208\144\2154z7\226\197 K\139q\4F\238\138\203\31F<\27\148\175\134'
,
'\173a\196\169\15\1\b95\206\162\29-\r\219\224\219p\14\245\191\182\162\14\208\241xD\167\211\253\a\158\0248\160-w\1653l\2\229\157\t\237\29\131\184\19\222\3O\177l\244X\180\21\207'
,
'\167\173\rI\n-u\140\215\240\190a\251:\250x\159\241B|2\191\233t&&\181\137\238\0268\211\162\157K\151\157w,: \147\160\219\155\194\239\21\2162%\177=K7^_\0314\132'
,
"\a\187\162'1`z\130\190\174\141\139\\\246\233\232\254ju@]\173\21M\175\187\224q\25\170\211hoF\152\1455\2\211l_\227g'\25/\144\255-\226'\151\1578\n\tu\255\133\n"
,
'&O\128\138\138W\165\168\142\243\25Y\14\248\131f\30\157<`\217hsi\237\\\135fU\160\188\21\222\b\159\179h\4\21v\167\237DC}F\189\17\232\187\208\204\182h\209\213\131\238\19\155'
,
'\131\244\209p|\146"\6\143\130\186/\255g\209\1743\21\142\177hk\205j\127/\20\14%\18\f\211\1741)\200Z\196\200]\232tNF(\4\25\210`\179\186\139\232\30\2534mm\r\v'
,
'\170p@!y\143\203\214\247\211\158@\231u\196\132\140ft\130kM\233[\2107\22\253\b\137\219h\233\14\b\24\168N/\b\178\2181\224\190\184LkB\198\132_+\150\199\134v\199\2521'
,
'\220\166\179P\149\3\183[\180\24\251\176\t\14\195\168M\148]fQT\218\135e\228\159d9Q\213\3\199\2\24^;\245\237\244\150\248\239\139\157\238WV\0\1498\16/4\31\165>\24\203K'
,
"\\~\221x'\179/\171\bL\149S-\218i\194>\180M\234\23\15\207\1343\138<\144T\246F\134Q\n\177?q\217\218bC\227W\21}\221\169\250\145\175\195\165G\187t\183\21D\213\14"
,
'\188\vWd\148\23Z\192B\165\14\196{yG\134\202\151V\180\15\171\24q\168\172\131\202\135\r:\27\142*\250NP\249C\183Be\196K\tE\179\202x\228\168|\4\132\248\17\176\v\234\210'
,
'\163\175t\186\196\235\157`\157\21\196~q\160J\28\152\255+1\1440\232\29\216\r\0\0\255\255\128\17t\230\0\0\0\6IDAT\3\0\196@\154\237j\194c\170\0\0\0\0IEND'
,'\174B`\130'}end)()end,[45]=function()local aa,ab,ac=a(45)local ad return(function(...)local ae={}function ae.
contrastColor(af:Color3):Color3 local ag=0.299*af.R+0.587*af.G+0.114*af.B return if ag>0.5 then Color3.fromRGB(0,0,0)
else Color3.fromRGB(255,255,255)end function ae.toColorSequence(af:Color3|ColorSequence):ColorSequence return if typeof(
af)=='ColorSequence'then af else ColorSequence.new(af)end function ae.contrastText(af:Color3):Color3 local ag=0.299*af.R
+0.587*af.G+0.114*af.B return if ag>0.6 then Color3.fromRGB(20,20,20)else Color3.fromRGB(255,255,255)end return ae end)(
)end,[46]=function()local aa,ab,ac=a(46)local ad return(function(...)local ae={}ae.fontAsset='rbxassetid://12187365364'
ae.pillResizeInfo=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)ae.icons={close=83277910885129
,minimise=108115485663409,maximise=88738500661569,settings=129180860773723,search=100604009889706,chevron=88479147175134
,check=125626312718314,dot=91452555903853,colorpicker=91452555903853,config=125823673784681,rayfield=80387863064905,
palette=10734910430,home=10723424646,discord=10734888000}ae.accent={on=Color3.fromRGB(23,153,110),onStroke=Color3.
fromRGB(32,201,144)}ae.statAccents={positive={fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98))
,stroke=ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))},negative={fill=ColorSequence.new(Color3.
fromRGB(172,47,47),Color3.fromRGB(135,37,37)),stroke=ColorSequence.new(Color3.fromRGB(255,75,75),Color3.fromRGB(244,67,
67))},neutral={fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),stroke=ColorSequence.new(
Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))}}ae.zIndex={elementLock=60,elementLockContent=65,bottomFade=100,
notification=1500,drag=1000,toast=2000,toastContent=2001,restoreContent=100001,restoreInteract=100002}ae.displayOrder={
window=99999,banner=100000,popup=100001}return ae end)()end,[47]=function()local aa,ab,ac=a(47)local ad return(function(
...)return table.concat{'\137PNG\r\n\26\n\0\0\0\rIHDR\0\0\0\24\0\0\0\24\b\6\0\0\0\224w',
'=\248\0\0\0\tpHYs\0\0\v\19\0\0\v\19\1\0\154\156\24\0\0\1;IDATx\156',
'\237\212\205*\133Q\20\198\241#L\fI\29.\0\199\0050\246\145\148\145\v0V\226\\\128\220\5',
'\3\198\190K\153H\162\196P\220\128\177\129\146\144\143H\241\211\174w\176\29\239\230\224\152y\234',
"\173\183\181\159\245\252k\183\215*\20\254\245S\161\21c\152\195$\26\162\179\134\1726\139Q4}'\184",
'\27\155x\246^\1678\201\190\240\31\235\1\27(}\21^\194\141\159\235\230S\bv\253^;\169\240!\181',
'\211`\30\224\176\134\128\253\202\240"^j\bxA{\f\bO.O\171hF?\238\163\250\29\250\178\179\181',
'D\239D\fXI\152\138\145g!\170\207G\245\246D\239R\f8N\152\218~\0018\138\1\215\t\211\26Z0\144s',
'E\3\217\217z\162\2472\6\132I\172\181nc\192\213\31\0.c\192Y\194\244XEP\202s\22\3\2029\203-h',
'\28]\152\t\175"\27\198\3,b\26\29\152\202\233\vY\229\202a\235\196v\133\2415\236\22\212',
'\231L~X\217{9\225[\1\252aUD\141\189X\198\19.0\242\137w\24\231\1537\244\244$\131s\154\27QW\173',
'\183\234\224\127\21*\244\6/\164\204\188\189i\\\189\0\0\0\0IEND\174B`\130'}end)()end,[48]=function()local aa,ab,ac=a(48)
local ad return(function(...)local ae={}function ae.itemFromValue(af,ag)local ah,ai=pcall(function()return af:FromValue(
ag)end)if ah and ai then return ai end local aj,ak=pcall(function()return af:GetEnumItems()end)if not aj then return nil
end for al,am in ak do if am.Value==ag then return am end end return nil end return ae end)()end,[49]=function()local aa
,ab,ac=a(49)local ad return(function(...)local ae,af=ac(ab.Parent.services),{}local ag=ae.getService'RunService':
IsStudio()local ah=not ag and typeof(writefile)=='function'and typeof(readfile)=='function'and typeof(isfile)==
'function'and typeof(isfolder)=='function'and typeof(makefolder)=='function'and typeof(listfiles)=='function'and typeof(
delfile)=='function'and typeof(delfolder)=='function'if ah then function af.writefile(ai:string,aj:string)writefile(ai,
aj)end function af.readfile(ai:string):string return readfile(ai)end if typeof(appendfile)=='function'then function af.
appendfile(ai:string,aj:string)appendfile(ai,aj)end end function af.isfile(ai:string):boolean return isfile(ai)end
function af.delfile(ai:string)delfile(ai)end function af.listfiles(ai:string):{string}return listfiles(ai)end function
af.makefolder(ai:string)makefolder(ai)end function af.isfolder(ai:string):boolean return isfolder(ai)end function af.
delfolder(ai:string)delfolder(ai)end elseif ag then local ai=Instance.new'Folder'ai.Name='Filesystem'ai.Parent=ae.
getService'ReplicatedStorage'local function aj(ak:string):{string}local al={}for am in string.gmatch(ak,'[^/]+')do table
.insert(al,am)end return al end local function ak(al:{string},am:boolean):Instance?local an:Instance=ai for ao=1,#al-1
do local ap=an:FindFirstChild(al[ao])if not ap then if not am then return nil end local aq=Instance.new'Folder'aq.Name=
al[ao]aq.Parent=an ap=aq end an=ap::Instance end return an end local function al(am:Instance?):StringValue?if am and am:
IsA'StringValue'then return am end return nil end function af.writefile(am:string,an:string)local ao=aj(am)assert(#ao>0,
'Invalid path')local ap=ak(ao,true)assert(ap,'Invalid path')local aq=ao[#ao]local ar=ap:FindFirstChild(aq)local as=al(ar
)if as then as.Value=an else if ar then ar:Destroy()end local at=Instance.new'StringValue'at.Name=aq at.Value=an at.
Parent=ap end end function af.readfile(am:string):string local an=aj(am)assert(#an>0,'Invalid path')local ao=ak(an,false
)assert(ao,'File not found: '..am)local ap=ao:FindFirstChild(an[#an])local aq=al(ap)assert(aq,'File not found: '..am)
return aq.Value end function af.isfile(am:string):boolean local an=aj(am)if#an==0 then return false end local ao=ak(an,
false)if not ao then return false end return al(ao:FindFirstChild(an[#an]))~=nil end function af.listfiles(am:string):{
string}local an,ao:Instance=aj(am),ai for ap,aq in an do local ar=ao:FindFirstChild(aq)if not ar or not ar:IsA'Folder'
then error('Folder not found: '..am)end ao=ar end local ap:{string}={}for aq,ar in ao:GetChildren()do table.insert(ap,am
..'/'..ar.Name)end return ap end function af.delfile(am:string)local an=aj(am)assert(#an>0,'Invalid path')local ao=ak(an
,false)assert(ao,'File not found: '..am)local ap=ao:FindFirstChild(an[#an])local aq=al(ap)assert(aq,'File not found: '..
am)aq:Destroy()end function af.makefolder(am:string)local an=aj(am)if#an==0 then return end local ao:Instance=ai for ap,
aq in an do local ar=ao:FindFirstChild(aq)if not ar then local as=Instance.new'Folder'as.Name=aq as.Parent=ao ar=as end
ao=ar::Instance end end function af.isfolder(am:string):boolean local an=aj(am)if#an==0 then return false end local ao:
Instance=ai for ap,aq in an do local ar=ao:FindFirstChild(aq)if not ar or not ar:IsA'Folder'then return false end ao=ar
end return true end function af.delfolder(am:string)local an=aj(am)assert(#an>0,'Invalid path')local ao=ak(an,false)
assert(ao,'Folder not found: '..am)local ap=ao:FindFirstChild(an[#an])assert(ap and ap:IsA'Folder','Folder not found: '
..am)ap:Destroy()end end if af.writefile and not af.appendfile then function af.appendfile(ai:string,aj:string)local ak=
if af.isfile(ai)then af.readfile(ai)else nil af.writefile(ai,if ak then ak..aj else aj)end end function af.ensureFolder(
ai:string)if not af.isfolder(ai)then af.makefolder(ai)end end function af.ensureDir(ai:string)local aj=''for ak in
string.gmatch(ai,'[^/]+')do aj=if aj==''then ak else aj..'/'..ak if not af.isfolder(aj)then af.makefolder(aj)end end end
return af end)()end,[50]=function()local aa,ab,ac=a(50)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.
filesystem),ac(ab.Parent.path),'Rayfield',{}ah.__index=ah export type FileSystemManager={root:string,assets:string,
getPath:(self:FileSystemManager,subpath:string?)->string,getAssetsFolder:(self:FileSystemManager,subfolder:string?)->
string,getRootFolder:(self:FileSystemManager)->string}function ah.new(ai:string?):FileSystemManager local aj=ai or ag
local ak=setmetatable({root=aj,assets=aj..'/Assets'},ah)::any pcall(ae.ensureFolder,ak.root)pcall(ae.ensureFolder,ak.
assets)return ak end function ah.getPath(ai,aj:string?):string return af.join(ai.root,aj)end function ah.getAssetsFolder
(ai,aj:string?):string if aj then local ak=af.join(ai.assets,aj)pcall(ae.ensureFolder,ak)return ak end return ai.assets
end function ah.getRootFolder(ai):string return ai.root end return ah end)()end,[51]=function()local aa,ab,ac=a(51)local
ad return(function(...)local ae,af,ag={},2166136261,16777619 local function ah(ai:string):number local aj=af for ak=1,#
ai do aj=bit32.bxor(aj,string.byte(ai,ak))local al=aj%65536 local am=(aj-al)/65536 aj=(((am*ag)%65536)*65536+al*ag)%
4294967296 end return aj end function ae.deriveFlagFromName(ai:string):string local aj=ai:gsub('(%S+)',function(aj:
string):string return aj:sub(1,1):upper()..aj:sub(2,-1)end):gsub('[^%w]','')if aj==''and ai~=''then return string.
format('Flag%08x',ah(ai))end return aj end return ae end)()end,[52]=function()local aa,ab,ac=a(52)local ad return(
function(...)local ae=ac(ab.Parent.services)local af,ag,ah,ai,aj,ak=ae.getService'HttpService',ae.getService'RunService'
,ac(ab.Parent.filesystem),ac(ab.Parent.assetResolver),ac(ab.Parent.log),ac(ab.Parent.path)local function al(am:unknown):
string?local an,ao=pcall(function()return af:JSONEncode(am)end)if an and type(ao)=='string'then return ao else aj.warn(
'Failed to encode JSON:',ao)return nil end end local function am(an:string):unknown?local ao,ap=pcall(function()return
af:JSONDecode(an)end)if ao then return ap else aj.warn('Failed to decode JSON:',ap)return nil end end local an={}an.
__type='fontManager'export type FontFace={name:string,family:string,weight:number,style:string,assetId:string}export
type FontManifest={name:string,faces:{FontFace}}export type CachedFont={customId:number|string,manifest:FontManifest,
loadedFromDisk:boolean,variants:{[string]:Font}}export type FontCache={[number]:CachedFont}export type
FontResolverOptions={fallbackFont:Font?,saveToDisk:boolean?,skipCache:boolean?}type FontManagerState={_debug:boolean,
_pendingLoads:{[string]:{thread}},rootFolder:string,assetResolver:ai.AssetResolver,defaultOptions:FontResolverOptions,
fontCache:FontCache?}export type FontManager=FontManagerState&{resolve:(self:FontManager,id:number|string)->Font?,
loadFont:(self:FontManager,id:(number|string)?,fontWeight:Enum.FontWeight?,fontStyle:Enum.FontStyle?,saveToDisk:boolean?
,skipCache:boolean?)->Font?,getFontFromId:(self:FontManager,id:number|string)->Font?}export type fontManager=FontManager
local function ao(ap:unknown):FontManifest?local aq=ap::any if type(aq)~='table'or type(aq.name)~='string'or type(aq.
faces)~='table'then return nil end aq.name=ak.sanitizeFile(aq.name)if#aq.name==0 or#aq.faces==0 then return nil end for
ar,as in aq.faces do if type(as)~='table'or type(as.name)~='string'or type(as.assetId)~='string'then return nil end as.
name=ak.sanitizeFile(as.name)if#as.name==0 then return nil end end return aq::FontManifest end local ap={'\0\1\0\0',
'OTTO','true','ttcf','wOFF','wOF2'}local function aq(ar:string):boolean for as,at in ap do if string.sub(ar,1,#at)==at
then return true end end return false end local ar=getfenv()local function as(at:Enum.FontWeight,au:Enum.FontStyle):
string return tostring(at)..'|'..tostring(au)end local function at(au:unknown):number?if type(au)=='number'then return
au end if type(au)=='string'then return tonumber(au)end return nil end function an.__index(au:FontManagerState,av:
unknown):unknown local aw=(an::any)[av]if aw~=nil then return aw end local ax=at(av)if not ax then return nil end local
ay=au.fontCache if ay then local az=ay[ax]if az then local aA=as(Enum.FontWeight.Regular,Enum.FontStyle.Normal)local aB=
az.variants and az.variants[aA]if aB then return aB end for aC,aD in pairs(az.variants or{})do return aD end end end
return nil end function an.new(au:string,av:boolean?,aw:boolean?,ax:ai.AssetDownloadUrl?,ay:FontResolverOptions?):
FontManager local az=ay or{saveToDisk=true,skipCache=not aw or false,fallbackFont=Font.fromEnum(Enum.Font.SourceSans)}
local aA=setmetatable({rootFolder=au,fontCache=if aw then{}::FontCache else nil,assetResolver=ai.new(aw,ax),
defaultOptions=az,_debug=av or ag:IsStudio()or false,_pendingLoads={}}::FontManagerState,an)::any pcall(ah.ensureFolder,
au)return aA end local function au(av:FontManager,aw:number,ax:Enum.FontWeight,ay:Enum.FontStyle,az:string):Font?local
aA=av.rootFolder..'/'..aw..'.json'if typeof(ah.isfile)~='function'then return av.defaultOptions.fallbackFont end local
aB,aC:string?=false if ag:IsStudio()and av._debug then aj.warn
[[Font manifest loading is not supported in Studio. Using default font manifest for testing.]]aC=
[[{"name":"Inter","faces":[{"name":"Thin","weight":100,"style":"normal","assetId":"rbxassetid://12187277209"},{"name":"Extra Light","weight":200,"style":"normal","assetId":"rbxassetid://12187293441"},{"name":"Light","weight":300,"style":"normal","assetId":"rbxassetid://12187268450"},{"name":"Regular","weight":400,"style":"normal","assetId":"rbxassetid://12187266066"},{"name":"Medium","weight":500,"style":"normal","assetId":"rbxassetid://12187336822"},{"name":"Semi Bold","weight":600,"style":"normal","assetId":"rbxassetid://12187254443"},{"name":"Bold","weight":700,"style":"normal","assetId":"rbxassetid://12187275575"},{"name":"Extra Bold","weight":800,"style":"normal","assetId":"rbxassetid://12187267750"},{"name":"Black","weight":900,"style":"normal","assetId":"rbxassetid://12187359223"}]}]]
elseif ah.isfile(aA)then local aD,aE=pcall(ah.readfile,aA)aC=aD and aE or nil else aC=av.assetResolver:
getAssetContentFromId(aw,false)aB=aC~=nil end local aD:FontManifest?if aC then local aE,aF=pcall(am,aC)if aE and aF then
aD=ao(aF)else if av._debug then aj.warn('Failed to parse font manifest for font id: '..tostring(aw)..'. Error: '..
tostring(aF))end end else return av.defaultOptions.fallbackFont end if not aD then if av._debug then aj.warn(
'Font manifest is nil for font id: '..tostring(aw))end pcall(ah.delfile,aA)return av.defaultOptions.fallbackFont end if
aB and aC then pcall(ah.writefile,aA,aC)end local aE,aF=av.rootFolder..'/'..aD.name,true if not pcall(ah.ensureFolder,aE
)then return av.defaultOptions.fallbackFont end for aG,b in ipairs(aD.faces)do local c=aE..'/'..b.name:gsub(' ','-')..
'.ttf'if ah.isfile(c)then local d,e=pcall(ah.readfile,c)if not d or type(e)~='string'or not aq(e)then pcall(ah.delfile,c
)end end if not ah.isfile(c)then local d=av.assetResolver:resolve(b.assetId)local e=if d~=nil then av.assetResolver:
getAssetContentFromId(d,false)else nil if not e or not aq(e)then aF=false if av._debug then aj.warn(
'Font face content is missing or not a font for font id: '..tostring(aw)..', face: '..b.name)end continue end pcall(ah.
writefile,c,e)end local d,e=pcall(ar.getcustomasset,c)if d and type(e)=='string'then aD.faces[aG].assetId=e if av._debug
then aj.print('Loaded font face for id: '..tostring(aw)..', face: '..b.name)end else aF=false if av._debug then aj.warn(
'Failed to load font face for id: '..tostring(aw)..', face: '..b.name)end end end if not aF then return av.
defaultOptions.fallbackFont end local aG=al(aD)if not aG or not pcall(ah.writefile,aE..'/manifest.json',aG)then return
av.defaultOptions.fallbackFont end local b,c=pcall(ar.getcustomasset,aE..'/manifest.json')if not b or not c then if av.
_debug then aj.warn('Failed to load font manifest for id: '..tostring(aw))end return av.defaultOptions.fallbackFont end
local d,e=pcall(Font.new,c::any,ax,ay)if not d or not e then if av._debug then aj.warn('Failed to load font for id: '..
tostring(aw))end return av.defaultOptions.fallbackFont end local f=av.fontCache if f then f[aw]={customId=c,manifest=aD,
loadedFromDisk=true,variants={[az]=e}}if av._debug then aj.print('Cached font for id: '..tostring(aw))end end return e
end function an.loadFont(av:FontManager,aw:(number|string)?,ax:Enum.FontWeight?,ay:Enum.FontStyle?,az:boolean?,aA:
boolean?):Font?if az==nil then az=av.defaultOptions.saveToDisk end if aA==nil then aA=av.defaultOptions.skipCache end
local aB,aC=ax or Enum.FontWeight.Regular,ay or Enum.FontStyle.Normal local aD,aE=as(aB,aC),av.assetResolver:resolve(aw)
local aF=at(aE)if not aF then aj.warn('Invalid font id: '..tostring(aw))return av.defaultOptions.fallbackFont end local
aG=av.fontCache if aG and not aA then local b=aG[aF]if b then local c=b.variants and b.variants[aD]if c then if av.
_debug then aj.print('Loaded font from cache for id: '..tostring(aF))end return c end local d,e=pcall(Font.new,b.
customId::any,aB,aC)if d and e then b.variants=b.variants or{}b.variants[aD]=e if av._debug then aj.print(
'Loaded font variant from cache for id: '..tostring(aF))end return e else if av._debug then aj.warn(
'Failed to load font from cache for id: '..tostring(aF))end aG[aF]=nil return av.defaultOptions.fallbackFont end end end
if not az then if av._debug then aj.warn[[Font loading without saving to disk can be detected by Anti-cheats.]]end
return av.defaultOptions.fallbackFont end local b,c=av._pendingLoads,tostring(aF)..'|'..aD local d=b[c]if d then table.
insert(d,coroutine.running())return coroutine.yield()end b[c]={}local e,f=pcall(au,av,aF,aB,aC,aD)local g=if e then f
else av.defaultOptions.fallbackFont d=b[c]b[c]=nil if d then for h,i in d do coroutine.resume(i,g)end end return g end
function an.resolve(av:FontManager,aw:number|string):Font?local ax=at(aw)if not ax then return nil end local ay=av.
fontCache if ay then local az=ay[ax]if az then if av._debug then aj.print('Resolved font for id: '..tostring(ax))end for
aA,aB in pairs(az.variants or{})do return aB end end end return nil end function an.getFontFromId(av:FontManager,aw:
number|string):Font?return av:resolve(aw)end return an end)()end,[53]=function()local aa,ab,ac=a(53)local ad return(
function(...)local ae,af,ag,ah={},ac(ab.Parent.textMetrics),ac(ab.Parent.colors),ac(ab.Parent.flagNames)ae.textWidth=af.
textWidth ae.textHeight=af.textHeight ae.deriveFlagFromName=ah.deriveFlagFromName ae.contrastColor=ag.contrastColor ae.
toColorSequence=ag.toColorSequence ae.contrastText=ag.contrastText return ae end)()end,[54]=function()local aa,ab,ac=a(
54)local ad return(function(...)local ae,af=ac(ab.Parent.imageCache),ac(ab.Parent.variables)type AvatarCallback=ae.
AvatarCallback type PreloadCallback=ae.PreloadCallback local ag={}ag.rewrites=ae.rewrites ag.onBlock=nil::((unknown)->()
)?type PendingProperties={[string]:boolean}ag.pending={}::{[number]:{[Instance]:PendingProperties}}local ah,ai:{[string]
:boolean}=false,{Image=true,HoverImage=true,PressedImage=true}local function aj(ak:unknown):number?if type(ak)=='number'
then return ak elseif type(ak)=='string'then return tonumber(string.match(ak,'^rbxassetid://(%d+)$'))end return nil end
local function ak(al:unknown):string if ag.onBlock then ag.onBlock(al)end return''end function ag.preload(al:
PreloadCallback?):(boolean,number)ah=false return ae.preload(function(am)ah=true table.clear(ag.pending)if al then al(am
)end end)end function ag.avatar(al:number,am:AvatarCallback?):string if not af.secureMode then return`rbxthumb://type=AvatarHeadShot&id={
al}&w=48&h=48`end return ae.avatar(al,am)end function ag.assign(al:Instance,am:string,an:unknown)local ao=al::any if not
ai[am]then ao[am]=an return end ao[am]=ag.resolve(an)if af.secureMode and not ah then local ap=aj(an)if ap and not ag.
rewrites[ap]then local aq=ag.pending[ap]if not aq then aq=setmetatable({},{__mode='k'})::any ag.pending[ap]=aq end local
ar=aq[al]if not ar then ar={}aq[al]=ar end ar[am]=true end end end ae.onCached=function(al:number)local am=ag.pending[al
]if not am then return end local an=ag.rewrites[al]if an then for ao,ap in am do if ao.Parent then local aq=ao::any for
ar in ap do aq[ar]=an end end end end ag.pending[al]=nil end function ag.resolve(al:unknown):string if al==nil or al==0
or al==''then return''end if type(al)=='string'then if string.sub(al,1,11)=='rbxasset://'then return al end if string.
sub(al,1,11)=='rbxthumb://'then return if af.secureMode then ak(al)else al end end local am:number?if type(al)=='number'
then am=al elseif type(al)=='string'then am=tonumber(string.match(al,'^rbxassetid://(%d+)$'))end local an=if am then ag.
rewrites[am]else nil if an then return an end if af.secureMode then return ak(al)end if type(al)=='number'then return
'rbxassetid://'..al end if type(al)=='string'then return al end return ak(al)end function ag.thumbnail(al:unknown,am:
number?):string?local an=am or 150 if type(al)=='number'then return string.format(
'rbxthumb://type=Asset&id=%d&w=%d&h=%d',al,an,an)end if type(al)=='string'then local ao=string.match(al,'^%d+$')if ao
then return string.format('rbxthumb://type=Asset&id=%s&w=%d&h=%d',ao,an,an)end return al end return nil end function ag.
iconFrom(al:{[string]:any}):any local am=al.thumbnail or al.Thumbnail if am~=nil then return ag.thumbnail(am)end return
al.icon or al.Icon end return ag end)()end,[55]=function()local aa,ab,ac=a(55)local ad return(function(...)local ae,af,
ag,ah=ac(ab.Parent.filesystem),ac(ab.Parent.path),ac(ab.Parent.variables),ac(ab.Parent.constants)export type RewriteMap=
{[number]:string}export type CacheSettledCallback=(failed:number)->()export type PreloadCallback=CacheSettledCallback
export type AvatarCallback=(uri:string)->()export type OnCachedCallback=(id:number)->()export type ThumbnailEntry={state
:string?,imageUrl:string?}export type ThumbnailResponse={data:{ThumbnailEntry}?}local ai,aj,ak,al,am,an,ao,ap:{[number]:
string}={},ag.fileSystemManager:getRootFolder(),ag.fileSystemManager:getAssetsFolder(),ag.assetResolver,
[[https://raw.githubusercontent.com/SiriusSoftwareLtd/rayfield-gen2/main/assets/]],48,
[[https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=%dx%d&format=Png&isCircular=false]],{}for aq,ar
in ah.icons do local as=ar::number ap[as]=am..tostring(as)..'.png'end local aq=0 for ar in ap do aq+=1 end ai.rewrites={
}::RewriteMap ai.onCached=nil::OnCachedCallback?local ar='\137PNG\r\n\26\n'local function as(at:string,au:string):string
?if type(getfenv().getcustomasset)~='function'or typeof(ae.isfile)~='function'then return nil end if not ae.isfile(at)
then pcall(ae.ensureFolder,aj)pcall(ae.ensureFolder,ak)local av=al:getAssetContentFromUrl(au,at,false)if not av or
string.sub(av,1,8)~=ar then return nil end if not pcall(ae.writefile,at,av)then return nil end end local av,aw=pcall(
getfenv().getcustomasset,at)return if av and type(aw)=='string'then aw else nil end function ai.embedded(at:string,au:
string):string?local av=getfenv()if type(av.getcustomasset)~='function'or typeof(ae.isfile)~='function'then return nil
end local aw=0 for ax=1,#au,7 do aw=(aw*31+string.byte(au,ax))%2147483647 end local ax,ay=(af.join(ak,string.format(
'%s_%d_%d.png',at,#au,aw)))if ae.isfile(ax)then local az,aA=pcall(ae.readfile,ax)ay=if az then aA else nil end if ay~=au
then pcall(ae.ensureFolder,aj)pcall(ae.ensureFolder,ak)if not pcall(ae.writefile,ax,au)then return nil end end local az,
aA=pcall(av.getcustomasset,ax)return if az and type(aA)=='string'then aA else nil end function ai.logo():string?return
ai.embedded('logo',ac(ab.Parent.logoImage))end function ai.discordIcon():string?return ai.embedded('discord',ac(ab.
Parent.discordIcon))end function ai.remote(at:string,au:string):string?return as(af.join(ak,at..'.png'),au)end function
ai.clickIcon():string?return ai.embedded('click',ac(ab.Parent.clickIcon))end function ai.layoutIcon():string?return ai.
embedded('layout',ac(ab.Parent.layoutIcon))end local function at(au:number):string return af.join(ak,'avatar_'..
tostring(au)..'.png')end local function au(av:string):string?local aw,ax=pcall(function()return ag.httpService:
JSONDecode(av)end)if not aw or type(ax)~='table'then return nil end local ay=(ax::ThumbnailResponse).data if type(ay)~=
'table'then return nil end local az=ay[1]if type(az)~='table'then return nil end local aA=az::ThumbnailEntry if aA.state
=='Completed'and type(aA.imageUrl)=='string'then return aA.imageUrl end return nil end local function av(aw:number):
string?local ax:string?for ay=1,4 do local az=al:getAssetContentFromUrl(string.format(ao,aw,an,an),'avatar:'..tostring(
aw),ay>1)if az then local aA=au(az)if aA then ax=aA break end end if ay<4 then task.wait(0.3)end end if not ax then
return nil end return as(at(aw),ax)end local aw:{[number]:{AvatarCallback}},ax:{[number]:boolean}={},{}function ai.
preload(ay:PreloadCallback?):(boolean,number)local az=getfenv()if type(az.getcustomasset)~='function'or typeof(ae.isfile
)~='function'then if ay then task.defer(ay,aq)end return false,aq end local aA=ai.rewrites table.clear(aA)local function
aB()if not ay then return end local aC=0 for aD in ap do if not aA[aD]then aC+=1 end end ay(aC)end local aC,aD,aE=0,0,
true for aF,aG in ap do local b,c:string?=(af.join(ak,tostring(aF)..'.png'))if ae.isfile(b)then local d,e=pcall(az.
getcustomasset,b)c=if d and type(e)=='string'then e else nil end if c then aA[aF]=c else aD+=1 aC+=1 task.spawn(function
()local d=as(b,aG)if d then aA[aF]=d if ai.onCached then pcall(ai.onCached,aF)end end aC-=1 if aC==0 and not aE then aB(
)end end)end end aE=false if aC==0 then aB()end return aD==0,aD end function ai.avatar(ay:unknown,az:AvatarCallback?):
string if type(ay)~='number'then return''end if typeof(ae.isfile)~='function'then return''end local aA=at(ay)if ae.
isfile(aA)then local aB,aC=pcall(getfenv().getcustomasset,aA)if aB and type(aC)=='string'then return aC end end if ax[ay
]then return''end local aB=aw[ay]if aB then if az then table.insert(aB,az)end return''end if az then aw[ay]={az}task.
spawn(function()local aC,aD=av(ay),aw[ay]aw[ay]=nil if not aC then ax[ay]=true return end if aD then for aE,aF in aD do
pcall(aF,aC)end end end)end return''end return ai end)()end,[56]=function()local aa,ab,ac=a(56)local ad return(function(
...)return table.concat{
'\137PNG\r\n\26\n\0\0\0\rIHDR\0\0\0000\0\0\0000\b\6\0\0\0W\2\249\135\0\0\1gIDATx\156\236\153;n\0021\16\134\199(}\218(\169#\229q'
,
'\128DJ\23"\165%I\27\164\20\17\247\224.\208!\30-\143\142\130\6Q\193\rxu\220`\249-(\204\224eE\193\142w5\1594\26yl\173\231G6\222\245\20(\227\20(\227\168\0'
,
'i\174NuFQT\134+\193^a\183\148.\v\216\b\2142\198\212\226\6\25_\16\137\223\192\213a\239\20\6=X\25B\214\188#N\192\16\238\141\194b\0\1\31<x\180\a\144\252?\133'
,
"\151\188\165\136\220\254x\208\183\137\127X\187\1{4)c\231\220\207\237\242\205\147=ZBP\185\129\187vB\207x\222\140\4@.OpS'\180@.w\238\24\159\128\232`\192\238\215\16#"
,
")\31=\200\164Q\1\210\228\251]\200\194\255\5BC\151\1444\249\223\3I'\241\165O\238\164=\168KH\26\21 \141\n\144F\5H\163\2\164Q\1\210\168\0iT\1284\185\20\176r\27"
,
'\251\vV\17<s/\249\24\159\128\tkW\241\160{J\25\204\249`\231f\2251\31\231\187\157\254\130kR\152|\226\147\187\235\6\226JL}\184"\133E\a\201\151x0n\19\255\194\250\20'
,
'\14\182\200W\241u$]\153X!\182\172\243B\233\151Y\231\180+\179\182\207.\179f\t=\200\164\201\188\128-\0\0\0\255\255#\27\199\148\0\0\0\6IDAT\3\0\131G^\145\159k'
,':\246\0\0\0\0IEND\174B`\130'}end)()end,[57]=function()local aa,ab,ac=a(57)local ad return(function(...)local ae,af={},
64 local ag,ah,ai=af-1,38,3 export type Mode='top'|'sidebar'export type Layout={mode:Mode,topbarHeight:number,
chromeHeight:number,pageDirection:Enum.FillDirection,fadeSize:UDim2,fadeTransparency:NumberSequence,fadeCorners:{string}
?,tabStripTop:number?,tabStripHeight:number?,railWidth:number?,railCollapsedWidth:number?,railCollapseBelow:number?,
rowHeight:number?,rowCornerRadius:number?,rowSpacing:number?,railPadding:number?,rowInset:number?,rowPadding:number?,
rowContentSpacing:number?,rowIconSize:number?,footerHeight:number?,avatarSize:number?,cardTransparency:number?,
cardStrokeRotation:number?,cardStrokeTransparency:NumberSequence?,cardCorners:{string}?}ae.top={mode='top'::Mode,
topbarHeight=af,chromeHeight=ag+ah+ai,tabStripTop=ag,tabStripHeight=ah,pageDirection=Enum.FillDirection.Horizontal,
fadeSize=UDim2.new(1,0,-9.3E-2,100),fadeTransparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(0.4414,0),NumberSequenceKeypoint.new(0.7007,0.631),NumberSequenceKeypoint.new(1,1)}}::Layout
ae.sidebar={mode='sidebar'::Mode,topbarHeight=af,chromeHeight=af,railWidth=219,railCollapsedWidth=64,railCollapseBelow=
589,rowHeight=38,rowCornerRadius=14,rowSpacing=4,railPadding=17,rowInset=15,rowPadding=10,rowContentSpacing=6,
rowIconSize=20,footerHeight=60,avatarSize=34,pageDirection=Enum.FillDirection.Vertical,cardTransparency=0.98,
cardStrokeRotation=55,cardCorners={'TopLeftRadius','BottomRightRadius'},cardStrokeTransparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.9),NumberSequenceKeypoint.new(0.128,0.95),NumberSequenceKeypoint.new(0.414,0.985),
NumberSequenceKeypoint.new(1,1)},fadeSize=UDim2.new(1,0,0,55),fadeTransparency=NumberSequence.new{NumberSequenceKeypoint
.new(0,0),NumberSequenceKeypoint.new(0.377,0),NumberSequenceKeypoint.new(1,1)},fadeCorners={'BottomRightRadius'}}::
Layout function ae.get(aj:unknown):Layout?if aj=='sidebar'then return ae.sidebar elseif aj=='top'then return ae.top end
return nil end function ae.railWidthFor(aj:Layout,ak:number):number if aj.mode~='sidebar'then return 0 end local al=aj.
railWidth::number if ak<(aj.railCollapseBelow::number)then return aj.railCollapsedWidth::number end return al end return
ae end)()end,[58]=function()local aa,ab,ac=a(58)local ad return(function(...)local ae,af,ag=ac(ab.Parent.variables),ac(
ab.Parent.log),{}export type LocaleToken={[any]:string}export type Translator=(source:string,localeId:string)->string?
export type TranslationTables={[string]:{[string]:string}}ag.strings={}::TranslationTables ag.current='en'ag.translator=
nil::Translator?local ah={}local function ai(aj:string):string return string.match(aj,'^(%a+)')or aj end function ag.t(
aj:unknown):unknown if type(aj)~='string'or aj==''then return aj end return{[ah]=aj}end function ag.isToken(aj:unknown):
boolean return type(aj)=='table'and type((aj::{[any]:unknown})[ah])=='string'end function ag.sourceOf(aj:LocaleToken):
string return aj[ah]end function ag.resolve(aj:unknown):any if type(aj)~='string'then return aj end if ag.translator
then local ak,al=pcall(ag.translator,aj,ag.current)if ak and type(al)=='string'and al~=''then return al end end local ak
=ag.strings[ag.current]if ak and ak[aj]then return ak[aj]end local al=ag.strings[ai(ag.current)]if al and al[aj]then
return al[aj]end return aj end function ag.register(aj:TranslationTables?)if type(aj)~='table'then return end for ak,al
in aj do if type(ak)=='string'and type(al)=='table'then ak=string.lower(ak)local am=ag.strings[ak]if not am then am={}ag
.strings[ak]=am end for an,ao in al do if type(an)=='string'and type(ao)=='string'then am[an]=ao else af.warn(`Rayfield: skipping a '{
ak}' translation, entries must be string to string.`)end end end end end function ag.setActive(aj:string?):string ag.
current=if type(aj)=='string'and aj~=''then string.lower(aj)else'en'return ag.current end function ag.detect():string
local aj=ae.localizationService.RobloxLocaleId if type(aj)=='string'and aj~=''then return string.lower(aj)end return'en'
end return ag end)()end,[59]=function()local aa,ab,ac=a(59)local ad return(function(...)local function ae<T>(af:T):T
local ag=af::any function ag.Lock(ah,ai:string?)ah.window:_setElementLocked(ah,true,ai)end function ag.Unlock(ah)ah.
window:_setElementLocked(ah,false)end function ag.IsLocked(ah):boolean return ah.locked==true end return af end return
ae end)()end,[60]=function()local aa,ab,ac=a(60)local ad return(function(...)local ae,af=ac(ab.Parent.runtime),{}type
SuppressPredicate=()->boolean local function ag():boolean return ae.secureMode end local ah:SuppressPredicate,ai:
SuppressPredicate?=ag function af.setSecureModeSource(aj:SuppressPredicate?)ah=if type(aj)=='function'then aj else ag
end function af.setSuppressPredicate(aj:SuppressPredicate?)ai=if type(aj)=='function'then aj else nil end local function
aj():boolean if ai and ai()then return true end return ah()end function af.warn(...)if aj()then return end warn(...)end
function af.print(...)if aj()then return end print(...)end return af end)()end,[61]=function()local aa,ab,ac=a(61)local
ad return(function(...)return table.concat{'\137PNG\r\n\26\n\0\0\0\rIHDR\0\0\0`\0\0\0`\b\6\0\0\0\226\152w8',
'\0\0\0\1sRGB\0\174\206\28\233\0\0\0DeXIfMM\0*\0\0\0\b\0\1\135i\0',
'\4\0\0\0\1\0\0\0\26\0\0\0\0\0\3\160\1\0\3\0\0\0\1\0\1','\0\0\160\2\0\4\0\0\0\1\0\0\0`\160\3\0\4\0\0\0\1\0\0\0`',
'\0\0\0\0\1693_N\0\0\27wIDATx\1\237]\t\144U\213\153~\239\245\246z\167\27h\232\133',
'\134f\213\6%\160h\212\17\200H\200\160\227\164fp\25\163NJc\20Ep\153\24\181JF\167*\227dL\212\148',
'\209T9\1623\168D\v\212\184o\133\27#:$\0255\130\148\18A\1\217\148\197\166\247\229\1897\223\247',
'\253\231\220\247 N\167\155^\30S\190\219\220w\207=\231?\219\247/\231?\231\158{\t\1332G\6\129\f',
'\2\25\0042\bd\16\200 \144A \131@\6\129\f\2\25\0042\bd\16\200 \144A \131@\6\129\f',
'\2\131\130@xPj\233\199JN\1709)\255\230\1657\31?z\244\232\19\179\179\179\235s\178sFdegE:;;\27;::',
'\182454\188\251\254\a\31\252\247\197\23_\188\185\31\171\205\20\181h\209\162\146\223\255\246',
'\247W\237\222\185\251\157\230\230\230\206\196\255q\196\186b\137\253\251\247\239\219\180i\211\242\167',
'\159~\250\155\25\228\250\1\129\167\158z\234\219\187v\237z\215c\14I\143\227\140uvt\198 \249:y\223',
'\222\222\174\179\171\179K\164\141\141\141-\235\215\175\191\253\252\243\207/\233\135f|=\139x\251\205',
'\183\0234565\19\209\142v\128n\128\199\1r\188\171\235\144\19qdJ{[\155\206.h\3\143O>\249\228\149',
'{\238\185g\228\215\19\193>\244\250\1737\223\186\172\165\165%\6\160\5~Wg\231\159\130\14&\128 ',
'\229\140\233\232\1286\180"/\25F&l\222\188\249\181\27.\191\161\172\15\205\249ze}\234\169\231f',
'\30h8\208H\240iZ\14\149v\216z\198\197\192\20\153\162\14H\190\204\18\238\161\29:[ZZ\141\tH#',
'\19`\142\238\5\138\255\239\28\143A\231<<\152\226m\219\182\255\142\160\t|gn\0:4 \22\167T3',
'\190\181\1815\214\210\220\18\195\160\156r6\5\225\166&\132\155\154E\199\188\208\166\174\151_~\249',
'\244A\239P7\21fu\147\150\182\164_\254\242\158\171\234\235\143\250>\128\142G"\145p8\28\241mI\0',
'\200\16\228;\20\143\199u&\18\241\16\248\164SD.\156@:"\249/\132_%E\163\209,\184\174\227\182o',
'\223\254\235\r\0276t\249B\211y\rz\150\206F\164\214}\219m\183\141\1560a\220b\130\202\3\232\195f',
'\24\192`\136\3\223\1.pADR\208\139)\4=\1420\239u\26\16300\132::;\19U\149\149\223\188\250\234',
'\171\231\179\236#\2258\226\0240w\238\220\171***jh\243\179\178\178d\176\137/\238\19q\128(\145&\226',
'\4\218_\161\5\4[\154 \240\161\21\184\250S\140A^\f\26\137\156\220\220\16&q\215\209\204e',
'\24p\b\2\247\223\127\255\164\218Q\163.\131\153I\192\244P\178\195\30|J006\144\r\255\228=\217',
'\20\164Y"\153\0190\5\25c\1778\24\0-\232\232HTVV\30{\201%\151|\255\144\234\211r{Di\192\140',
'\0253\174/+//\131\141O\192\244\208\246\132\226\177x\2^\141\129\rP\1\175\164\223\208r\247>\30',
'\145\222\244P\250\201\21?>0\158L\228$\141E\143\0277n\241-\183\220Rn\229\164\239\247\136a\192\138',
'\21+N\24S[\251\247\152HI\250#\225\136\16\236\236\234\20\144\18q\134\16K\216\5\189\184\1938F&',
'\193F\162Q0\142\127J\131\6\196m\0\239\196Lz\248\240\225\19\230\205\155\247\195\244Ao5\31)\f',
'\136L\1596\253\198\226\210\210|\216k2@\190:\236>\2368\2369\219*\16\147p\17\212x\138\a\228\195',
"\164H\154\30\230\1793\208\4hA'\203E\254\177c\199^y\199\29wT3O\186\142#\130\1/\188\240\194_UUW",
"\2535\2373V6\133\5\1\21\3x'\137v\1'\209\198\21\241E`\26\131L\218\ru\166y\233g\1b\163<",
'%\154"\186\184\195\134\r\1719\237[\167-T\133i\250I;\3\206>\251\236\252\163\143:\250\159\242',
'\243\243\179\1\152\217~\128A\151S^\140\1763\14\16C\139\147aq\0\211\2237|\t\1841\194\232@\156',
'\194\4&QkB\26\v8 \147\0175\181\163.\189\247\222{\199\165\t\255P\218\25p\249\229\151\159\a',
'\233?\0173[\185\157\4\130\192\240$\204\128-\249\a\0\t\162p\166\155i\201\22GZ\254S"\19',
'\220\128\204\t\155\220T\239\154b,@\217\212.\156q\140\249CO=\245\212\127T\1344\252\164\149\0017\222',
"x\227\208I\19']/\127\31\158\t\6^8>\225\4\128q\232\26\160\2Z\224 \218]\147v\222\226\132;Y",
'\133\0\255\130t\222\1859A*#8\155&\19\192\140DUU\213?<\250\232\163S\211\128\127z5`\254\252\249\v',
'!\253\19\253\146\3\0\b\211\235\161y\16\208\134\182A\206\176\147ns1\25m`\a\241\2\223\200',
"\24'r\130\239\255\\y\188\247Z\128\186\19\165\165\165\133\211\166MK\139\22\164M\3hw\199\142",
'\25{%\165\144N\15}sHhB\182\159\128\1\172\192\220\208\150\203\1488\200-1H\151\180#\15\2551\163',
'\215\2\133\21\229\226\148\6\18\167\17N\3\164\5\213\213\213g?\254\248\227\167\144\173\131y',
'\164\141\1\167\156r\202MeC\203\134C\18\227Xl\227\172K\224s\217\128\a\165\212\254\220 \203\187',
'\0\220TW\147\3m\n\141\232\184\254c\244b\130\a>`\164[\31\130\166\145\225\212\130\194\194\194',
"\232\177\199\30{\29\170\30TL\6\1812!\139\159'W\174<y\204\232\209\231rq,+\130\245\30\192\239M",
'\2i\b\180\a\14x\26#R\165[\128\186AU\180\142!\14tF)\151\232T\1284\136\229r\28\144\0060\ff',
'{-\1925\1-8\227\165\151^:\141\185\a\235H\a\3\178\166L\155\182\164\176\168(\31f\5\147.\205',
'\185\18\29\157\29\0010\30|\2\233%9\144~\129L\169\167~\136O\2\146Z@@=\184\201t\3Z\224{\6!',
"'i\201\f\1427\152}\147\17\t\186\194\147&M\186~\246\236\217\217\131\197\128A\127\30\128I\215Y",
'\223\152\250\141\31\195\v\t\211\251\t\193\252\224!\v\204\0\24 @Mb\189\0043R\166\136Wr',
"\196\3OZ\0\202\131\191L\19+I-:\198;z^D\201\31,n'oDC:[y\r\135\n\139\n\235\234j\235\214?",
'\248\208\131\27\130,\3\24\24T\6\\q\197\21E\240|\254sH\217\144JH\160\204\15\209hko#\130',
'\0010\30\31\3\202\226A\15Ce@\18`{\16c\200\28\204\24\1637\26\132IBz#U\248\208{\166\209\5',
'\142@ \240\208&\146\27\205\29\179m\219\182\135\a\227\161\205\160\154\160\v.\184\224\146\202',
'\202\170\169Xr\b&]4=2\29\2\200\192#\204\2_@3l0\194\219\t{`\137\168\133\1579\18\173\153 ',
'\217y\159\215\153\0261\140awj\141\t\225\152\238\245\176\134\207\v8 \199+*F\204X\188x\241\133\158',
'g\3y\0294\r\184\243\206\127\0293{\214\156\255\200\207\143\22a\212MP\226\216\249\182\182\182$',
'\216BU\240+N\0\163\247I\208)\201\198\28\31\199\235\1592L\153\172\f\150\201\195\152\168;\198',
'\1526\153\217\226\1867\203e\155h\138\242\242\242\194999\19\139\139\139\31~\253\245\215\161\158\3',
'w\f\154\6|k\246\188\31\r\175\24>\18\155\25\248\156W\29n\239h\23\184\4\135\127\246\143',
'\0\2434\201\150v\16<\253\227\224i\233\202#\186$\189\164\219\197\217L\216i\a\24\157d\152+W\1316',
"\202s\1317\1890,\135@\3\186\248\208&>r\228\200IX\174\190h\224\160\183\146\aE\3\150/_~\194\137'",
'\156x\'\128\207!\248\1484\r\188\29\29j\5A\208A\144=\168b\t"pH\202}<\174>.\160uq\4\157',
'\140\225)*^uK\208}9\202\1572\128\147V\212*\151^\25\158\220\135r\178\178\169\5G\215\212\212<\242',
'\226\139/6+q\0~\6C\3\178\240\164kIIiI!\128N\192\233\145\212uH\250\r/AB\128\240G\16uJ\210',
'\r4\2\237\227SA\15\194\180\229\\\188#\29\n\147\2140N\249\28sY:\239E\235\235\0cP\15\181',
'J\218\131\199\150\237\237\29rK9\22\140\0241\162\22.\233\21\3\128{P\228\128k\0\220\2063\1439',
'\230\152%\28\244h_)\253\152\128q\176S#\188\169\00168$\166\2J\236H\208e4\224te:\169H|P\188\162]>',
'\149\226hT\nIu\175|F*"\147|\239[\185\4\18\195\223\202\198s\tla\225xP_WW\247\216s\207=\247',
'\165\207\218\159\215\1\213\0\238<\152<y\242\205\152\224`\1533\172\181~\14\188\176\177\2\197',
'\219s\15\178$1\21X7\14x\143\197\164\213y2\162\243\147/o\227\221=\210l<`<\227\176\188\205\171N2',
'\212\133)\249\208\28\209\162]\172\223\218\215\14!\233\208\3\252\242\242\242\138\1533g^\219\159',
'\160\167\1505\160\f\248\193E?\184\20\211\251\233\2166\232\182\152\132\185\211M\29\22\232\2320',
"\5\206\194\30D\147xc\142\129\226M\18\129J2\203\210xo\233L\179\178H\199\195\202\229\21'\235J\1",
'\156i\158\198\234\130\233"3pR;\219\219\218e\214\184)\160\186\170\250"<\179>F\25\250\249g\192',
'\24p\251O~2j\252\196\241\215\176\211\182\193!\172MU\216\209i]\0\0\250\227U\1929\192p\227\129Ne',
'\2R\149\2073@\128*\31\243\219\233\243\153%K\198yO\135\140b)V\159\215\18\151\159\204\197\159\205',
'\v\18!\236\196\22#\160\t\137\210!\165ES\167N\29\144\229\234\1c\192_\158~\250\141\216`U\1415',
"\22H\191s;S\164_\221u\192\t@v\31\247\aI\175K'\248\162\161\4{-P\28J\161d\167\148\195\157\15",
'27\160\243\3w\144\199\211\165\212\229\235\20sP\22\185Cz>\176\225\28\133\139u\182PWu\238\147O>yr',
'?+\192\192,\189\210\237\172\171\27\203\189\157z\200\206\137\14\213\154\157\t\192J\1\142\157',
'\246\241\236\160\15\219\213\238=\152\192N\233\4I\167l\188\v\v@\164\1874\16\1764\22\207\139',
'\187\2`gj\24\225\203\161\23E\233\183:\205\188\209\\\194|\162\237]X\174.\138b<\187\1%\245\171',
'\208\246kah\28\143\172\25\199\207\184\25j[\128\206h\198K\19\192\206\168s\0\201\128K\130.\233#',
'\24\160\19x)\f\209\0,\160@/\128\146`S\250\rU^X\158\3\16\141\224\189\151j."!%\136\243',
'\204\132yO\209 +\151\26\4\187\31,\143S\vh6\177\r\30\203\2135\243\176\\\253\29\245\178',
"\159~\250\221\r\229j'\236\229\r\0\25\139mt~\194Zl\227\146\175\t\162\1\0014\4\136L\136RR",
'@#\128N\26\153$\198\128\158y4\188\250\188\4\220\1\225\146AB&\186\154<\29\168\152\142\2T\167',
"\203\162{\31\182t\222\209-\165'jWV\192\1732t\161\225\205\161K\145\2347\223|\243\215;w\238\244\19",
'\f\209\31\238O\1912\224\210K/-=k\254\252ep\221F\0\4L\186\176\222\3\213\214z\15\165\r\127',
'~`5\192\156\148\226\134RI\148\236b\146\2365E\157s4&\233\6\228W\133Y>\129\230\193t\6u\213}\170w',
'\132\4`\20469r\229\17\236\14|\134\149\23\247\185\1859!<<J\20\21\21\141\1538q\226\a\15=',
"\244\208\a\202\208\199\159~e\192]w\221uu}}\253\247`3\227\218`\133\190\181\193\157\227\178\3;*i'",
'\200\0I\2149\176\185\136c\188\1922\t6\243a\128\201d\16%\230\19\157I\190\149g\204J\205o\152\176',
"<N\228|:c}=(\203\238T\1678\192('\244\188\b|\18)\206&f\0178\19\156\211\228\230\230\142\223\179g",
'\207\195\239\191\255\190\205&Iw\152G\1911\224\238\187\239\30=s\230\172\165\209h^\17\4F\182\159;',
'\28\240\174\150\3\205w\30\182\22\141\245&\1984\130\189\a\184\1352\132\177H\n@tZD\176\141A',
'\150\207\211\176\f\31FQ*SL"\243\28\248\140=\248`\154R\129\181\173\138&\211\185Z\n\14\136',
'\t\161\16\214\134h\154\18%%%UX\172\219\250\192\3\15\252O\146\246\240B\253\198\128\159\222\250',
'\211\127\171\27[7\27\222N\28\170\138m\229\137\16^!\130g\1935\26\243*\4\156\151\226C\193>\4T',
'\0\28&x\0308\3\157\210\140\24\252\136\129LE9\1\227\200 I<\193p\f%\248\134\1774\143)\186gA',
'\238`y\138s@\251x"\1759\fM\18H\168\213Z\158\136\218r5\24\178\28\227A\159\150\171\251\133\1',
'+W\174<\245\248\25\199\223\142\198b\172\194z\15l\191-\237b\224E\231\188\148{p\4 :\228\2375\251o',
'\18m`*\2223\n\137\194\135LdX\1403F\16\21\1979\208m\176\246\240\25\168JG\148\a\25W\189s\128',
'\146\\\185L\180\250\21\193\236\150Uy\200\19? S\27rrr\177\158%-\24\134\253D{\151.]\250\22\179',
"\28\238\209\31nh\206\244\233\199-\193\195\139(:'\211C\127\159\235=\0042\t\190\2390\192\243 \18@",
'\132\225\230I\218\233\254\25=\226$\217\a\175\211H\218\193\4\r\206\156p\137\254`\26\174\251',
'\216\250\142\209\17x\163\199U\f\244Ld{l|\240L\228Um&\179]\219\217\14\185\166\184r}\136\14\5',
'\2314<\176\187zQ_\223?\238\243\211\255U\171V\157[]]5\a\rK\224\187\r\148+I\191_\30&\0\2',
'\129\157\138\17\4\207\0\198S\vpO\1\141\199h\182p\24(\202C\147b\169\4Dv@\24\186\248\228 ',
'L\161\197\31\226\253aL\246\247\188\210\156\176"U\130{\197A\184U\173\178q\169\1564\254\228\179',
'\0014\15\237\1985\194\246c>\3\6`\133\148\2\198\221\213\163\176\191\137\187\171\151\168\128',
'\195\248\233\147\t\186\230\154[\202\255\230\204\185\2030\233\26F\232h~(\29\148\18\147 JR\242$',
'\168\30\24\133\133\143I(\145a\30\198\155\164"\31\194\134\152\24\21\166\1963]p\at\150\a',
'\196\198\4\198\147\169t\129p\184\176\160\177:\229\2\b\127\171\222\2293\134h\188e\f\t\188',
"\233!G\20\214\21c\1LlvN\182\198\3<\196\1592a\194\132'\240]\138}\170\164\151?}\210\128s\206\249",
'\206b\236\237\156Di\224\224\196\206\26\248\4\221\128\240\f\16\176\135\0L,\r \1637\128\b',
'\1681\141\233)q\bz\237`/I\199t\203\203\27\193\198+\19tg\207\19D\29\196I\23\148\170\2(\238<x',
'aY\224\155\192\134q&\195\253\182Ij4\227c\177\136&\150\212\130\246\236\142DYY\217\208\147N:\233G\200',
"\189\128\197\244\2468\2361\0n\231Dp\254J4L\239\\\177q\180\251\242\249\29p\2\31\29'3\204\142",
'\154\189\150-w\f\242`\203v\203\174\199 \233\177\240\193\f\228\171E\6\180\197s{\185\237j\1953f',
'\128F\224\146\f7F!\6\241\198\b\207\16\194CF1\222\210\2\6\a\194\225\203\242\229Y\251\189',
" \145)\172\179\r\2385\150'\184\177+1j\212\168\243\31{\236\177i,\189\183\199ak\192\172Y\179\150",
'\f\197\1\137\143\2113\224\0143N\186|CM\178\209Y\153 \a<@\162 \18\130$\240\f\219\169\1970',
'\217\29\211\f0%L\24\15\178\245N\226-O\156\150\29\165\2410\144Q\157\29\188\149\191\131+\196',
"\204K\26\211\149\196h{\r\205\232\241\235\172\22B,\132*\1931\192J\199\r\188\0310'\v'\250\202G",
"\170]\157\24\v\160\5p@\138\240\212\239\199 9\143t\1899|\187z\147'\180b\197\19\179\198\214\213",
'\157\5W\211\246v"77Wq\209\202\164\30\141\20\240v%X&\185\6\1881\197\210\228e@\162\168\226',
'\230\5\217B\24\239!m\t\187R\226\169\5\142Ns\v2\213\214\239\173^\214a\140SY\244\134\16\193p',
'B\218B\141a\157\184g\219\128+\146tZ>B@\176M\24(\a\230\137Y\155e\158X\166k\3==i\1\174\24\247',
'\18xx\255\183\24\af\177\148\222\28\189\214\128\241\227\199\231M\159~\236?\23`71&Z\241\28\172',
'\145\208=\227\195l\147T4X\230\130\157E\152\157\229\149L\128\244JrS\226\224\253\16hK\243\244\162e^',
'\3\217K\187u\204\128\6\t\202\1628\131N\t\238UV&\224\144\29g\26Oo\231\17\207{\166\209\249',
'\193\15\254\225Y\133eQ>\251A\132\226\168]hs\156^\16\200\209>2%\226\152\192\237\148\157\208\130\172',
'\172\206DAAA\222\148)S\184\\\189\6g\143?\131\208k\r\184\239\190\251\206\3\183g\209\244h\224',
'\5\bm\173\244z\0\164\0\243><\129g\28A7\224\217S/A\230\171[\186\204\149cZ \229\234\164+#A&%L',
'\v \197&\225x\187\197\149\207{j\136i\130I\190\198\0051\26e\184\178,\159\19\2\180I\237\131\214',
'\226\19 \b\243\193\139\141- \199A\14\24\173i\179\215(\228C?(44\187\28\247X.\150]\226\149#+\231',
'\190\140M\b\204\221\211\163Wn(^l\0306\247\219s\151a-\164\28*(\191\1593^\158fb\216)6\208\174\1486',
'\30\212\ft6\216V\168{\2090\222\229q\215$H\1988D\167hQ\146\150e\211dI\194Q\22\153\203\234\172lW',
'\175\171\31Tl\133hyU\155\152G\227\a3\225\159E[\178\28#j\a)\241\195\127\210\22\187\218l\31',
'\175T\193\29\229.\15\n"\211\243\v\242#\240\142\234>\251\236\179\229=\221W\218+\r\192w\28',
'.\169\172\170\28\15\192\245\152\145\18h\3o*\144\180\177\188O\1373\176\3{.\219J\t\146dRr\221',
"\233\152G\141\145\183!\169F\154\147n\175\29\146|\151G\239z1\140\188\140'\r\153b\140\180r\173=\158",
'yl\151\209\136\249N\243(\213\188\a\155\0:\194\240\196\208\6@\2398C&)\197\24I\134\169\143h+',
"\199\3\n\3\215\193F\140\28y\194e\151]\246=\178\174'G\143\25p\225\133\23\22\194\221\186@",
'\141D\237\180\157\244\249\15R{\129\146\148~\210zpe\6t\207t\0C\144uO\213\135;\135\188\248\236',
'\21z\201t\3I\128\163sL#\208\222l\177\179V.h\0216\16\200(\150\237\25ef\137\fd\25\0\151\0',
'\171|\230g^g\174\24\143\211\247\141\204p\202A\204\165\29\208\234@\131I\199zp\r\171~\212+A\192',
'\182F\174\152\142\31;\254\162\227\142;.\167_\25p\230\1883\167\193\244L\162\231Cu#\0\180\127j\f',
";CP]'\2129k\160\1\165\6\1544\146>\t\172\129\203\188\t\216y\2O\127\31\f\209;\3\1645;O",
'\173J\169\3u\179~\203\19\128\145lK\0\172\207G\26c8\1S\155Y\158\147z\127O\192\20\22sL\27@',
"\198z\0>X\128\246\201\244!\146Z\1330\252\r\182\197\132\131a\174\4\148\150\149N\191\246\218k'",
'\247\132\1=\246\130j\198\212L\229\27$\28|\185f\18\2354\233Q\131(\205\190cN\194|\167$!\1383\128',
'\131x5\220$\210:\206\206;`\129\f\153i\210J\163\0A\164T\234\159\129\192z\133\6\r4M3\174\28{H',
'D\aGRl\tF\1zD\235\0041\222\v\225\240\199\24\230\231\149\198\128e\227\130C#\4\243\168\204',
'\b\177v\26D\175\137\241\206d\161\157f\254\200\20r+\20\199\251f\249\248"\203t\20\243\158\n',
'\235\230\167\199\f@\161U\28t\216\146xW<LN{\219\234\193R\237`\132\238\2170J"\239\209\t6NLB',
'\216L\5\187Hi$X\188\194n\211\150"B\192\163\131\b\168\163\2128 \134\23(l\224\203\130\0D\178',
"\178\185&\3K\24\193\n,\220E\230'\3]\189\166!\178\229\130\21E\145C\130\154EG\216&\173\239a2",
'\199\193T\139mh\18\202\226Z\15\249"\144A\28\17;\204_a\28\0152\216\167\155\201\180~\178/\185',
'\152\152br6N\132\127\230\167\199\f\192\200\1436\139\235\129-\244\157\21\200^\3\0@`[i*\208PS{',
"\216Ig\163\213p\a\6>\2'\147\1968\139\167\20\161\211\0\153\v^\209h>W\31#\5\5\249\161l",
",\246\17\25\194h\2045{O\6q\239Q\4R\173\151\254\200 \128H\26\174^b\142\194\239\197\5\19'g>P",
'\22\193\20\210\172\146N\167+\157\250D\141\160v\216\1\193\192\211\14[95I\183\246\178\205,G\237g',
'\159p\203t\212\159\239\243vw\2371\3\240\1\188\3\1480\22\254U\220\15\180!\176\191\144\b\210',
'\226\f\24\1970$\132\2%\0\149nf\135X\208\180E\163\185\161\194\130\194pQqQ\152\203\219\173m-',
'\161\198\198\166\166\189{\246\236njj\220\214\210\218\186\163\181\189ukG[\199^\140AM\240@\248D\n',
'\203!\145\220\236\236\188\226\236H\2460\188bTU\4\141\197\228\168\22\15\209+\139KJJ\225\189\1',
'\2060\158\210\181$\26\0144%Z[\154\205{\17\128\228\185\1I\176\216f\155\160Q\250\141\td\186\251',
'\199\139N\210\6\a\242\155\0qlL\132\128\215\222 \173\155@\143\25\176c\219\182\r\216\r )fc',
'\188\4\178\177\0062\129ta\153!\27#\228\253P\19p\178\217\154%#\221\188\26\202\28\165=\18\2P',
'\161\210\210\18>\240\14\225\129w\231\230\205\155?\220\187w\239\154]_\236Z\179g\247\158?<\255\252',
'\243\159~\244\209G-(D\211\164n\250\20$\225\19\4\5g\156qF\r\236\241d<\195\253\139\242\178\178',
'\153\248N\208\148\138\17#\162Y\145\225\161\3\141\141\241/\247\237\15\181k\203\fZ\130\190p\214',
'\140\127\232\147U\195\176\189JK\225\198\31\127%\233)l@\208\v%V\a\152%\241\249\231\159\175\15',
'\26\210M\160\199\fxk\237\218\183\167\207\152\177\29\235\223\213\0\19\152{\176\29\208\1867',
'\160\t6\165\158\141\21\163\208\25\179\147\242\173\209O\187\167\153\129t\134\177\164\27nmi\rm',
'\221\186\245\227\237\219\183\253f\227\198\143\159\196\238\186?\236\222\189\187O/F\236\216\177\163',
'\0053\247\141\232?\207\223\224\140.\\\184\176~\210\132\t\223\173\170\1699ktmm\253\216qcC_64\240{',
"\211\2168l\203)\236\155\153\0312\131'\222\162\196\148\v\184\242\144\208\128\128\28\161L\169\159",
'\188\151\169\133\187\138O&\127\254\198\27o\252\142q\127\238@\161=?^{\237\181_\224\155\nW\237\221',
'\187\15\15\222\241\150\v\128\230$D\128\251\176s9\rd0I\204\2242\2}}\179\239\20\145\194\226',
'\162P\217\144!\145\150\230\230\248\150\173[\215l\220\184\233\223\31}t\249s\235\214\173\219\223\243',
'\22\29>%\246.\149\\w\221u\243\234\234\234\174\192G\252f\14\0316\140\154\23\223\191\191!\193',
"\15:\1U8J6\203\213\216\130\217\174\6\127\244;\aa\250\251\252\0 56\15'\215\1968\198aa4\242",
"\222{\239-\1573gN\143\190\198eC{\15\251\0015\222\128o\173\157\131\173'\165\176\203\228}\18|\0M",
'\176\241\17a\196%\253\251\152[\183g\28\189\155h~^\b\2468\130\145<\188\241\143\31\191\254\214',
'\127\173^\188p\209\162%\175\190\186\234=\168m\159v\24\244\176\27"\131\169h\127\229\149W>\192:',
'\254\1950Q\239B&j\208\191\209C\135\r\141\176\31|\137D".\r0M\160\1694\141\208\238\3\153N',
'\139\vi\251\r\150%"\r\r\r\159c\19\239\197\216-\209\163\'d\189b\192\1545k\26\176\238',
"\189\181\182\182\246\187hWN\227\129F\249\235\4\1516]K\6\210\136\20\173@<\181\129\235'\21\21",
'\195#\229\229C\195\159~\250\201\186\213\171W_\139\247\134ox}\245\234\15\129\bu>]G\28m\249p\197',
"\202\149\203\199\212\214m\137\22D'\215\142\30=4?\26uk\\\240h\200\4\128O\r\160i\2\19xX{a",
'\135\1541\160\227\29\227Hn^n\28L]\140\207\240\188\218\211\206\244\138\1,\244\217g\159\221\128',
'\143Z\236\132\180\204\193\220 \23\28\151\237\236\160;\137\169x,f\159\155\241\158\15\23\170\202',
'\202\134D@\31\134\157\221\179v\237oo\251\217\207n[\240\200#\143\208F\166\19\248C1\138\173ze\213',
'\187_|\241\197JL8s\209\230\169\181\181\163r\1363\ai\141\v\180\255\206\240\211\156\226\227\127Hk',
'\15\r-\31\nE\136\196`\247\175_\176`\193\175\14-\184\187\251^3\128\133=\243\2043\239\150WT\172',
'--.>\26K\1765\209\252|\206\132\240\24\17n*Z\156\1417\f\v\v\n"Pg\f\176C\194\205\205M',
'\r\235\214\173_\254\196\19O\252\240\214[\255\229q\252_\0\131fj\186\235\252W\165m\218\180\169',
'\t\253{aHY\217\27\144\252\234\178!e\227\170`2\243\242r)\2502A\208\1300\222!\139`3B\24;#\194\187v',
'\236\218\244\234k\175^\142\151\187\151~U\153\221\1979=\234\142\164\219\180\194;\127\254\243\191\0275',
'f\204yx:y\f\252\246\17\240\229s %\24\151c\251\247\237\219\247\t\192~\249\157w\222y\4\222H',
'\191lf\237\1825\253\159\24\185\233\166\155\230\0285\241\168\v\224\190\158R\\RT\tS\132\t\22',
'\159\148\198\191\132F\255q\203\150-\143/[\182\236\193\181k\215\238>\156\234\251\202\128\160\206\217',
"\179g\143\172\159P?2+\154U\n\240[\160\202\187\177cn'\b\250\188\1295\168$\141\1\188\156Q~\242",
"\201'W\194\r\31\134f\180C\176\216\191m\b\247\248\233W\26\155\159\169:\131@\6\129\f\2\25",
'\0042\bd\16\200 \144A \131@\6\129\f\2\25\0042\bd\16\200 \144A \131@\6\129\f\2iF',
'\224\127\1\191\173N5]V\234X\0\0\0\0IEND\174B`\130'}end)()end,[62]=function()local aa,ab,ac=a(62)local ad return(
function(...)local function ae<T>(af:T):T local ag=af::any function ag.MoveTo(ah,ai:number)ah.tab:_moveElement(ah,ai)end
function ag.MoveToTop(ah)ah.tab:_moveElement(ah,1)end function ag.MoveToBottom(ah)ah.tab:_moveElement(ah,#ah.tab.
elements)end function ag.MoveUp(ah)local ai=table.find(ah.tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai-1)end end
function ag.MoveDown(ah)local ai=table.find(ah.tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai+1)end end return af
end return ae end)()end,[63]=function()local aa,ab,ac=a(63)local ad return(function(...)local ae={}ae.__index=ae export
type RequestFn=(...any)->any function ae.getRequestFn(af:any?):RequestFn?af=af or getfenv()return af.request or af.
http_request or(af.http and af.http.request)or(af.syn and af.syn.request)or(af.fluxus and af.fluxus.request)end return
ae end)()end,[64]=function()local aa,ab,ac=a(64)local ad return(function(...)local ae=ac(ab.Parent.variables)local af,ag
=ae.textService,{}ag.__index=ag local ah=20 local function ai(aj,ak,al)local am=Instance.new'GetTextBoundsParams'am.Text
=al am.Font=aj am.Size=ak am.Width=math.huge local an,ao=pcall(af.GetTextBoundsAsync,af,am)return if an then ao else
Vector2.new(ak*0.6,ak)end local aj={}local function ak(al,am)local an=tostring(al.Family)..'|'..tostring(al.Weight)..'|'
..tostring(al.Style)..'|'..tostring(am)local ao=aj[an]if ao then return ao end local ap,aq={},0 for ar=0,9 do local as=
math.ceil(ai(al,am,tostring(ar)).X)ap[ar]=as if as>aq then aq=as end end ao={advance=ap,maxWidth=aq}aj[an]=ao return ao
end function ag.new(al,am,an)an=an or{}local ao=setmetatable({window=al,container=am,textSize=an.textSize or 16,
transparency=an.transparency or 1,duration=an.duration or 0.55,slots={},length=0},ag)ao.roll=TweenInfo.new(ao.duration,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out)ao.zIndex=math.max(am.ZIndex+1,6)ao.height=math.ceil(ao.textSize)local
ap=ak(al.theme.Font,ao.textSize)ao.advance=ap.advance ao.maxWidth=ap.maxWidth al:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=an.alignment or Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=am})return ao end function ag
._reel(al,am)local an=al.slots[am]if an.reel then return an.reel end local ao=al.window:Create('Frame',{Name='Reel',Size
=UDim2.fromOffset(al.maxWidth,al.height),BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,ZIndex=al.
zIndex,Parent=al.container})local ap=al.window:Create('Frame',{Size=UDim2.fromOffset(al.maxWidth,al.height),AnchorPoint=
Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,0),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=al.zIndex,Parent=ao})
for aq=0,ah-1 do al.window:Create('TextLabel',{Text=tostring(aq%10),Position=UDim2.fromOffset(0,aq*al.height),Size=UDim2
.fromOffset(al.maxWidth,al.height),BackgroundTransparency=1,BorderSizePixel=0,TextSize=al.textSize,TextXAlignment=Enum.
TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,TextTransparency=al.transparency,ZIndex=al.zIndex,Parent
=ap},{TextColor3='ContentColor',FontFace='Font'})end local aq={cell=ao,strip=ap,digit=0,target=0,stripTween=nil,
sizeTween=nil}an.reel=aq return aq end function ag._static(al,am)local an=al.slots[am]if an.static then return an.static
end local ao=al.window:Create('TextLabel',{Name='Static',Size=UDim2.fromOffset(0,al.height),AutomaticSize=Enum.
AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=al.textSize,TextXAlignment=Enum.TextXAlignment.
Center,TextYAlignment=Enum.TextYAlignment.Center,TextTransparency=al.transparency,ZIndex=al.zIndex,Parent=al.container},
{TextColor3='ContentColor',FontFace='Font'})an.static=ao return ao end local function al(am)if am.stripTween then am.
stripTween:Cancel()am.stripTween=nil end if am.sizeTween then am.sizeTween:Cancel()am.sizeTween=nil end end function ag.
_reelSnap(am,an,ao)al(an)an.cell.Size=UDim2.fromOffset(am.advance[ao],am.height)an.strip.Position=UDim2.new(0.5,0,0,-ao*
am.height)an.digit=ao an.target=ao end function ag._reelRoll(am,an,ao,ap)if an.stripTween or an.sizeTween then am:
_reelSnap(an,an.target)end local aq=an.digit if aq==ao then return end local ar,as if ap then ar=aq as=aq+(ao-aq)%10
else ar=aq+10 as=ar-(aq-ao)%10 end an.strip.Position=UDim2.new(0.5,0,0,-ar*am.height)an.target=ao local at,au=ae.
tweenService:Create(an.strip,am.roll,{Position=UDim2.new(0.5,0,0,-as*am.height)}),ae.tweenService:Create(an.cell,am.roll
,{Size=UDim2.fromOffset(am.advance[ao],am.height)})an.stripTween=at an.sizeTween=au at.Completed:Connect(function(av)if
av==Enum.PlaybackState.Completed and an.stripTween==at then am:_reelSnap(an,ao)end end)at:Play()au:Play()an.digit=ao end
function ag._putDigit(am,an,ao,ap,aq)local ar=am:_reel(an)local as=not ar.cell.Visible ar.cell.Visible=true ar.cell.
LayoutOrder=-an if am.slots[an].static then am.slots[an].static.Visible=false end if aq and not as then am:_reelRoll(ar,
ao,ap)else am:_reelSnap(ar,ao)end end function ag._putStatic(am,an,ao)local ap=am:_static(an)if not ap.Visible then ap.
TextTransparency=am.transparency end ap.Text=ao ap.Visible=true ap.LayoutOrder=-an if am.slots[an].reel then am.slots[an
].reel.cell.Visible=false end end function ag._hide(am,an)local ao=am.slots[an]if not ao then return end if ao.reel then
ao.reel.cell.Visible=false end if ao.static then ao.static.Visible=false end end function ag._render(am,an,ao,ap)an=
tostring(an)if an==am._lastText then return end am._lastText=an local aq={}for ar,as in utf8.codes(an)do table.insert(aq
,utf8.char(as))end local ar=#aq for as=0,math.max(ar,am.length)-1 do am.slots[as]=am.slots[as]or{}if as<ar then local at
=aq[ar-as]if at:match'%d'then am:_putDigit(as,tonumber(at),ap,ao)else am:_putStatic(as,at)end else am:_hide(as)end end
am.length=ar end function ag.to(am,an,ao)am:_render(an,true,ao)end function ag.snap(am,an)am:_render(an,false,true)end
function ag.reveal(am,an,ao,ap)am.transparency=an for aq,ar in am.slots do if ar.static and ar.static.Visible then am.
window:_reveal(ar.static,{TextTransparency=an},ao,ap)end if ar.reel then for as,at in ar.reel.strip:GetChildren()do if
at:IsA'TextLabel'then am.window:_reveal(at,{TextTransparency=an},ao,ap)end end end end end return ag end)()end,[65]=
function()local aa,ab,ac=a(65)local ad return(function(...)type OrderedElement={main:GuiObject,descriptor:{main:
GuiObject}?}local function ae(af:OrderedElement,ag:number)af.main.LayoutOrder=ag if af.descriptor then af.descriptor.
main.LayoutOrder=ag+1 end end return ae end)()end,[66]=function()local aa,ab,ac=a(66)local ad return(function(...)local
ae={}function ae.join(af:string,ag:string?):string if not ag or ag==''then return af end return af..'/'..ag end
local function af(ag:string):string local ah repeat ah=ag ag=ag:gsub('%.%.','')until ag==ah return ag end function ae.
sanitizeFolder(ag:unknown):string local ah=tostring(ag):gsub('\\','/'):gsub('[:<>"|?*%c]','')ah=af(ah):gsub('/+','/')
return(ah:gsub('^/+',''))end function ae.sanitizeFile(ag:unknown):string local ah=tostring(ag):gsub('[/\\]',''):gsub(
'[:<>"|?*%c]','')return af(ah)end function ae.basename(ag:unknown):string return tostring(ag):match'[^/\\]+$'or
tostring(ag)end function ae.stripExtension(ag:unknown,ah:string?):string if ah and ah~=''then local ai=tostring(ag)if ai
:sub(-#ah)==ah then return ai:sub(1,-#ah-1)end return ai end local ai=tostring(ag):match'^(.+)%.%w+$'return ai or
tostring(ag)end return ae end)()end,[67]=function()local aa,ab,ac=a(67)local ad return(function(...)local ae,af,ag={},
ac(ab.Parent.persistenceConfig),ac(ab.Parent.persistenceSettings)ae.getPath=af.getPath ae.save=af.save ae.load=af.load
ae.applyTo=af.applyTo ae.list=af.list ae.delete=af.delete ae.getSettingsPath=ag.getSettingsPath ae.saveSettings=ag.
saveSettings ae.loadSettings=ag.loadSettings return ae end)()end,[68]=function()local aa,ab,ac=a(68)local ad return(
function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.log),ac(ab.Parent.
path),ac(ab.Parent.persistencePaths),ac(ab.Parent.persistenceWrite),{}type PersistedControl={value:unknown,flag:string?,
_canBeNil:boolean?,_serialize:((PersistedControl)->unknown)?,_deserialize:((PersistedControl,unknown)->())?,Set:(
PersistedControl,unknown)->()}type ConfigWindow={controls:{[string]:PersistedControl},configuration:{fileName:string?,
customFolder:string?},name:string,_loading:boolean?,_loadedConfig:{[string]:unknown}?,_loadedConfigPath:string?}function
ak.getPath(al:ConfigWindow,am:unknown?):(string?,string?)return ai.getConfigPath(al,am)end function ak.save(al:
ConfigWindow,am:unknown?):boolean local an,ao=ak.getPath(al,am)if not an or not ao then ag.warn(
"Rayfield: configuration name '"..tostring(am).."' has no usable characters")return false end if typeof(af.writefile)~=
'function'then return false end local ap:{[string]:unknown}={}for aq,ar in al.controls do local as,at=pcall(function()
local as=ar._serialize if as then return as(ar)end return ar.value end)if as then ap[aq]=at else ag.warn(
"Rayfield: Failed to serialize flag '"..tostring(aq).."' - "..tostring(at))end end local aq=al._loadedConfig if aq and
al._loadedConfigPath==ao then for ar,as in aq do if al.controls[ar]==nil then ap[ar]=as end end end local ar,as=pcall(ae
.httpService.JSONEncode,ae.httpService,ap)if not ar then ag.warn('Rayfield: Failed to encode configuration - '..
tostring(as))return false end local at,au=pcall(function()aj.write(an,ao,as)end)if not at then ag.warn(
'Rayfield: Failed to save configuration - '..tostring(au))return false end if al._loadedConfigPath==nil or al.
_loadedConfigPath==ao then al._loadedConfig=ap al._loadedConfigPath=ao end return true end local function al(am:string):
({[string]:unknown}?,string?)if not af.isfile(am)then return nil,nil end local an,ao=pcall(af.readfile,am)if not an or
type(ao)~='string'then ag.warn'Rayfield: Failed to read configuration file'return nil,nil end local ap,aq=pcall(ae.
httpService.JSONDecode,ae.httpService,ao)if not ap or type(aq)~='table'then return nil,ao end return aq::{[string]:
unknown},ao end local function am(an:string):string local ao=ah.stripExtension(an,'.rfld')local ap,aq=ao..
' (Incorrect Format).rfld',2 while aq<=100 and af.isfile(ap)do ap=ao..' (Incorrect Format '..aq..').rfld'aq+=1 end
return ap end function ak.load(an:ConfigWindow,ao:unknown?):boolean local ap,aq=ak.getPath(an,ao)if not ap or not aq
then ag.warn("Rayfield: configuration name '"..tostring(ao).."' has no usable characters")return false end if typeof(af.
isfile)~='function'then return false end local ar,as=al(aq)if not ar and af.isfile(aq)then local at,au=al(aj.
tempPathFor(aq))if at and au then ar=at pcall(aj.write,ap,aq,au)end end if not ar then if as then ag.warn
[[Rayfield: Configuration file has an invalid format, backing up and resetting]]local at=am(aq)pcall(function()af.
ensureDir(ap)af.writefile(at,as)af.delfile(aq)end)end return false end local at,au=ar::{[string]:unknown},an._loading an
._loading=true local av,aw=pcall(function()for av,aw in an.controls do ak.applyTo(aw,at[av])end end)an._loading=au if
not av then ag.warn('Rayfield: Failed to apply configuration - '..tostring(aw))end an._loadedConfig=at an.
_loadedConfigPath=aq return true end function ak.applyTo(an:PersistedControl,ao:unknown)if ao==nil and not an._canBeNil
then return end local ap,aq=pcall(function()local ap=an._deserialize if ap then ap(an,ao)else an:Set(ao)end end)if not
ap then ag.warn("Rayfield: Failed to restore flag '"..tostring(an.flag).."' - "..tostring(aq))end end function ak.list(
an:ConfigWindow):{string}local ao,ap:{string}=ak.getPath(an),{}if not ao then return ap end local aq,ar=pcall(af.
listfiles,ao)if not aq or type(ar)~='table'then return ap end for as,at in ar do local au=ah.basename(at)if au:sub(-5)==
'.rfld'then local av=ah.stripExtension(au,'.rfld')if av and av~=''and not av:find' %(Incorrect Format[^%)]*%)$'then
table.insert(ap,av)end end end table.sort(ap)return ap end function ak.delete(an:ConfigWindow,ao:unknown):boolean if
type(ao)~='string'or ao==''then return false end local ap,aq=ak.getPath(an,ao)if not aq then return false end if typeof(
af.isfile)~='function'or not af.isfile(aq)then return false end pcall(af.delfile,aj.tempPathFor(aq))return(pcall(af.
delfile,aq))end return ak end)()end,[69]=function()local aa,ab,ac=a(69)local ad return(function(...)local ae,af,ag=ac(ab
.Parent.variables),ac(ab.Parent.path),{}type ConfigWindow={configuration:{fileName:string?,customFolder:string?},name:
string}function ag.getConfigPath(ah:ConfigWindow,ai:unknown?):(string?,string?)local aj=ae.fileSystemManager:getPath
'Configurations'if ah.configuration.customFolder then aj=af.join(aj,af.sanitizeFolder(ah.configuration.customFolder))end
if ai~=nil then local ak=af.sanitizeFile(ai)if ak==''then return nil,nil end return aj,af.join(aj,ak..'.rfld')end local
ak=af.sanitizeFile(ah.configuration.fileName or ah.name)if ak==''then ak=af.sanitizeFile(ah.name)end if ak==''then ak=
'Configuration'end return aj,af.join(aj,ak..'.rfld')end function ag.getSettingsPath():(string,string)local ah=ae.
fileSystemManager:getPath'Settings'return ah,af.join(ah,'rayfield.rfld')end return ag end)()end,[70]=function()local aa,
ab,ac=a(70)local ad return(function(...)local ae,af,ag,ah,ai,aj=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(ab.
Parent.persistencePaths),ac(ab.Parent.persistenceWrite),ac(ab.Parent.enums),{}type SettingsWindow={settings:{
toggleKeybind:EnumItem,mouseOverride:boolean,keepOnScreen:boolean,welcomeToast:boolean,haptics:boolean,showProfile:
boolean,theme:string?}}type DecodedSettings={toggleKeybind:{[number]:unknown}?,mouseOverride:unknown?,keepOnScreen:
unknown?,welcomeToast:unknown?,haptics:unknown?,showProfile:unknown?,theme:unknown?}function aj.getSettingsPath():(
string,string)return ag.getSettingsPath()end function aj.saveSettings(ak:SettingsWindow):boolean local al,am=aj.
getSettingsPath()local an:{[string]:unknown}={toggleKeybind={tostring(ak.settings.toggleKeybind.EnumType),ak.settings.
toggleKeybind.Value}::{unknown},mouseOverride=ak.settings.mouseOverride,keepOnScreen=ak.settings.keepOnScreen,
welcomeToast=ak.settings.welcomeToast,haptics=ak.settings.haptics,showProfile=ak.settings.showProfile,theme=ak.settings.
theme}local ao,ap=pcall(ae.httpService.JSONEncode,ae.httpService,an)if not ao then return false end local aq=pcall(ah.
write,al,am,ap)if not aq then return false end return true end local function ak(al:string):(DecodedSettings?,string?)
local am=false pcall(function()am=af.isfile(al)end)if not am then return nil,nil end local an,ao=pcall(af.readfile,al)if
not an or type(ao)~='string'then return nil,nil end local ap,aq=pcall(ae.httpService.JSONDecode,ae.httpService,ao)if not
ap or type(aq)~='table'then return nil,ao end return aq::DecodedSettings,ao end function aj.loadSettings(al:
SettingsWindow):boolean local am,an=aj.getSettingsPath()local ao=ak(an)if not ao then local ap,aq=ak(ah.tempPathFor(an))
if ap and aq then ao=ap pcall(ah.write,am,an,aq)end end if not ao then return false end if ao.toggleKeybind then pcall(
function()local ap=tostring(ao.toggleKeybind[1]):gsub('^Enum%.','')local aq=(Enum::any)[ap]if aq then local ar=ai.
itemFromValue(aq,ao.toggleKeybind[2])if ar then al.settings.toggleKeybind=ar end end end)end if type(ao.mouseOverride)==
'boolean'then al.settings.mouseOverride=ao.mouseOverride end if type(ao.keepOnScreen)=='boolean'then al.settings.
keepOnScreen=ao.keepOnScreen end if type(ao.welcomeToast)=='boolean'then al.settings.welcomeToast=ao.welcomeToast end if
type(ao.haptics)=='boolean'then al.settings.haptics=ao.haptics end if type(ao.theme)=='string'and string.match(ao.theme,
'^%a+$')then al.settings.theme=string.lower(ao.theme)end if type(ao.showProfile)=='boolean'then al.settings.showProfile=
ao.showProfile end return true end return aj end)()end,[71]=function()local aa,ab,ac=a(71)local ad return(function(...)
local ae,af,ag=ac(ab.Parent.filesystem),{},'.saving'function af.tempPathFor(ah:string):string return ah..ag end function
af.write(ah:string,ai:string,aj:string)local ak=af.tempPathFor(ai)ae.ensureDir(ah)ae.writefile(ak,aj)if ae.readfile(ak)
~=aj then error'parked copy did not write cleanly'end ae.writefile(ai,aj)pcall(ae.delfile,ak)end return af end)()end,[72
]=function()local aa,ab,ac=a(72)local ad return(function(...)local ae,af=ac(ab.Parent.variables),{}function af.location(
ag:any?):Vector2 if ag and ag.UserInputType==Enum.UserInputType.Touch and typeof(ag.Position)=='Vector3'then local ah=ag
.Position return Vector2.new(ah.X,ah.Y)+ae.guiService:GetGuiInset()end return ae.userInputService:GetMouseLocation()end
return af end)()end,[73]=function()local aa,ab,ac=a(73)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.
filesystem),ac(ab.Parent.path),ac(ab.Parent.variables),{}local ai=af.join(ag.fileSystemManager:getRootFolder(),
'layout.txt')function ah.preference():boolean?if typeof(ae.isfile)~='function'then return nil end local aj,ak=pcall(
function()return if ae.isfile(ai)then ae.readfile(ai)else nil end)if not aj or type(ak)~='string'then return nil end if
ak=='sidebar'then return true elseif ak=='top'then return false end return nil end local function aj(ak:boolean)pcall(ae
.writefile,ai,if ak then'sidebar'else'top')end function ah.session(ak,al)local am,an,ao=setmetatable({},{__mode='k'}),
setmetatable({},{__mode='k'}),{}local function ap(aq)local ar=am[aq]return if ar then ar.real else aq end local aq
local function ar(as)local at={real=as}local au=setmetatable({},{__index=function(au,av)local aw=at.real[av]if type(aw)
~='function'then return aq(aw)end return function(ax,...)local ay,az=if ax==nil or am[ax]then at.real else ax,table.
pack(...)local aA=table.create(az.n)for aB=1,az.n do aA[aB]=ap(az[aB])end local aB,aC=table.pack(aw(ay,table.unpack(aA,1
,az.n))),type(av)=='string'and string.sub(av,1,6)=='Create'for aD=1,aB.n do local aE=aB[aD]if aC and type(aE)=='table'
and not an[aE]then local aF=aq(aE)if am[aF]then table.insert(ao,{standIn=aF,parent=at,method=av,args=az})end end aB[aD]=
aq(aE)end return table.unpack(aB,1,aB.n)end end,__newindex=function(au,av,aw)at.real[av]=ap(aw)end,__tostring=function()
return tostring(at.real)end})am[au]=at an[as]=au return au end function aq(as)if type(as)~='table'then return as end
local at=an[as]if at then return at end local au=getmetatable(as)if type(au)~='table'or type(rawget(au,'__type'))~=
'string'then return as end return ar(as)end local as,at=table.clone(ak),ah.preference()if at~=nil then as.sidebarLayout=
at as.SidebarLayout=nil end local au=al(as)local av=ar(au)local aw,ax=am[av],false local function ay()if ax or aw.real.
unloaded then return end ax=true local az={}for aA,aB in ao do local aC=am[aB.standIn]local aD,aE=aC and aC.real,{}if
type(aD)=='table'then aE.value=rawget(aD,'value')aE.locked=rawget(aD,'locked')end az[aA]=aE end local aA=aw.real local
aB,aC=not aA.hidden,aA.selectedTab and aA.selectedTab.name as=table.clone(as)as.sidebarLayout=not(aA.layout and aA.
layout.mode=='sidebar')as.SidebarLayout=nil aj(as.sidebarLayout)local aD=al(as)pcall(aA.Unload,aA)an[aD]=av aw.real=aD
aD._requestRelayout=ay for aE,aF in ao do local aG,b=aF.parent.real,aF.args local c=table.create(b.n)for d=1,b.n do c[d]
=ap(b[d])end local d,e=pcall(aG[aF.method],aG,table.unpack(c,1,b.n))local f=am[aF.standIn]if d and type(e)=='table'and f
then f.real=e an[e]=aF.standIn local g=az[aE]if g.value~=nil and type(e.Set)=='function'then pcall(e.Set,e,g.value,true)
end if g.locked and type(e.Lock)=='function'then pcall(e.Lock,e)end end end if aB and not aD.unloaded then pcall(aD.Show
,aD)if aC then pcall(aD.Navigate,aD,aC)end end ax=false end au._requestRelayout=ay return av,au end return ah end)()end,
[74]=function()local aa,ab,ac=a(74)local ad return(function(...)local ae=ac(ab.Parent.services)export type RuntimeState=
{secureMode:boolean,coreGui:CoreGui,workspace:Workspace,runService:RunService,userInputService:UserInputService,
guiService:GuiService,localPlayer:Player?,tweenService:TweenService,httpService:HttpService,textService:TextService,
replicatedStorage:ReplicatedStorage,localizationService:LocalizationService,guiContainer:Instance}local af={}::
RuntimeState af.secureMode=(function()if typeof(getgenv)~='function'then return false end local ag,ah=pcall(function()
return getgenv().RAYFIELD_SECURE end)return ag and ah==true end)()af.coreGui=ae.getService'CoreGui'::CoreGui af.
workspace=ae.getService'Workspace'::Workspace af.runService=ae.getService'RunService'::RunService af.userInputService=ae
.getService'UserInputService'::UserInputService af.guiService=ae.getService'GuiService'::GuiService af.localPlayer=(ae.
getService'Players'::Players).LocalPlayer af.tweenService=ae.getService'TweenService'::TweenService af.httpService=ae.
getService'HttpService'::HttpService af.textService=ae.getService'TextService'::TextService af.replicatedStorage=ae.
getService'ReplicatedStorage'::ReplicatedStorage af.localizationService=ae.getService'LocalizationService'::
LocalizationService af.guiContainer=(function():Instance if af.runService:IsStudio()then local ag=af.localPlayer if ag
then return ag.PlayerGui end return af.coreGui end if typeof(gethui)=='function'then local ag,ah=pcall(gethui)if ag and
ah then return ah end end return af.coreGui end)()return af end)()end,[75]=function()local aa,ab,ac=a(75)local ad return
(function(...)local ae={}function ae.getService(af)local ag=game:GetService(af)return if cloneref then cloneref(ag)else
ag end return ae end)()end,[76]=function()local aa,ab,ac=a(76)local ad return(function(...)local ae=ac(ab.Parent.
variables)local af,ag,ah:{[string]:number},ai,aj=ae.textService,{},{},0,1024 local function ak(al:GetTextBoundsParams):
unknown local am,an=pcall(function()return af:GetTextBoundsAsync(al)end)return if am then an else nil end local function
al(am:unknown,an:'X'|'Y'):number?if typeof(am)=='Vector2'then return if an=='X'then am.X else am.Y end if type(am)==
'table'and type((am::any)[an])=='number'then return(am::any)[an]end return nil end function ag.textWidth(am:Font,an:
number,ao:any):number ao=tostring(ao)local ap=tostring(am.Family)..'|'..tostring(am.Weight)..'|'..tostring(am.Style)..
'|'..tostring(an)..'|'..ao local aq=ah[ap]if aq then return aq end local ar=Instance.new'GetTextBoundsParams'ar.Text=ao
ar.Font=am ar.Size=an ar.Width=math.huge local as=al(ak(ar),'X')if not as then local at=utf8.len(ao)or#ao return math.
ceil(an*0.55*at)end local at=math.ceil(as)if ai>=aj then ah={}ai=0 end ah[ap]=at ai+=1 return at end function ag.
textHeight(am:Font,an:number,ao:any,ap:number):number local aq=Instance.new'GetTextBoundsParams'aq.Text=tostring(ao)aq.
Font=am aq.Size=an aq.Width=ap local ar=al(ak(aq),'Y')return if ar then math.ceil(ar)else an end return ag end)()end,[77
]=function()local aa,ab,ac=a(77)local ad return(function(...)local ae,af,ag,ah,ai,aj=ac(ab.Parent.runtime),ac(ab.Parent.
constants),ac(ab.Parent.log),ac(ab.Parent.filesystemManager),ac(ab.Parent.assetResolver),ac(ab.Parent.fontManager)type
RuntimeState=ae.RuntimeState type FileSystemManager=ah.FileSystemManager type AssetResolver=ai.AssetResolver type
FontManager=aj.FontManager export type VariablesState=RuntimeState&{fallbackFont:Font,fileSystemManager:
FileSystemManager,assetResolver:AssetResolver,fontManager:FontManager,setFallbackFont:(font:Enum.Font|Font)->(),
brandFont:(weight:Enum.FontWeight?)->Font}local ak=table.clone(ae)::VariablesState ag.setSecureModeSource(function()
return ak.secureMode end)ak.fallbackFont=Font.fromEnum(Enum.Font.BuilderSans)ak.fileSystemManager=ah.new()ak.
assetResolver=ai.new(true,ai.Enum.AssetDownloadUrl.RoProxyDownloadUrl)::AssetResolver ak.fontManager=aj.new(ak.
fileSystemManager:getAssetsFolder'fonts',false,true,ai.Enum.AssetDownloadUrl.RoProxyDownloadUrl,{saveToDisk=true,
skipCache=false,fallbackFont=ak.fallbackFont})::FontManager function ak.setFallbackFont(al:Enum.Font|Font)if typeof(al)
=='EnumItem'then al=Font.fromEnum(al)end if typeof(al)=='Font'then ak.fallbackFont=al ak.fontManager.defaultOptions.
fallbackFont=al end end function ak.brandFont(al:Enum.FontWeight?):Font if ak.secureMode then return Font.new(ak.
fallbackFont.Family,al)end return Font.new(af.fontAsset,al)end return ak end)()end,[78]=function()local aa,ab,ac=a(78)
local ad return(function(...)local ae,af=ac(ab.Parent.layouts),{}export type Profile={defaultSize:Vector2,minSize:
Vector2,maxOccupancyX:number,maxOccupancyY:number?,marginFloorX:number,marginFloorY:number,topbarClearance:number?,
maxAspectRatio:number,minAspectRatio:number?,widthCompensation:number?,chromeHeight:number}local ag,ah,ai,aj,ak=200,{top
={defaultSize=Vector2.new(475,500),minSize=Vector2.new(300,285),maxOccupancyX=0.86,topbarClearance=36,marginFloorX=24,
marginFloorY=28,maxAspectRatio=2.3,widthCompensation=130,chromeHeight=ae.top.chromeHeight}::Profile,sidebar={defaultSize
=Vector2.new(685,450),minSize=Vector2.new(560,350),maxOccupancyX=0.92,maxOccupancyY=0.8,marginFloorX=24,marginFloorY=28,
maxAspectRatio=2.6,minAspectRatio=1.2,chromeHeight=ae.sidebar.chromeHeight}::Profile},600,557,0.55 local function al(am:
Profile,an:Vector2,ao:number?):Profile local ap=table.clone(am)ap.defaultSize=an ap.maxOccupancyY=ao or am.maxOccupancyY
return ap end local am={top=al(ah.top,Vector2.new(450,560)),sidebar=al(ah.sidebar,Vector2.new(645,520),0.79)}function af
.profile(an:ae.Mode?,ao:boolean?):Profile local ap=if ao then am else ah if an=='sidebar'then return ap.sidebar end
return ap.top end function af.scale(an:Vector2?,ao:boolean?):number if not ao or not an then return 1 end if an.Y<ag or
an.Y>=ai then return 1 end return math.clamp(an.Y/aj,ak,1)end function af.pageHeight(an:number?,ao:ae.Mode?):number
local ap=af.profile(ao)local aq=if an and an>0 then an else ap.minSize.Y return math.max(aq-ap.chromeHeight,0)end
local function an(ao:Profile,ap:number):number local aq=ap-ao.marginFloorY if ao.topbarClearance then aq=math.min(aq,ap-
ao.topbarClearance*2)end if ao.maxOccupancyY then aq=math.min(aq,ap*ao.maxOccupancyY)end return aq end local function ao
(ap:number,aq:number,ar:number):number return math.clamp((aq-ap)/(aq-ar),0,1)end local function ap(aq:Profile,ar:number,
as:number):UDim2 local at=math.floor(math.min(math.clamp(as,aq.minSize.Y,aq.defaultSize.Y),as))local au=ao(at,aq.
defaultSize.Y,aq.minSize.Y)local av=math.max(aq.defaultSize.X+(aq.widthCompensation::number)*au,aq.minSize.X)return
UDim2.fromOffset(math.floor(math.min(av,ar,at*aq.maxAspectRatio)),at)end local function aq(ar:Profile,as:number,at:
number):UDim2 local au,av=math.min(math.clamp(as,ar.minSize.X,ar.defaultSize.X),as),math.min(math.clamp(at,ar.minSize.Y,
ar.defaultSize.Y),at)av=math.floor(math.min(av,au/(ar.minAspectRatio::number)))au=math.floor(math.min(au,av*ar.
maxAspectRatio))return UDim2.fromOffset(au,av)end function af.fit(ar:Vector2?,as:ae.Mode?,at:number?):UDim2 local au=at
~=nil and at<1 local av=af.profile(as,au)if not ar or ar.X<ag or ar.Y<ag then return UDim2.fromOffset(av.defaultSize.X,
av.defaultSize.Y)end if au then ar/=at::number end local aw,ax=math.min(ar.X*av.maxOccupancyX,ar.X-av.marginFloorX),an(
av,ar.Y)if av.minAspectRatio then return aq(av,aw,ax)end return ap(av,aw,ax)end return af end)()end},{{1,2,{'Rayfield'},
{{33,1,{'themes'},{{37,2,{'ember'}},{34,2,{'amethyst'}},{36,2,{'default'}},{38,2,{'frost'}},{39,2,{'rose'}},{35,2,{
'cobalt'}}}},{40,2,{'types'}},{2,1,{'components'},{{20,2,{'search'}},{18,2,{'popup'}},{15,2,{'input'}},{4,2,{'button'}},
{11,2,{'drag'}},{7,2,{'console'}},{16,2,{'keybind'}},{32,2,{'window'}},{30,2,{'toast'}},{31,2,{'toggle'}},{12,2,{
'dropdown'}},{29,2,{'text'}},{28,2,{'tag'}},{3,2,{'action'}},{17,2,{'notification'}},{22,2,{'sidebar'}},{24,2,{'stat'}},
{27,2,{'tabSelector'}},{9,2,{'discord'}},{26,2,{'tabSection'}},{14,2,{'group'}},{10,2,{'divider'}},{8,2,{'descriptor'}},
{13,2,{'gallery'}},{19,2,{'progress'}},{23,2,{'slider'}},{21,2,{'section'}},{25,2,{'tab'}},{5,2,{'chrome'}},{6,2,{
'colorpicker'}}}},{41,1,{'utility'},{{53,2,{'functions'}},{51,2,{'flagNames'}},{69,2,{'persistencePaths'}},{64,2,{
'odometer'}},{45,2,{'colors'}},{55,2,{'imageCache'}},{43,2,{'assetResolver'}},{62,2,{'moveable'}},{42,2,{'HapticEngine'}
},{57,2,{'layouts'}},{59,2,{'lockable'}},{78,2,{'windowSizing'}},{73,2,{'relayout'}},{49,2,{'filesystem'}},{68,2,{
'persistenceConfig'}},{46,2,{'constants'}},{65,2,{'ordering'}},{74,2,{'runtime'}},{66,2,{'path'}},{75,2,{'services'}},{
61,2,{'logoImage'}},{58,2,{'locale'}},{48,2,{'enums'}},{76,2,{'textMetrics'}},{77,2,{'variables'}},{52,2,{'fontManager'}
},{72,2,{'pointer'}},{70,2,{'persistenceSettings'}},{67,2,{'persistence'}},{63,2,{'network'}},{54,2,{'image'}},{60,2,{
'log'}},{50,2,{'filesystemManager'}},{44,2,{'clickIcon'}},{56,2,{'layoutIcon'}},{71,2,{'persistenceWrite'}},{47,2,{
'discordIcon'}}}}}}},'0.4.1','Rayfield',string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,
pcall,xpcall,tostring,tonumber,_VERSION local av,aw,ax,ay,az,aA,aB=aj.insert,aj.remove,aj.freeze or function(av)return
av end,al.wrap,ae.sub,ae.match,ae.gmatch if at and az(at,1,4)=='Lune'then local aC,aD=ap(ao,'@lune/task')if aC and aD
then af=aD end end local aC=af and af.defer local aD,aE,aF,aG,b,c,d,e,f=aC or function(aD,...)ay(aD)(...)end,{[1]=
'Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local g,h={GetFullName
={{},function(g)local h,i=g.Name,g.Parent while i do h=i.Name..'.'..h i=i.Parent end return h end},GetChildren={{},
function(g)local h={}for i in ai,f[g]do av(h,i)end return h end},GetDescendants={{},function(g)local h={}for i in ai,f[g
]do av(h,i)for j,k in ai,i:GetDescendants()do av(h,k)end end return h end},FindFirstChild={{'string','boolean?'},
function(g,h,i)local j=f[g]for k in ai,j do if k.Name==h then return k end end if i then for k in ai,j do return k:
FindFirstChild(h,true)end end end},FindFirstAncestor={{'string'},function(g,h)local i=g.Parent while i do if i.Name==h
then return i end i=i.Parent end end},WaitForChild={{'string','number?'},function(g,h)return g:FindFirstChild(h)end}},{}
for i,j in ai,g do local k,l,m=j[1],j[2],{}for n,o in ai,k do local p,q=aA(o,'^([^%?]+)(%??)')m[n]={p,q}end h[i]=
function(n,...)if not f[n]then ah("Expected ':' not '.' calling member function "..i,2)end local o={...}for p,q in ai,m
do local r=o[p]local s,t,u=an(r),q[1],q[2]if r==nil and not u then ah('Argument '..r..' missing or nil',3)end if t~=
'any'and s~=t and not(s=='nil'and u)then ah('Argument '..p..' expects type "'..t..'", got "'..s..'"',2)end end return l(
n,...)end end local function i(j,k,l)local m,n=(ag({},{__mode='k'}))local function o(p)ah(p..
' is not a valid (virtual) member of '..j..' "'..k..'"',3)end local function p(q)ah(
'Unable to assign (virtual) property '..q..'. Property is read only',3)end local q,r={},{}r.__metatable=false r.__index=
function(s,t)if t=='ClassName'then return j elseif t=='Name'then return k elseif t=='Parent'then return l elseif j==
'StringValue'and t=='Value'then return n else local u=h[t]if u then return u end end for u in ai,m do if u.Name==t then
return u end end o(t)end r.__newindex=function(s,t,u)if t=='ClassName'then p(t)elseif t=='Name'then k=u elseif t==
'Parent'then if u==q then return end if l~=nil then f[l][q]=nil end l=u if u~=nil then f[u][q]=true end elseif j==
'StringValue'and t=='Value'then n=u else o(t)end end r.__tostring=function()return k end ag(q,r)f[q]=m if l~=nil then f[
l][q]=true end return q end local function j(k,l)local m,n,o,p=k[1],k[2],k[3],k[4]local q=aE[n]local r=o and aw(o,1)or q
local s=i(q,r,l)aF[m]=s if o then for t,u in ai,o do s[t]=u end end if p then for t,u in ai,p do j(u,s)end end return s
end local k=i('Folder','['..ad..']')for l,m in ai,ab do j(m,k)end for l,m in ai,aa do local n=aF[l]aG[n]=m b[n]=l local
o=n.ClassName if o=='LocalScript'or o=='Script'then av(d,n)end end local function l(m)local n,o=m.ClassName,c[m]if o and
n=='ModuleScript'then return ak(o)end local p=aG[m]local function q(r)local s,t,u=nil,ap(function()return debug.
traceback(nil,2)end)if t then s=u end return{Message=r,Traceback=s}end local function r(s)local t,u=ar(s.Message),m:
GetFullName()local v,w=aA(t,'[^:]+:(%d+): (.+)')local x if not v or not au then x=u..':*: '..(w or t)else v=as(v)local y
=b[m]local z=au[y]local A=v-z+1 if A<0 then A='?'end x=u..':'..A..': '..w end local y=s.Traceback if y and y~=''then x=x
..'\n'..y end return x end if n=='LocalScript'or n=='Script'then local s,t=aq(p,q)if not s then ah(r(t),0)end else local
s={aq(p,q)}local t=aw(s,1)if not t then local u=aw(s,1)ah(r(u),0)end c[m]=s return ak(s)end end function a(m)local n=aF[
m]local function o(p,...)local q={ap(p,...)}local r=aw(q,1)if not r then ah(q[1],3)end return ak(q)end local p=ax(ag({},
{__index=e,__newindex=function(p,q,r)e[q]=r end,__len=function()return#e end,__iter=function()return ai,e end}))local q,
r=ax{version=ac,envname=ad,shared=p,script=am,require=ao},n local function s(t,...)local u,v,w=an(t),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if u=='table'and f[t]then if t.
ClassName~='ModuleScript'then ah(v,2)elseif t==n then ah(w,2)end return l(t)elseif u=='string'and az(t,1,1)~='@'then if#
t==0 then ah('Attempted to call require with empty string',2)end local x=n if az(t,1,1)=='/'then x=k elseif az(t,1,2)==
'./'then t=az(t,3)end local y for z in aB(t,'([^/]*)/?')do local A=z if z=='..'then A='Parent'end if A~=''then local B=x
:FindFirstChild(A)if not B then local C=x.Parent if C then B=C:FindFirstChild(A)end end if B then x=B elseif z~=y and z
~='init'and z~='init.server'and z~='init.client'then ah('Virtual script path "'..t..'" not found',2)end end y=z end if x
.ClassName~='ModuleScript'then ah(v,2)elseif x==n then ah(w,2)end return l(x)end return o(ao,t,...)end return q,r,s end
for m,n in ai,d do aD(l,n)end return l(k:GetChildren()[1])