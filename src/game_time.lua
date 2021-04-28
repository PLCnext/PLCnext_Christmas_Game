-- ***********************************************************************************************************************
-- THIS IS THE CODE FOR THE GAME TIME
-- ***********************************************************************************************************************

game_time = {} -- create game_time table


-- ***********************************************************************************************************************

function game_time:load()

	-- initialize
	game_started	= false
	remaining_time	= 30
	score		= 0

end

-- ***********************************************************************************************************************

function game_time:update()

	-- calculate remaining time
	if game_started == false then
		game_start 	= os.time()
		game_started 	= true
	else
		local duration = os.time() - game_start
		remaining_time = 30 - duration
	end

end

-- ***********************************************************************************************************************

function game_time:draw()
	
	if remaining_time > 0 then	
		-- print remaining time in blue
		local str_remaining_time = string.format("%." .. 1 .. "f", remaining_time)
		love.graphics.setColor(255/255, 255/255, 255/255) -- white
		love.graphics.setFont(fonts.time)
		love.graphics.print("TIME : " .. str_remaining_time .. "s", 120, 10)
	
	else				
		
		-- show 0.0s 
		love.graphics.setFont(fonts.time)
		love.graphics.print("TIME: 0.0s" , 120, 10)
		
		-- show result block in screen center
		love.graphics.setColor(150/255, 190/255, 13/255) -- green
		love.graphics.rectangle("fill", love.graphics.getWidth()/2 - 500, love.graphics.getHeight()/2 - 45, 1000, 90 )
		
		-- show result in result block
		love.graphics.setColor(0/255, 0/255, 0/255) -- black
		love.graphics.setFont(fonts.result)
		local result  = {}
		result.text   = love.graphics.newText(fonts.result, "YOUR SCORE : " .. score )
		result.width  = result.text:getWidth()
		result.height = result.text:getHeight()
		result.x      = love.graphics.getWidth()/2  - result.width/2
		result.y      = love.graphics.getHeight()/2 - result.height/2
		love.graphics.printf("YOUR SCORE : " .. score, result.x , result.y, result.width, 'center')
		
		-- write how to retry
		love.graphics.setColor(150/255, 190/255, 13/255) -- green
		love.graphics.setFont(fonts.info)
		love.graphics.print(" >>  Press 'Enter' to retry", 10, love.graphics.getHeight() - 50)
		
	end

end
