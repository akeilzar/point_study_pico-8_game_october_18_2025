-- rotating a line many ways

function _init()
	cls()
	u = 1
	r = 1
	-- up / right
	debug = ""
	score = 0
	c1 = 100
	c2 = 100
	c3 = 100
	c4 = 100
	-- c : case end distances ... if less than x you may restart
end

function _draw()
	circle_2 = {
	x = (r/2)+63+20*sin(0.3*time()/2.27),
	y = (u/2)+63+20*cos(0.3*time()/2)
	}
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
	line(circle_1.x,circle_1.y,circle_4.x,circle_4.y,7)
	-- 
	-- centre lines
	--
	line(circle_1.x,circle_1.y,63,63,7)
	line(circle_2.x,circle_2.y,63,63,7)
	line(circle_3.x,circle_3.y,63,63,7)
	line(circle_4.x,circle_4.y,63,63,7)
	--
	-- player
	--
	circfill(circle_1.x,circle_1.y,3,7)
	--debug=64-ln_len(circle_1.x,63,circle_1.y,63)
	--
	-- x1 is (1) circle (2) midpoint etc
	--
	circ(circle_2.x,circle_2.y,5,7)
	circ(circle_3.x,circle_3.y,5,7)
	circ(circle_4.x,circle_4.y,5,7)
	--
	circ(63,63,63,7)
	circ(63,63,60,7)
	--
	
	-- end of game cases 
	c1 = 64-ln_len(circle_1.x,63,circle_1.y,63)
	c2 = ln_len(circle_1.x,circle_2.x,circle_1.y,circle_2.y)
 c3 = ln_len(circle_1.x,circle_3.x,circle_1.y,circle_3.y)
	c4 = ln_len(circle_1.x,circle_4.x,circle_1.y,circle_4.y)
end

function ln_len(x1,x2,y1,y2)
	sq1 = (x2-x1)^2
	sq2 = (y2-y1)^2
	sqr3 = sqrt(sq1+sq2)
	return sqr3
end

function _update()
	cls()
	score += 0.0271
	--print(debug)
	print("s: ".. flr(score),20,50)
	if (c1 < 7) then
		run()
	end
	if (c2 < 7) then
		run()
	end
	if (c3 < 7) then
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
	-- than player radius you to
	-- ends
	if btn(5) then
		run()
	end
end


