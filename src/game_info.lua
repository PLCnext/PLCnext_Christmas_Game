-- ***********************************************************************************************************************
-- THIS IS THE CODE FOR THE START SEQUENCE WITH COUNTDOWN
-- ***********************************************************************************************************************
 
game_info = {}	-- create start sequence table


function game_info:load()

	-- arrow keys image
	arrow_keys  = love.graphics.newImage("assets/img/arrow_keys_130px.png")
end

-- ***********************************************************************************************************************

function game_info:update(dt)

	-- show game desciption for first time and until 'Enter' was pressed
	if love.keyboard.isDown("return") then
		game_info_shown = true
	end	
	
end

-- ***********************************************************************************************************************

function game_info:draw()
	
	-- show game description
	if game_info_shown == false then
			
		-- set color to white
		love.graphics.setColor(255/255, 255/255, 255/255, 255/255)

		-- set font
		love.graphics.setFont(fonts.info)
		
		-- create table for game description text
		local description = {}
		description.line1 	= "You have 30 seconds ... "
		description.line2 	= "Move the laptop with the arrow keys to catch"
		description.line3	= "as many PLCnext Control devices as possible."
		description.line4 	= "For each AXC F 2152 you get one point," 
		description.line5	= "for each RFC 4072S even two points."
		description.line6   = "But beware of the snowman." 
		description.line7   = "He will take points away from you."
		description.x		= 20
		description.y		= 20
		
		-- display first lines of the game description
		love.graphics.print(description.line1, description.x, description.y)
		description.y = description.y + 60
		love.graphics.print(description.line2, description.x, description.y)
		description.y = description.y + 40
		love.graphics.print(description.line3, description.x, description.y)
		
		-- show laptop and keys
		love.graphics.draw(player_images.front, 3*love.graphics.getWidth()/4 - 100, description.y - 40)
		love.graphics.draw(arrow_keys,          3*love.graphics.getWidth()/4 + 100, description.y - 40)
		
		
		-- explain plus points
		description.y = description.y + 160
		love.graphics.print(description.line4, description.x, description.y)
		description.y = description.y + 40
		love.graphics.print(description.line5, description.x, description.y)
		
		-- show PLCnext Control devices
		love.graphics.draw(goal_images.type1, 3*love.graphics.getWidth()/4 - 100, description.y)
		love.graphics.draw(goal_images.type2, 3*love.graphics.getWidth()/4 + 100, description.y)
		love.graphics.setColor(150/255, 190/255, 13/255) -- green
		love.graphics.print("+ 1", 3*love.graphics.getWidth()/4 - 30  , description.y + 20)
		love.graphics.print("+ 2", 3*love.graphics.getWidth()/4 + 200 , description.y + 20)
		
		-- explain minus points 
		love.graphics.setColor(255/255, 255/255, 255/255) -- white
		description.y = description.y + 160
		love.graphics.print(description.line6, description.x, description.y)
		description.y = description.y + 40
		love.graphics.print(description.line7, description.x, description.y)
		
		-- show snowman
		love.graphics.draw(enemy_image, 3*love.graphics.getWidth()/4 - 100 , description.y)
		love.graphics.setColor(150/255, 190/255, 13/255) -- green
		love.graphics.print("- 1", 3*love.graphics.getWidth()/4 + 20 , description.y + 20)
		
		
		-- expain how to start game	
		love.graphics.print(">> Press 'Enter' to start the game", 10, love.graphics.getHeight() - 50)
		
		-- set color to white
		love.graphics.setColor(255/255, 255/255, 255/255, 255/255)	
		
	end
		
end
