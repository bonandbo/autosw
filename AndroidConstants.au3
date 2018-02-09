#include-once

; #INDEX# =======================================================================================================================
; Title .........: Android_Constants
; AutoIt Version : 3.3
; Language ......: English
; Description ...:
; Author(s) .....: Kyaw Swar Thwin
; ===============================================================================================================================

; #CONSTANTS# ===================================================================================================================
Global Const $INSTALL_SUCCEEDED = 1
Global Const $INSTALL_FAILED_ALREADY_EXISTS = -1
Global Const $INSTALL_FAILED_INVALID_APK = -2
Global Const $INSTALL_FAILED_INVALID_URI = -3
Global Const $INSTALL_FAILED_INSUFFICIENT_STORAGE = -4
Global Const $INSTALL_FAILED_DUPLICATE_PACKAGE = -5
Global Const $INSTALL_FAILED_NO_SHARED_USER = -6
Global Const $INSTALL_FAILED_UPDATE_INCOMPATIBLE = -7
Global Const $INSTALL_FAILED_SHARED_USER_INCOMPATIBLE = -8
Global Const $INSTALL_FAILED_MISSING_SHARED_LIBRARY = -9
Global Const $INSTALL_FAILED_REPLACE_COULDNT_DELETE = -10
Global Const $INSTALL_FAILED_DEXOPT = -11
Global Const $INSTALL_FAILED_OLDER_SDK = -12
Global Const $INSTALL_FAILED_CONFLICTING_PROVIDER = -13
Global Const $INSTALL_FAILED_NEWER_SDK = -14
Global Const $INSTALL_FAILED_TEST_ONLY = -15
Global Const $INSTALL_FAILED_CPU_ABI_INCOMPATIBLE = -16
Global Const $INSTALL_FAILED_MISSING_FEATURE = -17
Global Const $INSTALL_FAILED_CONTAINER_ERROR = -18
Global Const $INSTALL_FAILED_INVALID_INSTALL_LOCATION = -19
Global Const $INSTALL_FAILED_MEDIA_UNAVAILABLE = -20
Global Const $INSTALL_FAILED_VERIFICATION_TIMEOUT = -21
Global Const $INSTALL_FAILED_VERIFICATION_FAILURE = -22
Global Const $INSTALL_FAILED_PACKAGE_CHANGED = -23
Global Const $INSTALL_FAILED_UID_CHANGED = -24
Global Const $INSTALL_FAILED_VERSION_DOWNGRADE = -25
Global Const $INSTALL_FAILED_INTERNAL_ERROR = -110
Global Const $INSTALL_FAILED_USER_RESTRICTED = -111

Global Const $KEYCODE_UNKNOWN = 0
Global Const $KEYCODE_SOFT_LEFT = 1
Global Const $KEYCODE_SOFT_RIGHT = 2
Global Const $KEYCODE_HOME = 3
Global Const $KEYCODE_BACK = 4
Global Const $KEYCODE_CALL = 5
Global Const $KEYCODE_ENDCALL = 6
Global Const $KEYCODE_0 = 7
Global Const $KEYCODE_1 = 8
Global Const $KEYCODE_2 = 9
Global Const $KEYCODE_3 = 10
Global Const $KEYCODE_4 = 11
Global Const $KEYCODE_5 = 12
Global Const $KEYCODE_6 = 13
Global Const $KEYCODE_7 = 14
Global Const $KEYCODE_8 = 15
Global Const $KEYCODE_9 = 16
Global Const $KEYCODE_STAR = 17
Global Const $KEYCODE_POUND = 18
Global Const $KEYCODE_DPAD_UP = 19
Global Const $KEYCODE_DPAD_DOWN = 20
Global Const $KEYCODE_DPAD_LEFT = 21
Global Const $KEYCODE_DPAD_RIGHT = 22
Global Const $KEYCODE_DPAD_CENTER = 23
Global Const $KEYCODE_VOLUME_UP = 24
Global Const $KEYCODE_VOLUME_DOWN = 25
Global Const $KEYCODE_POWER = 26
Global Const $KEYCODE_CAMERA = 27
Global Const $KEYCODE_CLEAR = 28
Global Const $KEYCODE_A = 29
Global Const $KEYCODE_B = 30
Global Const $KEYCODE_C = 31
Global Const $KEYCODE_D = 32
Global Const $KEYCODE_E = 33
Global Const $KEYCODE_F = 34
Global Const $KEYCODE_G = 35
Global Const $KEYCODE_H = 36
Global Const $KEYCODE_I = 37
Global Const $KEYCODE_J = 38
Global Const $KEYCODE_K = 39
Global Const $KEYCODE_L = 40
Global Const $KEYCODE_M = 41
Global Const $KEYCODE_N = 42
Global Const $KEYCODE_O = 43
Global Const $KEYCODE_P = 44
Global Const $KEYCODE_Q = 45
Global Const $KEYCODE_R = 46
Global Const $KEYCODE_S = 47
Global Const $KEYCODE_T = 48
Global Const $KEYCODE_U = 49
Global Const $KEYCODE_V = 50
Global Const $KEYCODE_W = 51
Global Const $KEYCODE_X = 52
Global Const $KEYCODE_Y = 53
Global Const $KEYCODE_Z = 54
Global Const $KEYCODE_COMMA = 55
Global Const $KEYCODE_PERIOD = 56
Global Const $KEYCODE_ALT_LEFT = 57
Global Const $KEYCODE_ALT_RIGHT = 58
Global Const $KEYCODE_SHIFT_LEFT = 59
Global Const $KEYCODE_SHIFT_RIGHT = 60
Global Const $KEYCODE_TAB = 61
Global Const $KEYCODE_SPACE = 62
Global Const $KEYCODE_SYM = 63
Global Const $KEYCODE_EXPLORER = 64
Global Const $KEYCODE_ENVELOPE = 65
Global Const $KEYCODE_ENTER = 66
Global Const $KEYCODE_DEL = 67
Global Const $KEYCODE_GRAVE = 68
Global Const $KEYCODE_MINUS = 69
Global Const $KEYCODE_EQUALS = 70
Global Const $KEYCODE_LEFT_BRACKET = 71
Global Const $KEYCODE_RIGHT_BRACKET = 72
Global Const $KEYCODE_BACKSLASH = 73
Global Const $KEYCODE_SEMICOLON = 74
Global Const $KEYCODE_APOSTROPHE = 75
Global Const $KEYCODE_SLASH = 76
Global Const $KEYCODE_AT = 77
Global Const $KEYCODE_NUM = 78
Global Const $KEYCODE_HEADSETHOOK = 79
Global Const $KEYCODE_FOCUS = 80
Global Const $KEYCODE_PLUS = 81
Global Const $KEYCODE_MENU = 82
Global Const $KEYCODE_NOTIFICATION = 83
Global Const $KEYCODE_SEARCH = 84
Global Const $KEYCODE_MEDIA_PLAY_PAUSE = 85
Global Const $KEYCODE_MEDIA_STOP = 86
Global Const $KEYCODE_MEDIA_NEXT = 87
Global Const $KEYCODE_MEDIA_PREVIOUS = 88
Global Const $KEYCODE_MEDIA_REWIND = 89
Global Const $KEYCODE_MEDIA_FAST_FORWARD = 90
Global Const $KEYCODE_MUTE = 91
Global Const $KEYCODE_PAGE_UP = 92
Global Const $KEYCODE_PAGE_DOWN = 93
Global Const $KEYCODE_PICTSYMBOLS = 94
Global Const $KEYCODE_SWITCH_CHARSET = 95
Global Const $KEYCODE_BUTTON_A = 96
Global Const $KEYCODE_BUTTON_B = 97
Global Const $KEYCODE_BUTTON_C = 98
Global Const $KEYCODE_BUTTON_X = 99
Global Const $KEYCODE_BUTTON_Y = 100
Global Const $KEYCODE_BUTTON_Z = 101
Global Const $KEYCODE_BUTTON_L1 = 102
Global Const $KEYCODE_BUTTON_R1 = 103
Global Const $KEYCODE_BUTTON_L2 = 104
Global Const $KEYCODE_BUTTON_R2 = 105
Global Const $KEYCODE_BUTTON_THUMBL = 106
Global Const $KEYCODE_BUTTON_THUMBR = 107
Global Const $KEYCODE_BUTTON_START = 108
Global Const $KEYCODE_BUTTON_SELECT = 109
Global Const $KEYCODE_BUTTON_MODE = 110
Global Const $KEYCODE_ESCAPE = 111
Global Const $KEYCODE_FORWARD_DEL = 112
Global Const $KEYCODE_CTRL_LEFT = 113
Global Const $KEYCODE_CTRL_RIGHT = 114
Global Const $KEYCODE_CAPS_LOCK = 115
Global Const $KEYCODE_SCROLL_LOCK = 116
Global Const $KEYCODE_META_LEFT = 117
Global Const $KEYCODE_META_RIGHT = 118
Global Const $KEYCODE_FUNCTION = 119
Global Const $KEYCODE_SYSRQ = 120
Global Const $KEYCODE_BREAK = 121
Global Const $KEYCODE_MOVE_HOME = 122
Global Const $KEYCODE_MOVE_END = 123
Global Const $KEYCODE_INSERT = 124
Global Const $KEYCODE_FORWARD = 125
Global Const $KEYCODE_MEDIA_PLAY = 126
Global Const $KEYCODE_MEDIA_PAUSE = 127
Global Const $KEYCODE_MEDIA_CLOSE = 128
Global Const $KEYCODE_MEDIA_EJECT = 129
Global Const $KEYCODE_MEDIA_RECORD = 130
Global Const $KEYCODE_F1 = 131
Global Const $KEYCODE_F2 = 132
Global Const $KEYCODE_F3 = 133
Global Const $KEYCODE_F4 = 134
Global Const $KEYCODE_F5 = 135
Global Const $KEYCODE_F6 = 136
Global Const $KEYCODE_F7 = 137
Global Const $KEYCODE_F8 = 138
Global Const $KEYCODE_F9 = 139
Global Const $KEYCODE_F10 = 140
Global Const $KEYCODE_F11 = 141
Global Const $KEYCODE_F12 = 142
Global Const $KEYCODE_NUM_LOCK = 143
Global Const $KEYCODE_NUMPAD_0 = 144
Global Const $KEYCODE_NUMPAD_1 = 145
Global Const $KEYCODE_NUMPAD_2 = 146
Global Const $KEYCODE_NUMPAD_3 = 147
Global Const $KEYCODE_NUMPAD_4 = 148
Global Const $KEYCODE_NUMPAD_5 = 149
Global Const $KEYCODE_NUMPAD_6 = 150
Global Const $KEYCODE_NUMPAD_7 = 151
Global Const $KEYCODE_NUMPAD_8 = 152
Global Const $KEYCODE_NUMPAD_9 = 153
Global Const $KEYCODE_NUMPAD_DIVIDE = 154
Global Const $KEYCODE_NUMPAD_MULTIPLY = 155
Global Const $KEYCODE_NUMPAD_SUBTRACT = 156
Global Const $KEYCODE_NUMPAD_ADD = 157
Global Const $KEYCODE_NUMPAD_DOT = 158
Global Const $KEYCODE_NUMPAD_COMMA = 159
Global Const $KEYCODE_NUMPAD_ENTER = 160
Global Const $KEYCODE_NUMPAD_EQUALS = 161
Global Const $KEYCODE_NUMPAD_LEFT_PAREN = 162
Global Const $KEYCODE_NUMPAD_RIGHT_PAREN = 163
Global Const $KEYCODE_VOLUME_MUTE = 164
Global Const $KEYCODE_INFO = 165
Global Const $KEYCODE_CHANNEL_UP = 166
Global Const $KEYCODE_CHANNEL_DOWN = 167
Global Const $KEYCODE_ZOOM_IN = 168
Global Const $KEYCODE_ZOOM_OUT = 169
Global Const $KEYCODE_TV = 170
Global Const $KEYCODE_WINDOW = 171
Global Const $KEYCODE_GUIDE = 172
Global Const $KEYCODE_DVR = 173
Global Const $KEYCODE_BOOKMARK = 174
Global Const $KEYCODE_CAPTIONS = 175
Global Const $KEYCODE_SETTINGS = 176
Global Const $KEYCODE_TV_POWER = 177
Global Const $KEYCODE_TV_INPUT = 178
Global Const $KEYCODE_STB_POWER = 179
Global Const $KEYCODE_STB_INPUT = 180
Global Const $KEYCODE_AVR_POWER = 181
Global Const $KEYCODE_AVR_INPUT = 182
Global Const $KEYCODE_PROG_RED = 183
Global Const $KEYCODE_PROG_GREEN = 184
Global Const $KEYCODE_PROG_YELLOW = 185
Global Const $KEYCODE_PROG_BLUE = 186
Global Const $KEYCODE_APP_SWITCH = 187
Global Const $KEYCODE_BUTTON_1 = 188
Global Const $KEYCODE_BUTTON_2 = 189
Global Const $KEYCODE_BUTTON_3 = 190
Global Const $KEYCODE_BUTTON_4 = 191
Global Const $KEYCODE_BUTTON_5 = 192
Global Const $KEYCODE_BUTTON_6 = 193
Global Const $KEYCODE_BUTTON_7 = 194
Global Const $KEYCODE_BUTTON_8 = 195
Global Const $KEYCODE_BUTTON_9 = 196
Global Const $KEYCODE_BUTTON_10 = 197
Global Const $KEYCODE_BUTTON_11 = 198
Global Const $KEYCODE_BUTTON_12 = 199
Global Const $KEYCODE_BUTTON_13 = 200
Global Const $KEYCODE_BUTTON_14 = 201
Global Const $KEYCODE_BUTTON_15 = 202
Global Const $KEYCODE_BUTTON_16 = 203
Global Const $KEYCODE_LANGUAGE_SWITCH = 204
Global Const $KEYCODE_MANNER_MODE = 205
Global Const $KEYCODE_3D_MODE = 206
Global Const $KEYCODE_CONTACTS = 207
Global Const $KEYCODE_CALENDAR = 208
Global Const $KEYCODE_MUSIC = 209
Global Const $KEYCODE_CALCULATOR = 210
Global Const $KEYCODE_ZENKAKU_HANKAKU = 211
Global Const $KEYCODE_EISU = 212
Global Const $KEYCODE_MUHENKAN = 213
Global Const $KEYCODE_HENKAN = 214
Global Const $KEYCODE_KATAKANA_HIRAGANA = 215
Global Const $KEYCODE_YEN = 216
Global Const $KEYCODE_RO = 217
Global Const $KEYCODE_KANA = 218
Global Const $KEYCODE_ASSIST = 219
Global Const $KEYCODE_BRIGHTNESS_DOWN = 220
Global Const $KEYCODE_BRIGHTNESS_UP = 221
Global Const $KEYCODE_MEDIA_AUDIO_TRACK = 222

Global Const $SCREEN_ON_BIT = 0x00000001

Global Const $AIRPLANE_MODE_ON = "airplane_mode_on"

Global Const $ENV_EXTERNAL_STORAGE = "EXTERNAL_STORAGE"
Global Const $ENV_SECONDARY_STORAGE = "SECONDARY_STORAGE"

Global Const $BATTERY_PLUGGED_AC = 1
Global Const $BATTERY_PLUGGED_USB = 2
Global Const $BATTERY_PLUGGED_WIRELESS = 4

Global Const $BATTERY_STATUS_UNKNOWN = 1
Global Const $BATTERY_STATUS_CHARGING = 2
Global Const $BATTERY_STATUS_DISCHARGING = 3
Global Const $BATTERY_STATUS_NOT_CHARGING = 4
Global Const $BATTERY_STATUS_FULL = 5

Global Const $BATTERY_HEALTH_UNKNOWN = 1
Global Const $BATTERY_HEALTH_GOOD = 2
Global Const $BATTERY_HEALTH_OVERHEAT = 3
Global Const $BATTERY_HEALTH_DEAD = 4
Global Const $BATTERY_HEALTH_OVER_VOLTAGE = 5
Global Const $BATTERY_HEALTH_UNSPECIFIED_FAILURE = 6
Global Const $BATTERY_HEALTH_COLD = 7

Global Const $LOW_BATTERY_THRESHOLD = 20

Global Const $PROPERTY_OPERATOR_NUMERIC = "gsm.operator.numeric"
Global Const $PROPERTY_OPERATOR_ALPHA = "gsm.operator.alpha"
Global Const $PROPERTY_OPERATOR_ISO_COUNTRY = "gsm.operator.iso-country"
Global Const $PROPERTY_OPERATOR_ISROAMING = "gsm.operator.isroaming"
Global Const $PROPERTY_DATA_NETWORK_TYPE = "gsm.network.type"
Global Const $CURRENT_ACTIVE_PHONE = "gsm.current.phone-type"
Global Const $PROPERTY_SIM_STATE = "gsm.sim.state"
Global Const $PROPERTY_ICC_OPERATOR_NUMERIC = "gsm.sim.operator.numeric"
Global Const $PROPERTY_ICC_OPERATOR_ALPHA = "gsm.sim.operator.alpha"
Global Const $PROPERTY_ICC_OPERATOR_ISO_COUNTRY = "gsm.sim.operator.iso-country"

Global Const $NETWORK_TYPE_UNKNOWN = 0
Global Const $NETWORK_TYPE_GPRS = 1
Global Const $NETWORK_TYPE_EDGE = 2
Global Const $NETWORK_TYPE_UMTS = 3
Global Const $NETWORK_TYPE_CDMA = 4
Global Const $NETWORK_TYPE_EVDO_0 = 5
Global Const $NETWORK_TYPE_EVDO_A = 6
Global Const $NETWORK_TYPE_1xRTT = 7
Global Const $NETWORK_TYPE_HSDPA = 8
Global Const $NETWORK_TYPE_HSUPA = 9
Global Const $NETWORK_TYPE_HSPA = 10
Global Const $NETWORK_TYPE_IDEN = 11
Global Const $NETWORK_TYPE_EVDO_B = 12
Global Const $NETWORK_TYPE_LTE = 13
Global Const $NETWORK_TYPE_EHRPD = 14
Global Const $NETWORK_TYPE_HSPAP = 15

Global Const $NETWORK_CLASS_UNKNOWN = 0
Global Const $NETWORK_CLASS_2_G = 1
Global Const $NETWORK_CLASS_3_G = 2
Global Const $NETWORK_CLASS_4_G = 3

Global Const $PHONE_TYPE_NONE = 0
Global Const $PHONE_TYPE_GSM = 1
Global Const $PHONE_TYPE_CDMA = 2
Global Const $PHONE_TYPE_SIP = 3

Global Const $SIM_STATE_UNKNOWN = 0
Global Const $SIM_STATE_ABSENT = 1
Global Const $SIM_STATE_PIN_REQUIRED = 2
Global Const $SIM_STATE_PUK_REQUIRED = 3
Global Const $SIM_STATE_NETWORK_LOCKED = 4
Global Const $SIM_STATE_READY = 5
; ===============================================================================================================================
