#comments-start

Menu-----------------------
Goto Battle 1600, 965
Goto Event 416, 641
Goto Spirit 1100, 315
Goto Hunt 1100, 945

Event------------------------
First Event 1200, 340
Second Event 1200, 620

Adventure--------------------
Start Adventure 1600, 1000
Ready 1600, 1000
Loop----
Select team 1419, 960
1st Sup 970, 274
War Sup 585, 168
Knight Sup 647, 168
Thief Sup 750, 168
Healer Sup 1000, 168
Start 1422, 952
Clear 966, 484
Confirm 1750, 1000
Try Again 1750, 1000
Lobby 400, 1000
Back 175, 1000

End--------------------------
#comments-end



Global $application, $mouse, $visible=True, $start=False, $posXNormal[10], $posYNormal[10], $posXPurchase[5], $posYPurchase[5]
Global $save=0, $click=0, $appSize=0, $ratiow=0, $ratioh=0, $appwidth=0, $appheight=0, $saveNormal=0, $savePurchase=0, $TaskbarSize=0
Global $resolution=""
Global $timeDelayPurchase=0, $timeStartPurchase=0
Global $purchased=False
Global $gcComboSetKey, $gcConnectStatus, $gclW, $gclH, $gclS, $gcComboMode

Const $LOOPPURCHASE = 2*60*1000 ; 2min
Const $DELAYPURCHASE = 5*1000 ; 5sec
Const $SCREEN_SIZE[2] = [1920, 1080]
;------------
Const $MENU[8] = [1600, 965, 416, 641, 1100, 315, 1100, 945]
Const $EVENT[4] = [1200, 340, 1200, 620]

; Loop----
Const $ADVENTURE_READY[2] = [1600, 1000] ;// 2 times
Const $ADVENTURE[10] = [966, 484, 1750, 1000, 1750, 1000, 1419, 960, 1422, 952]
Const $SUPPORT[12] = [970, 274, 585, 168, 585, 168, 647, 168, 750, 168, 1000, 768]
Const $REVIVE[2] = [0,0] ; place holder
;Const $BUY_ENERGY[4] = [, , , ]
;Const $URGENT_MISSION[2] = [] ; place holder

;------------
Const $TASKBAR = 60
Const $WM_LBUTTONDOWN = 0x201
Const $WM_LBUTTONUP = 0x202
Const $MK_LBUTTON = 0x1
;------------

Const $APPLICATION_NAME = "Auto Epic7 for Android"