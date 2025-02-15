set tv ntsc
 set romsize 4k


 rem **************************************************************************
 rem Setup: 
 rem - set initial values
 rem **************************************************************************
 COLUBK = $0F
 score = 00000 :  scorecolor = $08

 const true = 1
 const false = 0

 dim player0frame = x
 dim player1frame = z
 dim newbackground = y
 dim loopcounter = w
 dim channnel0duration = v
 dim channnel1duration = u
 dim player0size = t
 dim player1size = s
 dim player0realcolor = r
 dim player1realcolor = q
 dim player0animation = p
 dim player1animation = o
 dim framecounter = n

 newbackground = 1

 player0x = 75 : player0y = 75
 player1x = 75 : player1y = 25
 ballx = 0 : bally = 0

 player1realcolor = $80
 player0realcolor = $40
 player1size = $30
 player0size = $30
 COLUBK = $C4
 COLUPF = $0E
 player0animation = 1

  rem **************************************************************************
  rem Event: system_start.
  rem **************************************************************************
system_start_begin

system_start_end

fullgameloop

  rem **************************************************************************
  rem Event: title_start.
  rem **************************************************************************
title_start_begin
  newbackground = 2
  COLUBK = 2
  player0y = 0
  player1y = 0
title_start_end

  rem **************************************************************************
  rem Event: title_update.
  rem **************************************************************************
title_update_begin
  gosub commongamelogic
  drawscreen
  if joy0fire then goto _if_1 else goto _if_1_end
_if_1
  goto gameplay_start_begin
_if_1_end
  goto title_update_begin
title_update_end

  rem **************************************************************************
  rem Event: gameplay_start.
  rem **************************************************************************
gameplay_start_begin
  newbackground = 3
  COLUBK = 80
  player0y = 90
  player1y = 10
gameplay_start_end

 rem **************************************************************************
 rem Main loop: 
 rem **************************************************************************
main

 gosub commongamelogic
 drawscreen

 rem **************************************************************************
 rem Code generated by vcs-game-maker.
 rem **************************************************************************

  dim Ball_X_Speed = a
  dim Ball_Y_Speed = b



  if joy0right then goto _if_2 else goto _if_2_end
_if_2
  player0x = player0x + 3
_if_2_end

  if joy0left then goto _if_3 else goto _if_3_end
_if_3
  player0x = player0x  -3
_if_3_end

  if joy1right then goto _if_4 else goto _if_4_end
_if_4
  player1x = player1x + 1
_if_4_end

  if joy1left then goto _if_5 else goto _if_5_end
_if_5
  player1x = player1x  -1
_if_5_end
  ballheight = 1

  if !Ball_Y_Speed then goto _if_6 else goto _if_6_end
_if_6
  Ball_X_Speed = 0
  Ball_Y_Speed = 1
  ballx = 80
  bally = 64
  ballheight = 1
_if_6_end
  bally = bally + Ball_Y_Speed

  if collision(playfield, ball) then goto _if_7 else goto _if_7_end
_if_7
  if Ball_Y_Speed < 2 then goto _if_8 else goto _if_8_end
_if_8
  Ball_Y_Speed = 255
  goto _if_8_else_end
_if_8_end

  Ball_Y_Speed = 1

_if_8_else_end
  bally = bally + Ball_Y_Speed
  bally = bally + Ball_Y_Speed
_if_7_end
  

 rem **************************************************************************
 rem End of generated code.
 rem **************************************************************************

 goto main
 
  rem **************************************************************************
  rem Event: gameover_start.
  rem **************************************************************************
gameover_start_begin

gameover_start_end

  rem **************************************************************************
  rem Event: gameover_update.
  rem **************************************************************************
gameover_update_begin

gameover_update_end

 goto fullgameloop

 rem **************************************************************************
 rem Common game logic subroutine.
 rem **************************************************************************

commongamelogic

 framecounter = framecounter + 1

 rem **************************************************************************
 rem Sound handling.
 rem **************************************************************************

 if channnel0duration = 1 then AUDV0 = 0
 if channnel0duration <> 0 then channnel0duration = channnel0duration - 1

 if channnel1duration = 1 then AUDV1 = 0
 if channnel1duration <> 0 then channnel1duration = channnel1duration - 1


 rem **************************************************************************
 rem - Draws the screen and handles user input. Moves the sprites and
 rem - the ball's position and handles collisions
 rem **************************************************************************
 COLUP1 = player1realcolor
 COLUP0 = player0realcolor
 NUSIZ0 = player0size
 NUSIZ1 = player1size

 rem **************************************************************************
 rem Backgrounds generated by vcs-game-maker.
 rem **************************************************************************

 if newbackground = 0 then goto backgroundchangeend
 if newbackground <> 2 then goto background2end
 playfield:
  ................................
  ................................
  ....XXXX........................
  ....X...X.......................
  ....X...X.......................
  ....XXXX..XXXXX..X.XXX...XXX....
  ....X....X.....X.XX...X.X.......
  ....X....X.....X.X....X.X...X...
  ....X.....XXXXX..X....X..XXX....
  ................................
  ................................
end
background2end

 if newbackground <> 3 then goto background3end
 playfield:
  X.............................X.
  X.............................X.
  X.............................X.
  X.............................X.
  X.............................X.
  X.............................X.
  X.............................X.
  X.............................X.
  X.............................X.
  X.............................X.
  X.............................X.
end
background3end
backgroundchangeend
 newbackground = 0

 rem **************************************************************************
 rem Animations generated by vcs-game-maker.
 rem **************************************************************************

   rem Animations for player0:


player0animation0Start

  rem Animation 0 Player 1 Paddle for player0:

  player0frame = player0frame + 1
  if player0frame = 10 then player0frame = 0

  if player0frame > 10 then goto player0animation0frame0End
  player0:
  %00000000
  %00000000
  %00000000
  %11111111
  %11111111
  %00000000
  %00000000
  %00000000
end
  goto player0animation0animationEnd
player0animation0frame0End

player0animation0animationEnd
  goto player0animationsEnd

player0animationsEnd


  rem Animations for player1:


player1animation0Start

  rem Animation 0 Player 2 Paddle for player1:

  player1frame = player1frame + 1
  if player1frame = 10 then player1frame = 0

  if player1frame > 10 then goto player1animation0frame0End
  player1:
  %00000000
  %00000000
  %00000000
  %11111111
  %11111111
  %00000000
  %00000000
  %00000000
end
  goto player1animation0animationEnd
player1animation0frame0End

player1animation0animationEnd
  goto player1animationsEnd

player1animationsEnd

 return