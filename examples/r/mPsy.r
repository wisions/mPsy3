
require('rjson')
require('httpRequest')

mpsy_cmd = function(x,params=list())
{
    data = '[]'
    if (length(params) > 0) data = toJSON(params)
    s = simplePostToHost('localhost',sprintf('/%s',x),datatosend=data,port=5000)
    strsplit(s,'\r\n\r\n')[[1]][2]
}

mpsy_info = function(x) { fromJSON(mpsy_cmd('info')) }
mpsy_alive = function(x) { fromJSON(mpsy_cmd('alive')) }
mpsy_quit = function(x) { simplePostToHost('localhost','/quit',datatosend='[]',port=5000) }
mpsy_events = function(x) { fromJSON(mpsy_cmd('events')) }

Params = function(...) { list(...) } #as.list(substitute(list(...)))[-1L] }
copy_params = function(p, ...)
{ 
    s = list(...) #s = as.list(substitute(list(...)))[-1L]
    for (n in names(s)) { p[n] <- s[n] }
    p
}

rads = function(x) { pi*x/180.0 }
degs = function(x) { 180.0*x/pi }
angle = function(x) { Im(log(x))}

vpfunc = function(name,args) { list(type='call',name=name,args=args) }
Grating = function(pos,params) { vpfunc('Grating',list(pos,params)) }
DotLattice = function(pos,params) { vpfunc('DotLattice',list(pos,params)) }
Text = function(pos,params) {  vpfunc('Text',list(pos,params)) }
Dot = function(pos,params) {  vpfunc('Dot',list(pos,params)) }
Pill = function(pos,params) {  vpfunc('Pill',list(pos,params)) }
Trial = function(name,stimuli,duration,keys=list(),mouse=1) { vpfunc('Trial',list(name,stimuli,duration,keys,mouse)) }

set_trials = function(x) { mpsy_cmd('set_trials',x) }
add_trials = function(x) { mpsy_cmd('add_trials',x) }

key.SPACE = 32
key.EXCLAMATION = 33
key.DOUBLEQUOTE = 34
key.POUND = 35
key.DOLLAR = 36
key.PERCENT = 37
key.AMPERSAND = 38
key.APOSTROPHE = 39
key.PARENLEFT = 40
key.PARENRIGHT = 41
key.ASTERISK = 42
key.PLUS = 43
key.COMMA = 44
key.MINUS = 45
key.PERIOD = 46
key.SLASH = 47
key.key_0 = 48
key.key_1 = 49
key.key_2 = 50
key.key_3 = 51
key.key_4 = 52
key.key_5 = 53
key.key_6 = 54
key.key_7 = 55
key.key_8 = 56
key.key_9 = 57
key.COLON = 58
key.SEMICOLON = 59
key.LESS = 60
key.EQUAL = 61
key.GREATER = 62
key.QUESTION = 63
key.AT = 64
key.BRACKETLEFT = 91
key.BACKSLASH = 92
key.BRACKETRIGHT = 93
key.ASCIICIRCUM = 94
key.UNDERSCORE = 95
key.QUOTELEFT = 96
key.A = 97
key.B = 98
key.C = 99
key.D = 100
key.E = 101
key.F = 102
key.G = 103
key.H = 104
key.I = 105
key.J = 106
key.K = 107
key.L = 108
key.M = 109
key.N = 110
key.O = 111
key.P = 112
key.Q = 113
key.R = 114
key.S = 115
key.T = 116
key.U = 117
key.V = 118
key.W = 119
key.X = 120
key.Y = 121
key.Z = 122
key.BRACELEFT = 123
key.BAR = 124
key.BRACERIGHT = 125
key.ASCIITILDE = 126
key.BACKSPACE = 65288
key.TAB = 65289
key.LINEFEED = 65290
key.CLEAR = 65291
key.RETURN = 65293
key.PAUSE = 65299
key.SCROLLLOCK = 65300
key.SYSREQ = 65301
key.ESCAPE = 65307
key.HOME = 65360
key.LEFT = 65361
key.UP = 65362
key.RIGHT = 65363
key.DOWN = 65364
key.PAGEUP = 65365
key.PAGEDOWN = 65366
key.END = 65367
key.BEGIN = 65368
key.SELECT = 65376
key.PRINT = 65377
key.EXECUTE = 65378
key.INSERT = 65379
key.UNDO = 65381
key.REDO = 65382
key.MENU = 65383
key.FIND = 65384
key.CANCEL = 65385
key.HELP = 65386
key.BREAK = 65387
key.MODESWITCH = 65406
key.NUMLOCK = 65407
key.NUM_SPACE = 65408
key.NUM_TAB = 65417
key.NUM_ENTER = 65421
key.NUM_F1 = 65425
key.NUM_F2 = 65426
key.NUM_F3 = 65427
key.NUM_F4 = 65428
key.NUM_HOME = 65429
key.NUM_LEFT = 65430
key.NUM_UP = 65431
key.NUM_RIGHT = 65432
key.NUM_DOWN = 65433
key.NUM_PRIOR = 65434
key.NUM_NEXT = 65435
key.NUM_END = 65436
key.NUM_BEGIN = 65437
key.NUM_INSERT = 65438
key.NUM_DELETE = 65439
key.NUM_MULTIPLY = 65450
key.NUM_ADD = 65451
key.NUM_SEPARATOR = 65452
key.NUM_SUBTRACT = 65453
key.NUM_DECIMAL = 65454
key.NUM_DIVIDE = 65455
key.NUM_0 = 65456
key.NUM_1 = 65457
key.NUM_2 = 65458
key.NUM_3 = 65459
key.NUM_4 = 65460
key.NUM_5 = 65461
key.NUM_6 = 65462
key.NUM_7 = 65463
key.NUM_8 = 65464
key.NUM_9 = 65465
key.NUM_EQUAL = 65469
key.F1 = 65470
key.F2 = 65471
key.F3 = 65472
key.F4 = 65473
key.F5 = 65474
key.F6 = 65475
key.F7 = 65476
key.F8 = 65477
key.F9 = 65478
key.F10 = 65479
key.F11 = 65480
key.F12 = 65481
key.F13 = 65482
key.F14 = 65483
key.F15 = 65484
key.F16 = 65485
key.F17 = 65486
key.F18 = 65487
key.F19 = 65488
key.F20 = 65489
key.FUNCTION = 65490
key.LSHIFT = 65505
key.RSHIFT = 65506
key.LCTRL = 65507
key.RCTRL = 65508
key.CAPSLOCK = 65509
key.LMETA = 65511
key.RMETA = 65512
key.LALT = 65513
key.RALT = 65514
key.LWINDOWS = 65515
key.RWINDOWS = 65516
key.LCOMMAND = 65517
key.RCOMMAND = 65518
key.LOPTION = 65519
key.ROPTION = 65520
key.DELETE = 65535
