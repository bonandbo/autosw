#include <GlobalVar.au3>
#include <WinAPI.au3>
#include <GUIConstantsEx.au3>

; #FUNCTION# ====================================================================================================================
; Name ..........: _SystemConfig
; Description ...: In order to set hotkey, tray item and set option to window can search the application
; Syntax ........: _SystemConfig()
; Parameters ....:
; Return values .: None
; Author ........: Tran Tuan Diep
; Modified ......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _SystemConfig()
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
EndFunc


; #FUNCTION# ====================================================================================================================
; Name ..........: CreatGUI(w,h)
; Description ...: Creat GUI for application
; Syntax ........: CreatGUI()
; Parameters ....: int w, int h
; Return values .: None
; Author ........: Tran Tuan Diep
; Modified ......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func CreateGUI($toolW, $toolH)
   ; Create a Windows GUI
   GUICreate($APPLICATION_NAME, $toolW, $toolH, @DesktopWidth - $toolW - 10, @DesktopHeight - $toolH - 70, -1)
   GUISetState()

   ; row 1 10
   GUICtrlCreateLabel($STR_CONNECT_DEVICE, $PADDING_EDGE, $PADDING_TOP)
   $gcComboSetKey=GUICtrlCreateCombo("A", $toolW - ($PADDING_EDGE + 40), $PADDING_TOP - $COMBO_ALIGN, 40, $COMBO_HEIGHT)
   GUICtrlSetData($gcComboSetKey, "B|C", "A")

   ; row 2 35
   GUICtrlCreateLabel($STR_CONNECTION_STATUS, $PADDING_EDGE, $PADDING_TOP + $COMBO_HEIGHT + $PADDING_EDGE)
   $gcConnectStatus = GUICtrlCreateLabel($STR_CONNECTION_OFFLINE,($toolW - $PADDING_EDGE)/2, $PADDING_TOP + $COMBO_HEIGHT, 80, $TEXT_HEIGHT);

   ; row 3 55 //
   GUICtrlCreateLabel($STR_DEVICE_SCREEN, $PADDING_EDGE, $PADDING_TOP + $COMBO_HEIGHT*2 + $PADDING_EDGE)
   GUICtrlCreateLabel($STR_WIDTH, 70, $PADDING_TOP + $COMBO_HEIGHT*2 + $PADDING_EDGE)
   $gclW=GUICtrlCreateLabel("0", 85, $PADDING_TOP + $COMBO_HEIGHT*2 + $PADDING_EDGE, 40, $TEXT_HEIGHT)
   GUICtrlCreateLabel($STR_HEIGHT, 120, $PADDING_TOP + $COMBO_HEIGHT*2 + $PADDING_EDGE)
   $gclH=GUICtrlCreateLabel("0", 135, $PADDING_TOP + $COMBO_HEIGHT*2 + $PADDING_EDGE, 40, $TEXT_HEIGHT)
   $gclS=GUICtrlCreateLabel("0", 180, $PADDING_TOP + $COMBO_HEIGHT*2 + $PADDING_EDGE, 40, $TEXT_HEIGHT)

   ; row 4 85
   GUICtrlCreateLabel($STR_CLICK_WAIT, $PADDING_EDGE, $PADDING_TOP + $COMBO_HEIGHT*3 + $PADDING_EDGE)
   $gclIntervalClick=GUICtrlCreateInput("2500", ($toolW - $PADDING_EDGE)/2, $PADDING_TOP + $COMBO_HEIGHT*3 + $PADDING_EDGE - $COMBO_ALIGN)

   ; row 5 110
   GUICtrlCreateLabel($STR_LOOP, $PADDING_EDGE, $PADDING_TOP + $COMBO_HEIGHT*4 + $PADDING_EDGE)
   $gclInterval=GUICtrlCreateInput("180", ($toolW - $PADDING_EDGE)/2, $PADDING_TOP + $COMBO_HEIGHT*4 + $PADDING_EDGE - $COMBO_ALIGN)

   ; row 6 135
   GUICtrlCreateLabel($STR_MODE, $PADDING_EDGE, $PADDING_TOP + $COMBO_HEIGHT*5 + $PADDING_EDGE)
   $gcComboMode=GUICtrlCreateCombo($STR_COMBO_ADVENTURE, ($toolW - $PADDING_EDGE)/2, $PADDING_TOP + $COMBO_HEIGHT*5 + $PADDING_EDGE - $COMBO_ALIGN, 90, $COMBO_HEIGHT)
   GUICtrlSetData($gcComboMode, $STR_COMBO_SPIRIT & "|" & $STR_COMBO_HUNT & "|" & $STR_COMBO_EVENT1 & "|" & $STR_COMBO_EVENT2, $STR_COMBO_ADVENTURE)

   ; row 7 160
   GUICtrlCreateLabel($STR_BUY_ENERGY, $PADDING_EDGE, $PADDING_TOP + $COMBO_HEIGHT*6 + $PADDING_EDGE)
   $gccComboBuyEnergy=GUICtrlCreateCombo($STR_COMBO_NONE, ($toolW - $PADDING_EDGE)/2, $PADDING_TOP + $COMBO_HEIGHT*6 + $PADDING_EDGE - $COMBO_ALIGN, 90, $COMBO_HEIGHT)
   GUICtrlSetData($gccComboBuyEnergy, $STR_COMBO_USE_LEAF & "|" & $STR_COMBO_USE_GEM, $STR_COMBO_NONE)

   $gcbStart=GUICtrlCreateButton("Start", 10, $toolH - 40, 80, 30)
   GUICtrlSetOnEvent(-1, "Start")
   GUICtrlCreateButton("Hide", 110, $toolH - 40, 80, 30)
   GUICtrlSetOnEvent(-1, "Show")
   GUISetOnEvent($GUI_EVENT_CLOSE, "Close")
EndFunc




















