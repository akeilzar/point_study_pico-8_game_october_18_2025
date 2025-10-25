-- rotating a line many ways

function _init()
	cls()
	u = 1
	r = 1
	debug = ""
	score = 0
	c1 = 100
	c2 = 100
	c3 = 100
	c4 = 100
end

function _draw()
	circle_2 = {
	x = (r/2)+63+20*sin(0.3*time()/2.27),
	y = (u/2)+63+20*cos(0.3*time()/2)
	}
	-- retracing my steps 
	-- forgetting how to read maths and teaching myself again 
	-- first thing noticed is looking for time() as origin of movement
	-- scaling time by different ratios when dividing
	-- cos as offset sin
	-- "+63 is moving half way across screen 0,0 top left
	-- sine and cos were moving at super small scale so the whole function is increased by multiple "20"
	circle_3 = {
	x = (r/2)+63+40*sin(0.3*time()/3),
	y = (u/2)+63-40*cos(0.3*time()/3.65)
	}
	circle_4 = {
	x = (r/2)+63-60*sin(0.3*time()/2.27),
	y = (u/2)+63-60*cos(0.3*time()/2)
	}
	circle_1 = {
	x = r + 63-8*sin(0.3*time()/3),
	y = u + 63+8*cos(0.3*time()/3.65)
	}
	line(circle_1.x,circle_1.y,circle_2.x,circle_2.y,7)
	line(circle_1.x,circle_1.y,circle_3.x,circle_3.y,7)
	--line(circle_1.x,circle_1.y,circle_4.x,circle_4.y,7)
	-- there are lines showing distance between the player at "_1" and each other object
	-- 
	-- centre lines
	--
	line(circle_1.x,circle_1.y,63,63,7)
	line(circle_2.x,circle_2.y,63,63,7)
	line(circle_3.x,circle_3.y,63,63,7)
	--line(circle_4.x,circle_4.y,63,63,7)
	-- we also thought that (63,63) centre of screen would be another nice place to have some lines to see appearance of ratios
	--
	-- player
	--
	circfill(circle_1.x,circle_1.y,3,7)
	--debug=64-ln_len(circle_1.x,63,circle_1.y,63)
	--
	-- x1 is (1) circle (2) midpoint etc
	--
	circ(circle_2.x,circle_2.y,5,7)
	-- circ(circle_3.x,circle_3.y,5,7) -- muted
	-- so here x,y,size is 5, and 7 is white
	--circ(circle_4.x,circle_4.y,5,7)
	--
	-- muting these circle to see how my attention style changes
	-- circ(63,63,63,7)
	-- circ(63,63,60,7)
	--
	
	-- end of game cases 
	c1 = 64-ln_len(circle_1.x,63,circle_1.y,63) -- this is the "partial-condition" "out-of-case-condition" if u like
	-- c1 is raising the question, what is the length of the path to the centre? now, the distance from the centre to the outer enclosing circle is near 64
	-- below we will say if less than 7 restart the game
	-- now i'm going to mute this case below to move the example in a new direction
	-- out of curiosity looking to also mute circle 4 references
	c2 = ln_len(circle_1.x,circle_2.x,circle_1.y,circle_2.y)
	c3 = ln_len(circle_1.x,circle_3.x,circle_1.y,circle_3.y)
	-- for c3 wondering what is the distance to the centre? "c5"
	smaller = 10
	c5 = ln_len(63,circle_3.x,63,circle_3.y)/smaller
	-- add me to c3 size
	circ(circle_3.x,circle_3.y,5+c5,7)
	--c4 = ln_len(circle_1.x,circle_4.x,circle_1.y,circle_4.y)
end

function ln_len(x1,x2,y1,y2)
	sq1 = (x2-x1)^2
	sq2 = (y2-y1)^2
	sqr3 = sqrt(sq1+sq2)
	return sqr3
end
-- a2 b2 c2 pyth and distance here to collision usually

function _update()
	cls()
	score += 0.0271
	--print(debug)
	--print("s: ".. flr(score),20,50)


	-- so here is a simple table of cases and conditions described previously
	-- wanting to know above "what is the distance between 2 points" and then here keep track if less half of the initial definition of 
	-- a non-player's size
	--if (c1 < 7) then
		--run()
	--end
	if (c2 < 7) then
		run()
	end
	if (c3 < 7 + smaller/2) then
		run()
	end
	if (c4 < 7) then
		run()
	end


	
	if btn(1) then
		r += 3
	end
	if btn(0) then
		r -= 3
	end
	if btn(3) then
		u += 3
	end
	if btn(2) then
		u -= 3
	end
	-- if length of line 
	-- beween origin and player 
	-- > large circle radius 
	-- so it ends
	-- if length of line between 
	-- player and any of the three
	-- linked circles is less 
	-- player radius you too
	-- ends
	if btn(5) then
		run()
	end
end
