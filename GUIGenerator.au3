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
;~ Func _SystemConfig()
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
;~ EndFunc


; #FUNCTION# ====================================================================================================================
; Name ..........: CreatGUI
; Description ...: Creat GUI for application
; Syntax ........: CreatGUI()
; Parameters ....:
; Return values .: None
; Author ........: Tran Tuan Diep
; Modified ......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
;~ Func CreateGUI()
   ; Create a Windows GUI
   Const $TOOLWIDTH = 200
   Const $TOOLHEIGHT = 250
   GUICreate($APPLICATION_NAME, $TOOLWIDTH, $TOOLHEIGHT, @DesktopWidth - $TOOLWIDTH - 10, @DesktopHeight - $TOOLHEIGHT - 70, -1)
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
   $gclInterval=GUICtrlCreateInput("2500", 70, 82, 100, 20)
   ; row 5 110
   GUICtrlCreateLabel("Mode: ", 5, 110, 60, 15)
   $gcComboMode=GUICtrlCreateCombo("Adventure", 70, 107, 100, 20)
   GUICtrlSetData($gcComboMode, "Spirit|Hunt|Event1|Event2", "Dungeon")
   ; check box
   $gccBuyEnergyLeaf=GUICtrlCreateCheckbox("Use Leaf", 5, 135, 80, 15)
   ;$gccTaskbar=GUICtrlCreateCheckbox("Taskbar", 100, 135, 80, 15)
   $gccBuyEnergyGem=GUICtrlCreateCheckbox("Use Skystone", 5, 160, 80, 15)
   ; $gccRevive=GUICtrlCreateCheckbox("Revive", 100, 160, 80, 15)
   $gcbStart=GUICtrlCreateButton("Start", 10, $TOOLHEIGHT - 40, 80, 30)
   GUICtrlSetOnEvent(-1, "Start")
   GUICtrlCreateButton("Hide", 110, $TOOLHEIGHT - 40, 80, 30)
   GUICtrlSetOnEvent(-1, "Show")
   GUISetOnEvent($GUI_EVENT_CLOSE, "Close")
;~ EndFunc




















