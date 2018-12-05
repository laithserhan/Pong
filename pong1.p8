pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
padx=52
pady=122
padw=24
padh=4

score=0
lives=3
playing=false
intromusic=0

-- balletje
ballx=64
bally=64
ballsize=3
ballxdir=5
ballydir=-3

function _init()
 intromusic=1
 playing=false
end

function welkomscherm()
	cls()
	if intromusic==1 then
	 intromusic=0
	 sfx(0)
	end
 print("tijdreizen met science4kids",2,14,kleur)
 print("pong 20180930 door michiel",10,20,3)
 print("",28,20,3)
 print("🅾️ (z) om te start",2,48,14)
 -- print ("intromusic=".. intromusic,2,55,8)
 spr(2,64,50)
 if btn(4) then
  playing=true
  reset()
 end
end

function movepaddle()
 if playing then
  if btn(0) then
  	padx-=3
  elseif btn(1) then
  	padx+=3
  end	
 end
end

function _update()
 if playing then
 	movepaddle()
 	bounceball()
 	losedball()
 	bouncepaddle()
 	moveball()
 end
end

function _draw()
 if playing==true then
 	-- scherm opschonen
 	rectfill(0,0,128,128,3)
 	
 	rectfill(padx,pady,padx+padw,118-4,15)
  print(pady,12,20)
 
 	-- laat score zien
 	print(score, 12, 6, 15)
 	print("pong!", 32, 6, 15)
 	
 	-- teken levens plaatje
  for i=1,lives do
   spr(004, 90+i*8, 4) 
  end
 		
  -- teken balletje
  circfill(ballx,bally,ballsize,15)
 else
  welkomscherm()
 end
end

function moveball()
 ballx+=ballxdir
 bally+=ballydir
end

function bouncepaddle()
 if ballx>=padx and
  ballx<=padx+padw and
  bally>pady then
 	sfx(4)
 	score+=10
  ballydir=-ballydir
 end
end

function bounceball()
 -- naar links
 if ballx < ballsize then
  ballxdir=-ballxdir
  sfx(0)
 end
 
 -- naar rechts
 if ballx > 128-ballsize then
  ballxdir=-ballxdir
  sfx(0)
 end
 
 -- boven
 if bally < ballsize then
  ballydir=-ballydir
  sfx(0)
 end
end
 
function losedball()
 if bally>128-ballsize and playing then
   if lives>0 then -- next life
   sfx(3)
   bally=24
   lives-=1
  else
   -- game over
   ballydir=0
   ballxdir=0
   bally=64
   lives=0
   playing=false
   sfx(5)
  end 
 end
end

function reset()
 padx=52
 pady=122
 padw=24
 padh=4
 
 score=0
 lives=3
 
 -- balletje
 ballx=64
 bally=64
 ballsize=3
 ballxdir=5
 ballydir=-3
 
end

__gfx__
00000000000000000aaa0aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000aca0aca000000000fffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000aaa0aaa00000000fffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000008000000000000fffefff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000000000000008000000000000fffef000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000a0000a00000000000fff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000aaaa0000000000000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011000000c2000e200102001120013200212000e2001020011200132001320015200112001f200212001d200292002b2001120015200000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003c5003b5002f40037500355003350032500325003450036500385003a5003c50023500205001e5001d5001c50000000000001d4002640030400384003b4003b4003a400324002d400264000000000000
00000000000001f7502275026750297502c7502f75033750367503975000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000016350153501335013350000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000a0000101000e1000c0000e300242500e3000c3000e0003d55037550325502e55028550195500b5500555001550000000000000000000000000000000000000000000000000000000000000000000000000000
011200000c2510e252102531125413255212500e2501025411253132511325515252112501f250212521d250292502b2541125015250000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00400240
00 00000000
00 00404040
00 00000200
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000

