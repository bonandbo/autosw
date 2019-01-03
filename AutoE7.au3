#comments-start
-dieptt
App screen: W:1920, H:1080
Interval: 1000 ms
Get App: Ctr + Shift + A/B/Check

OpenApp----------------------
kr.supercreative.epic7.AppActivity

#comments-end
#include <WinAPI.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <FileConstants.au3>
#include <Android.au3>
#include <GUIGenerator.au3>
;-------------
Global $struct = DllStructCreate($tagPoint)

_SystemConfig()
CreateGUI(200, 250)

While 1
   Sleep(100)
   Info()
WEnd
; Start >>>>

Func Start()
   If Not $application Then
	  MsgBox(0,"AutoE7","Press Ctrl + Shift + A to connect device")
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
;~    AutoClick()
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
   $time=50
;~    $time=GUICtrlRead($gclInterval)*1000
   $time=Int($time)
   If $t=1 Then
	  AdlibRegister("AutoClick",$time)
   Else
	  AdlibUnRegister("AutoClick")
   EndIf
EndFunc

Func AutoClick()
   $ratiow = 100
   $ratioh = 100
; Check Purchase State

   ConsoleWrite("Autoclick count = " & $click & @CRLF)
   If $click=$saveNormal Then
	  $click=0
	  $isStartLoop=False
	  $loopInterval=GUICtrlRead($gclInterval)
	  ConsoleWrite("Now wait until " & $loopInterval & "s" & @CRLF)
	  $loopInterval=Int($loopInterval)
	  Sleep($loopInterval*1000)
   Else
	  $isStartLoop=True
   Endif

   $x = $posXNormal[$click]*$ratiow/100
   $y = $posYNormal[$click]*$ratioh/100
   $click += 1

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
   ConsoleWrite("Start click at " & $x & "- " & $y & @CRLF)
   Runwait(@ComSpec & " /q /c " & "adb shell input tap "& $x &" " & $y,@ScriptDir,@SW_HIDE)
   $timeSleep = GUICtrlRead($gclIntervalClick)
   ConsoleWrite("time sleep per click = " & $timeSleep & @CRLF)
   Sleep(Number($timeSleep))
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


Func SetPosInMenu($mode)
   Switch $mode
	  Case "Adventure"
		 $posXNormal[($i)/2] = $MENU[$i]
		 $posYNormal[($i-1)/2] = $MENU[$i]
   EndSwitch
EndFunc

Func CheckBuy()
   If GUICtrlRead($gccComboBuyEnergy)=$STR_COMBO_NONE Then
	  Return 0
   ElseIf GUICtrlRead($gccComboBuyEnergy)=$STR_COMBO_USE_GEM Then
	  Return 1
   ElseIf GUICtrlRead($gccComboBuyEnergy)=$STR_COMBO_USE_LEAF Then
	  Return 2
   EndIf
EndFunc

Func SetPosition()
   If GUICtrlRead($gcComboMode)=$STR_COMBO_ADVENTURE Then
   ;------------------- Add pos adventure
	  $isStartLoop=True
	  $totalArray=0
	  If CheckBuy()=0 Then
		 $posXNormal[0] = $BUY_CANCEL[0]
		 $posYNormal[0] = $BUY_CANCEL[1]
		 $totalArray = UBound($ADVENTURE)+1
		 $i = 2
	  ElseIf CheckBuy()=1 Then
		 $posXNormal[0] = $BUY_GEM[0]
		 $posYNormal[0] = $BUY_GEM[1]
		 $posXNormal[1] = $BUY_CONFIRM[0]
		 $posYNormal[1] = $BUY_CONFIRM[1]
		 $totalArray = UBound($ADVENTURE)+3
		 $i = 4
	  ElseIf CheckBuy()=2 Then
		 $posXNormal[0] = $BUY_CONFIRM[0]
		 $posYNormal[0] = $BUY_CONFIRM[1]
		 $totalArray = UBound($ADVENTURE)+1
		 $i = 2
	  EndIf

	  For $j = 0 To UBound($ADVENTURE)-1
		 ConsoleWrite("j = " & $j & @CRLF)
		 If Mod($j, 2) = 0 Then
			$posXNormal[($j+$i)/2] = $ADVENTURE[$j]
		 Else
			$posYNormal[($j+$i-1)/2] = $ADVENTURE[$j]
		 EndIf
	  Next
	  $saveNormal = ($totalArray+1)/2
	  ConsoleWrite("save normal = " & $saveNormal & @CRLF)
   ElseIf GUICtrlRead($gcComboMode)=$STR_COMBO_HUNT Then
	  $isStartLoop=False
   EndIf
EndFunc


Func GetAppSize()
   Local $index = StringInStr($resolution,"x")
   $appheight = StringLeft($resolution,$index-1);
   $appwidth = StringRight( $resolution,$index)
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


