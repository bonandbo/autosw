#comments-start
vdanhdk do it
App Screen: W:960, H:540
Interval: 1000 ms
Get App: Ctr + Shift + A/B/Check
Mode: Dungeon/Rift/Raid/RTA
Sell Rune
Buy Energy
Taskbar
Position x, y
Dungeon----------------------
Start Battle 800, 360
Replay 430, 280
Sell Rune 450, 420
Get Rune 510, 420
Not Enough Energy 450, 310
Recharge Energy 180, 310
Purchase Energy 450, 310
Purchase Successful 450, 310
Purchase Close 800, 70
Revive 710, 370
Lich-------------------------
Start Battle 800, 360
Replay 170, 310
Sell Rune 450, 420
Get Rune 510, 420
Not Enough Energy 450, 310
Recharge Energy 180, 310
Purchase Energy 450, 310
Purchase Successful 450, 310
Purchase Close 800, 70
Revive 710, 370
Rift-------------------------
Start Battle 800, 360
Get Reward 1 640, 140
Get Reward 2 640, 180
Replay 200, 310
Not Enough Energy 450, 310
Recharge Energy 180, 310
Purchase Energy 450, 310
Purchase Successful 450, 310
Purchase Close 800, 70
Raid-------------------------
Pick Monter 1 600, 250
Pick Monter 2 325, 200
Start Battle 800, 460
Close Popup 480, 320
Get Reward 1 640, 100
Get Reward 2 640, 130
Get Reward 3 640, 160
Replay 325, 325
Close Info 780, 80
Not Enough Energy 450, 310
Recharge Energy 180, 310
Purchase Energy 450, 310
Purchase Successful 450, 310
Purchase Close 800, 70
End--------------------------
#comments-end
#include <WinAPI.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <FileConstants.au3>
#include <Android.au3>

Global $struct = DllStructCreate($tagPoint)
Global $application, $mouse, $visible=True, $start=False, $posXNormal[10], $posYNormal[10], $posXPurchase[5], $posYPurchase[5]
Global $save=0, $click=0, $appSize=0, $ratiow=0, $ratioh=0, $appwidth=0, $appheight=0, $saveNormal=0, $savePurchase=0, $TaskbarSize=0
Global $resolution=""
Global $timeDelayPurchase=0, $timeStartPurchase=0
Global $purchased=False
Const $LOOPPURCHASE = 2*60*1000 ; 2min
Const $DELAYPURCHASE = 5*1000 ; 5sec
Const $SCREEN_SIZE[2] = [960, 540]
Const $DUNGEON[4] = [800, 360, 430, 280]
Const $DUNGEONLICH[4] = [800, 360, 170, 310]
Const $RIFT[8] = [800, 360, 640, 140, 640, 180, 200, 310]
Const $RAID[18] = [600, 250, 325, 200, 800, 460, 480, 320, 640, 100, 640, 130, 640, 160, 325, 325, 770, 80]
Const $REVIVE[2] = [710, 370]
Const $SELL_RUNE[2] = [450, 420]
Const $GET_RUNE[2] = [510, 420]
Const $BUY_ENERGY[10] = [450, 310, 180, 310, 450, 310, 450, 310, 800, 70]
Const $RTARENA[4] = [830, 220, 450, 300]
Const $POWERUPRUNE[2] = [222, 333]
Const $TASKBAR = 60
Const $WM_LBUTTONDOWN = 0x201
Const $WM_LBUTTONUP = 0x202
Const $MK_LBUTTON = 0x1
Opt("GUIOnEventMode",1)
Opt("TrayMenuMode",1)
Opt("TrayOnEventMode",1)
TraySetOnEvent(-13,"Show")
TraySetClick(1)
TraySetState()
; Tray item
$tciStart=TrayCreateItem("Start")
TrayItemSetOnEvent(-1, "Start")
$tciShow=TrayCreateItem("Show/Hide")
TrayItemSetOnEvent(-1, "Show")
TrayCreateItem("") ; Separator line
$tciClose=TrayCreateItem("Close")
TrayItemSetOnEvent(-1, "Close")
; Hotkey
HotKeySet("^+a","GetAppKey")
HotKeySet("^+b","GetAppKey")
HotKeySet("^+c","GetAppKey")
HotKeySet("^+s","Start")
HotKeySet("^`","Start")
HotKeySet("^`","Start")
; Create a Windows GUI
Const $TOOLWIDTH = 200
Const $TOOLHEIGHT = 250
GUICreate("AutoSW", $TOOLWIDTH, $TOOLHEIGHT, @DesktopWidth - $TOOLWIDTH - 10, @DesktopHeight - $TOOLHEIGHT - 70, -1)
GUISetState()
; row 1 10

GUICtrlCreateLabel("Connect device: Ctrl + Shift + ", 5, 10, 145, 15)
$gcComboSetKey=GUICtrlCreateCombo("A", 150, 7, 40, 20)
GUICtrlSetData($gcComboSetKey, "B|C", "A")
; row 2 35
GUICtrlCreateLabel("Status:", 5, 35, 40, 15)

$gcConnectStatus = GUICtrlCreateLabel("Offline",45, 35, 70, 15);

;GUICtrlCreateLabel("X:", 72, 35, 70, 15)
;$gclX=GUICtrlCreateLabel("0", 85, 35, 70, 15)
;GUICtrlCreateLabel("Y:", 120, 35, 70, 15)
;$gclY=GUICtrlCreateLabel("0", 135, 35, 70, 15)
; row 3 60 //
GUICtrlCreateLabel("Device Screen:", 5, 60, 70, 15)
GUICtrlCreateLabel("W:", 70, 60, 70, 15)
$gclW=GUICtrlCreateLabel("0", 85, 60, 70, 15)
GUICtrlCreateLabel("H:", 120, 60, 70, 15)
$gclH=GUICtrlCreateLabel("0", 135, 60, 70, 15)
$gclS=GUICtrlCreateLabel("0", 180, 60, 70, 15)




; row 4 85
GUICtrlCreateLabel("Interval(ms):", 5, 85, 60, 15)
$gclInterval=GUICtrlCreateInput("1000", 70, 82, 100, 20)
; row 5 110
GUICtrlCreateLabel("Mode: ", 5, 110, 60, 15)
$gcComboMode=GUICtrlCreateCombo("Dungeon", 70, 107, 100, 20)
GUICtrlSetData($gcComboMode, "Lich|Rift|Raid|RTA|Rune", "Dungeon")
; check box
$gccGetRune=GUICtrlCreateCheckbox("Get Rune", 5, 135, 80, 15)
;$gccTaskbar=GUICtrlCreateCheckbox("Taskbar", 100, 135, 80, 15)
$gccBuyEnergy=GUICtrlCreateCheckbox("Buy Energy", 5, 160, 80, 15)
$gccRevive=GUICtrlCreateCheckbox("Revive", 100, 160, 80, 15)
$gcbStart=GUICtrlCreateButton("Start", 10, $TOOLHEIGHT - 40, 80, 30)
GUICtrlSetOnEvent(-1, "Start")
GUICtrlCreateButton("Hide", 110, $TOOLHEIGHT - 40, 80, 30)
GUICtrlSetOnEvent(-1, "Show")
GUISetOnEvent($GUI_EVENT_CLOSE, "Close")


While 1
Sleep(100)
Info()
WEnd
; Start >>>>

Func Start()
   If Not $application Then
	  MsgBox(0,"AutoSW","Press Ctrl + Shift + A to connect device")
   Return 0
   EndIf
   ToolTip("")
   SetPosition()
   TrayItemSetState($tciStart,4)
   If GUICtrlRead($gcbStart)="Start" Then
	  GUICtrlSetData($gcbStart,"Stop")
	  TrayItemSetText($tciStart,"Stop")
   Else
	  GUICtrlSetData($gcbStart,"Start")
	  TrayItemSetText($tciStart,"Start")
   EndIf
   AutoClick()
   ; Buy energy first
   ; If CheckboxChecked($gccBuyEnergy)=True Then
   ; EnterPurchaseState()
   ; Else
   ExitPurchaseState()
   ; Endif
   $start=Not $start
   If $start Then
	  Replay(1)
   Else
	  Replay(0)
   EndIf
EndFunc



Func Replay($t)
   $time=GUICtrlRead($gclInterval)
   If $time="" Then $time=0
   $time=Int($time)
   If $t=1 Then
	  AdlibRegister("AutoClick",$time)
   Else
	  AdlibUnRegister("AutoClick")
   EndIf
EndFunc

Func AutoClick()
; Check Purchase State
   If CheckboxChecked($gccBuyEnergy)=True Then
	  If $purchased=False AND TimerDiff($timeStartPurchase) > $LOOPPURCHASE Then
		 EnterPurchaseState()
	  EndIf
	  If $purchased=True AND $click=$savePurchase Then
		 ExitPurchaseState()
	  EndIf
   Endif
   ; Auto Click When Purchase Or No
   If $purchased=False Then
	  If $click=$saveNormal Then
		 $click=0
	  Endif
	  $x = $posXNormal[$click]*$ratiow/100
	  $y = $posYNormal[$click]*$ratioh/100
	  $click += 1
   Else
	  If TimerDiff($timeDelayPurchase) > $DELAYPURCHASE Then
		 $x = $posXPurchase[$click]*$ratiow/100
		 $y = $posYPurchase[$click]*$ratioh/100
		 $click += 1
		 $timeDelayPurchase=TimerInit()
	  Else
		 Return 0
	  EndIf
   Endif
   If $click>0 Then
	  Click($x,$y)
   Endif
EndFunc


Func EnterPurchaseState()
$purchased=True
$click=0
$timeDelayPurchase=TimerInit()
EndFunc
Func ExitPurchaseState()
$purchased=False
$click=0
$timeStartPurchase=TimerInit()
EndFunc


;click function
Func Click($x=0, $y=0)
$lParam = _WinAPI_MakeLong($x, $y)
Runwait(@ComSpec & " /q /c " & "adb shell input tap "& $x &" " & $y,@ScriptDir,@SW_HIDE)
EndFunc


Func GetApp()
   ;DllStructSetData($struct, "x", MouseGetPos(0))
   ;DllStructSetData($struct, "y", MouseGetPos(1))

   _Android_Connect();
   GUICtrlSetData($gcConnectStatus,"Connecting...")
   GUICtrlSetColor($gcConnectStatus, $COLOR_BLUE)
   Sleep(4000)
   While 1
	  if(_Android_IsOnline()) Then
		 GUICtrlSetData($gcConnectStatus,"Connected!")
		 GUICtrlSetColor($gcConnectStatus, $COLOR_RED)
		 $resolution = _Android_GetResolution()

		 ExitLoop
	  EndIf
	  Sleep(500)
   WEnd
   $application = 1
   GetAppSize()
EndFunc


Func SetPosition()
If GUICtrlRead($gcComboMode)="Dungeon" Then
; Add pos Dungeon
For $i = 0 To UBound($DUNGEON)-1
If Mod($i, 2) = 0 Then
$posXNormal[($i)/2] = $DUNGEON[$i]
Else
$posYNormal[($i-1)/2] = $DUNGEON[$i]
EndIf
Next
$saveNormal = UBound($DUNGEON)/2
If CheckboxChecked($gccGetRune)=True Then
For $i = 0 To UBound($GET_RUNE)-1
If Mod($i, 2) = 0 Then
$posXNormal[($i)/2 + $saveNormal] = $GET_RUNE[$i]
Else
$posYNormal[($i-1)/2 + $saveNormal] = $GET_RUNE[$i]
EndIf
Next
$saveNormal += UBound($GET_RUNE)/2
Else
For $i = 0 To UBound($SELL_RUNE)-1
If Mod($i, 2) = 0 Then
$posXNormal[($i)/2 + $saveNormal] = $SELL_RUNE[$i]
Else
$posYNormal[($i-1)/2 + $saveNormal] = $SELL_RUNE[$i]
EndIf
Next
$saveNormal += UBound($SELL_RUNE)/2
EndIf
If CheckboxChecked($gccRevive)=True Then
For $i = 0 To UBound($REVIVE)-1
If Mod($i, 2) = 0 Then
$posXNormal[($i)/2 + $saveNormal] = $REVIVE[$i]
Else
$posYNormal[($i-1)/2 + $saveNormal] = $REVIVE[$i]
EndIf
Next
$saveNormal += UBound($REVIVE)/2
EndIf
If CheckboxChecked($gccBuyEnergy)=True Then
For $i = 0 To UBound($BUY_ENERGY)-1
If Mod($i, 2) = 0 Then
$posXPurchase[($i)/2] = $BUY_ENERGY[$i]
Else
$posYPurchase[($i-1)/2] = $BUY_ENERGY[$i]
EndIf
Next
$savePurchase = UBound($BUY_ENERGY)/2
EndIf
ElseIf GUICtrlRead($gcComboMode)="Lich" Then
; Add pos Dungeon Lich
For $i = 0 To UBound($DUNGEONLICH)-1
If Mod($i, 2) = 0 Then
$posXNormal[($i)/2] = $DUNGEONLICH[$i]
Else
$posYNormal[($i-1)/2] = $DUNGEONLICH[$i]
EndIf
Next
$saveNormal = UBound($DUNGEONLICH)/2
For $i = 0 To UBound($GET_RUNE)-1
If Mod($i, 2) = 0 Then
$posXNormal[($i)/2 + $saveNormal] = $GET_RUNE[$i]
Else
$posYNormal[($i-1)/2 + $saveNormal] = $GET_RUNE[$i]
EndIf
Next
$saveNormal += UBound($GET_RUNE)/2
If CheckboxChecked($gccRevive)=True Then
For $i = 0 To UBound($REVIVE)-1
If Mod($i, 2) = 0 Then
$posXNormal[($i)/2 + $saveNormal] = $REVIVE[$i]
Else
$posYNormal[($i-1)/2 + $saveNormal] = $REVIVE[$i]
EndIf
Next
$saveNormal += UBound($REVIVE)/2
EndIf
If CheckboxChecked($gccBuyEnergy)=True Then
For $i = 0 To UBound($BUY_ENERGY)-1
If Mod($i, 2) = 0 Then
$posXPurchase[($i)/2] = $BUY_ENERGY[$i]
Else
$posYPurchase[($i-1)/2] = $BUY_ENERGY[$i]
EndIf
Next
$savePurchase = UBound($BUY_ENERGY)/2
EndIf
ElseIf GUICtrlRead($gcComboMode)="Rift" Then
; Add pos Rift
For $i = 0 To UBound($RIFT)-1
If Mod($i, 2) = 0 Then
$posXNormal[($i)/2] = $RIFT[$i]
Else
$posYNormal[($i-1)/2] = $RIFT[$i]
EndIf
Next
$saveNormal = UBound($RIFT)/2
If CheckboxChecked($gccBuyEnergy)=True Then
For $i = 0 To UBound($BUY_ENERGY)-1
If Mod($i, 2) = 0 Then
$posXPurchase[($i)/2] = $BUY_ENERGY[$i]
Else
$posYPurchase[($i-1)/2] = $BUY_ENERGY[$i]
EndIf
Next
$savePurchase = UBound($BUY_ENERGY)/2
EndIf
ElseIf GUICtrlRead($gcComboMode)="Raid" Then
; Add pos Raid
For $i = 0 To UBound($RAID)-1
If Mod($i, 2) = 0 Then
$posXNormal[($i)/2] = $RAID[$i]
Else
$posYNormal[($i-1)/2] = $RAID[$i]
EndIf
Next
$saveNormal = UBound($RAID)/2
If CheckboxChecked($gccBuyEnergy)=True Then
For $i = 0 To UBound($BUY_ENERGY)-1
If Mod($i, 2) = 0 Then
$posXPurchase[($i)/2] = $BUY_ENERGY[$i]
Else
$posYPurchase[($i-1)/2] = $BUY_ENERGY[$i]
EndIf
Next
$savePurchase = UBound($BUY_ENERGY)/2
EndIf
ElseIf GUICtrlRead($gcComboMode)="RTA" Then
; Add pos RTA
For $i = 0 To UBound($RTARENA)-1
If Mod($i, 2) = 0 Then
$posXNormal[($i)/2] = $RTARENA[$i]
Else
$posYNormal[($i-1)/2] = $RTARENA[$i]
EndIf
Next
$saveNormal = UBound($RTARENA)/2
ElseIf GUICtrlRead($gcComboMode)="Rune" Then
; Add pos Power-up Rune
For $i = 0 To UBound($POWERUPRUNE)-1
If Mod($i, 2) = 0 Then
$posXNormal[($i)/2] = $POWERUPRUNE[$i]
Else
$posYNormal[($i-1)/2] = $POWERUPRUNE[$i]
EndIf
Next
$saveNormal = UBound($POWERUPRUNE)/2
EndIf
EndFunc
Func GetAppSize()
;$appSize = WinGetClientSize($application)
;If $appSize=0 Then
;Return 0
;Endif

;StringInStr($resolution,
Local $index = StringInStr($resolution,"x")
$appheight = StringLeft($resolution,$index-1);
$appwidth = StringRight( $resolution,$index)
;$appwidth = 1280;$appSize[0]
;$appheight = 720;$appSize[1]
;If (CheckboxChecked($gccTaskbar)=True) Then
;$TaskbarSize = $TASKBAR
;Else
$TaskbarSize = 0
;Endif
$ratiow = ($appwidth - $TaskbarSize)*100/$SCREEN_SIZE[0]
$ratioh = $appheight*100/$SCREEN_SIZE[1]
EndFunc
Func Info()
If Not $application Then
Return 0
EndIf
GetAppSize()
GUICtrlSetData($gclW,$appwidth)
GUICtrlSetData($gclH,$appheight)
GUICtrlSetData($gclS,$click)
EndFunc
Func Show()
TrayItemSetState($tciShow,4)
$visible=Not $visible
If $visible=True Then
GUISetState(@SW_SHOW)
Else
GUISetState(@SW_HIDE)
EndIf
EndFunc
Func CheckboxChecked($idControlID)
Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc
Func GetAppKey()
Switch GUICtrlRead($gcComboSetKey)
Case "A"
HotKeySet("^+b")
HotKeySet("^+c")
GetApp()
Case "B"
HotKeySet("^+a")
HotKeySet("^+c")
GetApp()
Case "C"
HotKeySet("^+a")
HotKeySet("^+b")
GetApp()
Case Else
HotKeySet("^+a")
HotKeySet("^+b")
HotKeySet("^+c")
EndSwitch
EndFunc
; <<<< End
Func Close()
Exit
EndFunc


