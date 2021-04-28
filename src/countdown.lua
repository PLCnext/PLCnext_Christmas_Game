-- ***********************************************************************************************************************
-- THIS IS THE CODE FOR THE COUNTDOWN
-- ***********************************************************************************************************************
 
countdown = {}	-- create countdown table


-- ***********************************************************************************************************************

function countdown:load()

	-- initialize start flags
	countdown_started = false
	time_until_start  = 3
end

-- ***********************************************************************************************************************

function countdown:update(dt)

	-- create countdown
	if countdown_started == false then
		start_time 	   = os.time()
		countdown_started = true
	else 
		local duration   = os.time() - start_time
		time_until_start = 3 - duration
	end
	
end

-- ***********************************************************************************************************************

function countdown:draw()
	
	-- set font
	love.graphics.setFont(fonts.countdown)	
	
	-- define countdown position
	local counter  = {}
	counter.text   = love.graphics.newText(fonts.countdown, time_until_start)
	counter.width  = counter.text:getWidth()
	counter.height = counter.text:getHeight()
	counter.x      = love.graphics.getWidth()/2  - counter.width/2
	counter.y      = love.graphics.getHeight()/2 - counter.height/2
	
	-- print countdown if time until game start > 0
	if time_until_start >= 0 then
		
		-- show countdown		
		love.graphics.printf(time_until_start, counter.x , counter.y, counter.width, 'center')
		
	end
	
end
